package com.apple.app.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import java.util.Random;

@Component
public class OtpSend {

    @Autowired
    JavaMailSender mailSender;

    public String otpGenerator(){
        Random random=new Random();
        int randomNumber = random.nextInt(999999);
        String otp = String.valueOf(randomNumber);
        return otp;
    }
    public String sendSimpleMessage( String email) {
        SimpleMailMessage message = new SimpleMailMessage();
            String otp = otpGenerator();
            System.err.println(otp);
            message.setFrom("manoj65293@gmail.com");
            message.setTo(email);
            message.setSubject("");
            message.setText("Your one time password is:"+otp);
            mailSender.send(message);
            return otp;
           }

}
