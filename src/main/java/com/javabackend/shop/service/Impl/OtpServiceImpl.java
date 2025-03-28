package com.javabackend.shop.service.Impl;

import com.javabackend.shop.entity.OtpEntity;
import com.javabackend.shop.entity.UserEntity;
import com.javabackend.shop.repository.OtpRepository;
import com.javabackend.shop.service.IOtpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.Random;

@Service
public class OtpServiceImpl implements IOtpService {
    @Autowired
    private OtpRepository otpRepository;
    @Override
    public String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }

    @Override
    public void saveOTP(UserEntity user, String otp) {
        OtpEntity otpEntity = new OtpEntity();
        otpEntity.setCode(otp);
        otpEntity.setExpiresAt(LocalDateTime.now().plusMinutes(2));
        otpEntity.setCreatedDate(LocalDateTime.now());
        otpEntity.setUserEntity(user);
        otpRepository.save(otpEntity);
    }

    @Override
    public boolean validateOTP(UserEntity user, String otp) {
        Optional<OtpEntity> otpEntity = otpRepository.findAllByUserEntity(user);
        return otpEntity.isPresent()
                && otpEntity.get().getCode().equals(otp)
                && LocalDateTime.now().isBefore(otpEntity.get().getExpiresAt());
    }
}
