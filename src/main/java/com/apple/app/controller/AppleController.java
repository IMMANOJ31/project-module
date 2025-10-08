package com.apple.app.controller;

import com.apple.app.dto.AppleDto;
import com.apple.app.util.OtpSend;
import org.apache.commons.io.IOUtils;
import org.springframework.http.ResponseEntity;
import com.apple.app.service.AppleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;


@Controller
@RequestMapping("/")
public class AppleController {

    @Autowired
    AppleService service;

    @Autowired
    OtpSend emailSend;

    private static final String UPLOAD_FILE  = "C:/Users/Manoj Kumar/IdeaProjects/modules/apple-showroom/src/main/webapp/resource/userImages";
    @PostMapping("registerUser")
    public String saveUserDetails(@Valid AppleDto appleDto) {
        service.userSaved(appleDto);
        return "index";
    }

    @GetMapping("doesEmailExist")
    public ResponseEntity<String> emailExist(@RequestParam("email") String email) {
        if (email != null) {
            AppleDto appleDto = service.checkEmail(email);
            if (appleDto != null) {
                return ResponseEntity.ok("Email already in use");
            }
            return ResponseEntity.ok("Email not available");
        }
        return ResponseEntity.ok("Email not available");
    }

    @GetMapping("doesPhoneExist")
    public ResponseEntity<String> phoneExist(@RequestParam("phoneNumber") String phone) {
        if (phone != null) {
            AppleDto appleDto = service.checkPhone(phone);
            if (appleDto != null) {
                return ResponseEntity.ok("Phone number is already used");
            }
            return ResponseEntity.ok("Phone number not available");
        }
        return ResponseEntity.ok("Phone number not available");
    }


    @PostMapping("loginPage")
    public String loginEmail(@RequestParam("emailNPh") String emailNPh, @RequestParam("password") String password, HttpSession httpSession ,Model model) {
        System.out.println(password + "login passworddd");
        String validUser = service.checkMailAndPassword(emailNPh, password);

        if (validUser.equals("nullError")) {
            model.addAttribute("email", emailNPh);
            model.addAttribute("nullError", "please enter data");
            return "login";
        }
        if (validUser.equals("noDataError")) {
            model.addAttribute("email", emailNPh);
            model.addAttribute("nullError", "please enter registerd  mail or phone ");
            return "login";
        }
        if (validUser.equals("passwordError")) {
            model.addAttribute("email", emailNPh);
            model.addAttribute("nullError", "password is wrong");
            return "login";
        }
        if (validUser.equals("dbError")) {
            model.addAttribute("email", emailNPh);
            model.addAttribute("nullError", "please try again later");
            return "login";
        }
        if (validUser.equals("invalidDataError")) {
            model.addAttribute("email", emailNPh);
            model.addAttribute("nullError", "please use Registered  email or phone ");
            return "login";
        }
        httpSession.setAttribute("emailNPh",emailNPh);
        return "dummy";
    }

    @PostMapping("sendOtp")
    public String getOtp(@RequestParam("email") String email, Model model) {
        service.sendOtp(email);
        model.addAttribute("inputEmail", email);
        return "forgotPassword";
    }

    @PostMapping("verifyOtp")
    public String verifyOtp(@RequestParam String email, String otp, Model model) {
        String result = service.verifyOtp(email, otp);
        System.out.println(result);
        if (result.equals("nullerror")) {
            return "mailError";
        } else if (result.equals("missmatchError")) {
            model.addAttribute("otpError", "Invalid OTP. Try again");
            model.addAttribute("inputEmail", email);
            return "forgotPassword";
        }
        model.addAttribute("inputEmail", email);
        return "resetPassword";
    }

    @PostMapping("updatePass")
    public String updatePassword(@RequestParam(name = "email") String email,
                                 @RequestParam(name = "password")
                                 String password, Model model) {
        service.updatePass(email, password);
        model.addAttribute("message", "Password updated successfully. Please login.");
        return "login";
    }

    @PostMapping("viewProfile")
    public String updateUser(HttpSession session, Model model) {
        String email = session.getAttribute("email").toString();
        AppleDto appleDto = service.displayUserByEmail(email);
        model.addAttribute("dto", appleDto);
        return "updateUser";
    }

    @PostMapping("validateAndUpdateProfile")
    public String updateUser(AppleDto dto,  Model model){
        service.validateAndUpdate(dto);
       AppleDto appleDto = service.displayUserByEmail(dto.getEmail());
        System.err.println(appleDto.getUserImageName()+"======================================================================");
        System.err.println(appleDto.toString());
        model.addAttribute("dto",appleDto);
        return "viewProfile";
    }

    @GetMapping("displayImage")
    @ResponseBody
    public byte[] displayImage( String email) throws IOException {
        Path path = service.displayUserImg(email);
        return Files.readAllBytes(path);
    }

//    @GetMapping("getImage")
//    public void readImg( String userImageName, HttpServletResponse response){
////        File file = new File(UPLOAD_FILE + userImageName);
//        System.err.println(" service file <-----------------------------------------"+userImageName);
////        System.err.println(file);
////        try{
////            FileInputStream fileInputStream = new FileInputStream(file);
////            InputStream inputStream = new BufferedInputStream(fileInputStream);
////            ServletOutputStream stream = response.getOutputStream();
////            IOUtils.copy(inputStream,stream);
////            response.flushBuffer();
////        }catch (Exception e){
////            System.err.println(e.getMessage());
////        }
//    }

    @PostMapping("updateProfile")
    public String update(HttpSession httpSession, Model model){
        String  emailNPh = httpSession.getAttribute("emailNPh").toString();
        AppleDto appleDto = service.displayUserByEmail(emailNPh);
        model.addAttribute("dto",appleDto);
        return "profileUpdate";
    }
    @GetMapping("profilePage")
    public String viewProfile(HttpSession session, Model model){
        String  emailNPh = session.getAttribute("emailNPh").toString();
        AppleDto appleDto = service.displayUserByEmail(emailNPh);
        model.addAttribute("dto",appleDto);
        return "viewProfile";
    }

}
