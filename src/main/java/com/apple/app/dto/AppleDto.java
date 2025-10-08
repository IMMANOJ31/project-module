package com.apple.app.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AppleDto {

    private int userId;

    @NotNull(message = "First name can't be null")
    private String firstName;
    @NotNull(message = "Last name can't be null")
    private String lastName;
    @NotNull(message = "Email can't be null")
    private String email;
    @NotNull(message = "Phone can't be null")
    private String phone;
    @NotNull(message = "DOB can't be null")
    private String dob;
    @NotNull(message = "Gender can't be null")
    private String gender;
    @NotNull(message = "Country can't be null")
    private String country;
    @NotNull(message = "State can't be null")
    private String state;
    @NotNull(message = "City can't be null")
    private String city;
    @NotNull(message = "Pincode can't be null")
    private String pincode;
    @NotNull(message = "Password can't be null")
    private String password;
    @NotNull(message = "Confrim password can't be null")
    private String confirmPassword;

    private String otp;

    private MultipartFile file;

    private String userImageName;
}
