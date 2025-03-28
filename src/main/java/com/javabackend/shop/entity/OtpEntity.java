package com.javabackend.shop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "otp")
public class OtpEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "code")
    private String code;
    @Column(name = "used")
    private Integer used;
    @Column(name = "createddate")
    private LocalDateTime createdDate;
    @Column(name = "expiresat")
    private LocalDateTime expiresAt;
    @OneToOne
    @JoinColumn(name = "user_id")
    private UserEntity userEntity;
}
