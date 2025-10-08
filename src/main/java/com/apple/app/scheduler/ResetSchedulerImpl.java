package com.apple.app.scheduler;

import com.apple.app.entity.AppleEntity;
import com.apple.app.repo.AppleRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ResetSchedulerImpl implements ResetScheduler{

    @Autowired
    AppleRepo appleRepo;

    @Override @Scheduled(fixedRate = 50*60*1000)
    public void otpReset() {
        appleRepo.resetOtp();
        System.err.println("Otp reseted!!!");
    }
}
