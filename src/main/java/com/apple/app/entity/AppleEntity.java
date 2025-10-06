package com.apple.app.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "apple_store")
@Data
@NamedQueries({
        @NamedQuery(name = "checkEmail",query="select entity from AppleEntity entity where entity.email=:mail"),
        @NamedQuery(name = "phoneCheck",query = "select entity from AppleEntity entity where entity.phone=:ph"),
        @NamedQuery(name = "updatePassword",query = "update AppleEntity entity set entity.password =:pass where entity.email = :email"),
        @NamedQuery(name = "clearOtp",query = "Update AppleEntity u set u.otp = NULL")
})
public class AppleEntity {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private int userId;
    @Column(name = "first_name")
    private String firstName;
    @Column(name = "last_name")
    private String lastName;
    @Column(name = "email",unique = true)
    private String email;
    @Column(name = "phone_number",unique = true)
    private String phone;
    private String dob;
    private String country;
    private String state;
    private String city;
    private String pincode;
    @Column(name = "password")
    private String password;
    @Column(name = "otp")
    private  String  otp;
    @Column(name ="userImageName")
    private String userImageName;
}
