package com.apple.app.service;

import com.apple.app.dto.AppleDto;

import java.nio.file.Path;


public interface AppleService {

    boolean userSaved(AppleDto appleDto);

    AppleDto checkEmail(String email);

    AppleDto checkPhone(String phone);

    String checkMailAndPassword(String emailNPh, String password);

    AppleDto checkPassword(String password);

    String sendOtp(String email);

    String verifyOtp(String email ,String otp);

    String  updatePass(String email, String password);

    String updateProfile(AppleDto dto);

    AppleDto displayUserByEmail(String email);

    AppleDto displayUserByPhone(String phone);

    Path displayUserImg(String email);
}
