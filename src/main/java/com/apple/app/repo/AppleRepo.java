package com.apple.app.repo;

import com.apple.app.dto.AppleDto;
import com.apple.app.entity.AppleEntity;
import com.apple.app.entity.LoginEntity;
import org.springframework.stereotype.Repository;


public interface AppleRepo {
    boolean dataSaved(AppleEntity appleEntity);

    AppleEntity emailAvaliability(String email);

    AppleEntity phoneAvaliability(String phone);

    boolean loginDetails(LoginEntity entity);

    AppleEntity passwordAvaliablitiy(String password);

    boolean updateUser(AppleEntity entity);

    void resetOtp();


//    boolean updateUserPassword(AppleEntity entity);

}
