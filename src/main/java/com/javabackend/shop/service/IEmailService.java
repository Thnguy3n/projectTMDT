package com.javabackend.shop.service;

public interface IEmailService {
    void sendOtpEmail(String to, String otp);
}
