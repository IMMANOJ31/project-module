package com.apple.app.service.impl;

import com.apple.app.dto.AppleDto;
import com.apple.app.dto.LoginDto;
import com.apple.app.entity.AppleEntity;
import com.apple.app.entity.LoginEntity;
import com.apple.app.repo.AppleRepo;
import com.apple.app.service.AppleService;
import com.apple.app.util.OtpSend;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalTime;

@Service
public class AppleServiceImpl implements AppleService {

    private static final String UPLOAD_FILE = "C:/Users/Manoj Kumar/IdeaProjects/modules/apple-showroom/src/main/webapp/resource/userImages";

    @Value("${image.storage.path}")
    private  String DEFAULT_FILE ;

    @Autowired
    AppleRepo appleRepo;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    OtpSend otpSend;

    @Override
    public boolean userSaved(AppleDto appleDto) {
        if (!appleDto.getPassword().equals(appleDto.getConfirmPassword())) {
            return false;
        } else {
            appleDto.setPassword(bCryptPasswordEncoder.encode(appleDto.getPassword()));
            AppleEntity appleEntity = new AppleEntity();
            BeanUtils.copyProperties(appleDto, appleEntity);
            return appleRepo.dataSaved(appleEntity);
        }
    }

    @Override
    public AppleDto checkEmail(String email) {
        AppleEntity appleEntity = appleRepo.emailAvaliability(email);
        if (appleEntity == null) {
            System.out.println(appleEntity + " in if");
            return null;
        } else {
            System.out.println(appleEntity + " in else");
            AppleDto appleDto = new AppleDto();
            BeanUtils.copyProperties(appleEntity, appleDto);
            return appleDto;
        }
    }

    @Override
    public AppleDto checkPhone(String phone) {
        AppleEntity appleEntity = appleRepo.phoneAvaliability(phone);
        if (appleEntity == null) {
            return null;
        } else {
            AppleDto appleDto = new AppleDto();
            BeanUtils.copyProperties(appleEntity, appleDto);
            return appleDto;
        }
    }

    @Override
    public AppleDto checkPassword(String password) {
        AppleEntity appleEntity = appleRepo.passwordAvaliablitiy(password);
        if (appleEntity == null) {
            return null;
        } else {
            AppleDto appleDto = new AppleDto();
            BeanUtils.copyProperties(appleEntity, appleDto);
            return appleDto;
        }
    }

    @Override
    public String sendOtp(String email) {
        if (email == null) {
            return "otpIssue";
        }
        if (email.contains("@") && email.contains(".com")) {
            AppleDto dto = checkEmail(email);
            if (dto != null) {
                if (dto.getEmail().equals(email)) {
                    String otp = otpSend.sendSimpleMessage(email);
                    dto.setOtp(otp);
                    System.out.println(otp);
                    AppleEntity entity = new AppleEntity();
                    BeanUtils.copyProperties(dto, entity);
                    boolean isRegister = appleRepo.updateUser(entity);
                    System.out.println(isRegister);
                }
            }
        }
        return "allGood";
    }

    @Override
    public String verifyOtp(String email, String otp) {
        AppleDto appleDto = checkEmail(email);
        System.out.println(appleDto.toString());
        if (appleDto == null) {
            return "nullerror";
        }
        if (!otp.equals(appleDto.getOtp())) {
            return "missmatchError";
        }
        return "allGood";
    }

    @Override
    public String updatePass(String email, String password) {
        if (email == null) {
            return "emailEmpty";
        }
        AppleDto appleDto = checkEmail(email);
        appleDto.setPassword(bCryptPasswordEncoder.encode(password));
        AppleEntity entity = new AppleEntity();
        BeanUtils.copyProperties(appleDto, entity);
        boolean isUpdated = appleRepo.updateUser(entity);
        System.out.println(isUpdated);
        return "allGood";
    }

    @Override
    public String updateProfile(AppleDto dto) {
        if (dto.getFile() == null) {
            return "noFile";
        }
        try {
            MultipartFile file = dto.getFile();
            byte[] bytes = file.getBytes();
            Path path = Paths.get(UPLOAD_FILE + file.getOriginalFilename());
            Files.write(path, bytes);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return "allGood";
    }

    @Override
    public AppleDto displayUserByEmail(String email) {
        AppleEntity appleEntity = appleRepo.emailAvaliability(email);
        AppleDto appleDto = new AppleDto();
        BeanUtils.copyProperties(appleEntity,appleDto);
        return appleDto;
    }

    @Override
    public AppleDto displayUserByPhone(String phone) {
        AppleEntity appleEntity =appleRepo.phoneAvaliability(phone);
        AppleDto appleDto = new AppleDto();
        BeanUtils.copyProperties(appleEntity,appleDto);
        return appleDto;
    }

    @Override
    public String checkMailAndPassword(String emailNPh, String inputPassword) {
        if (emailNPh == null && inputPassword == null) {
            return "nullError";
        }
        if (emailNPh.contains("@") && emailNPh.contains(".com")) {
            AppleDto dto = checkEmail(emailNPh);
            String result = isSaved(emailNPh, inputPassword, dto);
            System.err.println(result);
            return result;
        } else if (emailNPh != null) {
            AppleDto dto = checkPhone(emailNPh);
            String result = isSaved(emailNPh, inputPassword, dto);
            return result;
        }
        return "invalidDataError";
    }

    private String isSaved(String emailNPh, String inputPassword, AppleDto dto) {
        if (dto == null) {
            return "noDataError";
        }
        System.out.println("+++++++++++" + dto);
        System.err.println(inputPassword);
        System.err.println(dto.getPassword());
        boolean matches = bCryptPasswordEncoder.matches(inputPassword, dto.getPassword());
        System.err.println(matches);
        if (!bCryptPasswordEncoder.matches(inputPassword, dto.getPassword())) {
            return "passwordError";
        }
        LoginDto loginDto = mailNPhone(dto, inputPassword, emailNPh);
        LoginEntity entity = new LoginEntity();
        BeanUtils.copyProperties(loginDto, entity);
        boolean email = appleRepo.loginDetails(entity);
        if (!email) {
            return "dbError";
        }
        return "allGood";
    }

    private LoginDto mailNPhone(AppleDto appleDto, String password, String emailNPh) {
        if (appleDto == null) {
            System.out.println("from mailNPhone " + appleDto);
            return null;
        }
        if (appleDto.getPassword() == null && !appleDto.getPassword().trim().equals(password.trim())) {
            return null;
        }
        System.out.println("DB password: " + appleDto.getPassword());
        System.out.println("Entered password: " + password);
        LoginDto dto = new LoginDto();
        dto.setEmailNPh(emailNPh);
        dto.setPassword(password);
        dto.setLoginDate(LocalDate.now());
        dto.setLoginTime(LocalTime.now());
        LoginEntity entity = new LoginEntity();
        BeanUtils.copyProperties(dto, entity);
        return dto;
    }

    @Override
    public Path displayUserImg(String email) {
        AppleEntity user = appleRepo.emailAvaliability(email);
        Path path = Paths.get(UPLOAD_FILE+user.getUserImageName());
        if (!Files.exists(path)) {
            return  Paths.get( DEFAULT_FILE+"defaultUserImg.jpeg");
        }
        return path;
    }
    @Override
    public String validateAndUpdate(AppleDto dto) {
        System.err.println(dto.getUserId() + "ID check <-----------------------------------");
        if (dto == null) {
            return "noDtoError";
        }
        if (dto.getFile() == null) {
            return "noFileError";
        }
        if (!saveImg(dto)) {
            return "fileNotSaved";
        }
        AppleEntity entity = new AppleEntity();
        System.err.println(dto);
        System.err.println("Img in service==============================================");
        BeanUtils.copyProperties(dto, entity);
        entity.setUserImageName(dto.getFile().getOriginalFilename());
        System.err.println(entity);
        appleRepo.updateUser(entity);
        return "noErrors";
    }

    private static boolean saveImg(AppleDto dto){
        MultipartFile fileUpload = dto.getFile();
        System.err.println(fileUpload.getOriginalFilename());
        try {
            byte[] bytes = fileUpload.getBytes();
            Path  path = Paths.get(UPLOAD_FILE + fileUpload.getOriginalFilename());
            Files.write(path,bytes);
            fileUpload.getOriginalFilename();
            return true;
        }catch (IOException e){
            e.printStackTrace();
        }
        return false;
    }

}
