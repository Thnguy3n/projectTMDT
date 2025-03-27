package com.javabackend.shop.service;

import com.javabackend.shop.entity.UserEntity;

public interface IOtpService {
    String generateOTP();
    void saveOTP(UserEntity user, String otp);
    boolean validateOTP(UserEntity user, String otp);
}
