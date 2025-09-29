package com.apple.app.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalTime;

@Data @AllArgsConstructor @NoArgsConstructor
public class LoginDto {
    private int id;
    private String emailNPh;
    private String password;
    private LocalDate loginDate;
    private LocalTime loginTime;
}
