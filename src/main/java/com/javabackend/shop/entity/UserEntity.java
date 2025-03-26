package com.javabackend.shop.entity;

import com.javabackend.shop.Utils.ValidationPassword;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;
@ValidationPassword
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "user")
public class UserEntity extends BaseEntity {

    private static final long serialVersionUID = -4988455421375043688L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "username", nullable = false, unique = true)
    private String userName;

    @Column(name = "fullname", nullable = false)
    private String fullName;

    @Column(name = "password")
    private String password;

    @Column(name = "status", nullable = false)
    private Integer status;

    @Column(name = "email", unique = true)
    private String email;

    @Column(name = "phone", unique = true)
    private String phone;

    @Column(name = "login_type", unique = true)
    private String loginType;

    @OneToOne(mappedBy = "userEntity", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private CartEntity cartEntity;

    @OneToOne(mappedBy = "userEntity", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private OtpEntity otpEntity;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "user_role",
            joinColumns = @JoinColumn(name = "user_id", nullable = false),
            inverseJoinColumns = @JoinColumn(name = "role_id", nullable = false))
    private List<RoleEntity> roles = new ArrayList<>();

    @OneToMany(mappedBy = "userEntity",cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    List<OrderEntity> orderEntities= new ArrayList<>();

}
