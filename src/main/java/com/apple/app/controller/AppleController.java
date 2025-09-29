package com.apple.app.controller;

import com.apple.app.dto.AppleDto;
import com.apple.app.util.OtpSend;
import org.springframework.http.ResponseEntity;
import com.apple.app.service.AppleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class AppleController {

    @Autowired
    AppleService service;

    @Autowired
    OtpSend emailSend;

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
    public String loginEmail(@RequestParam("emailNPh") String emailNPh, @RequestParam("password") String password, Model model) {
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

    @PostMapping("updateProfile")
    public String updateUser(AppleDto dto, Model model) {
        service.updateProfile(dto);
        AppleDto appleDto = service.displayUserByEmail(dto.getEmail());
        AppleDto dto1 = service.displayUserByPhone(dto.getPhone());
        model.addAttribute("dto", appleDto);
        return "updateUser";
    }

}
