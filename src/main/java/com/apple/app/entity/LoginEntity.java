package com.apple.app.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "login_details")
@Data
public class LoginEntity {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private int userid;
    private String emailNPh;
    private String password;
    private LocalDate loginDate;
    private LocalTime loginTime;

}
