package com.javabackend.shop.model.dto;

import com.javabackend.shop.Utils.ValidationEmail;
import com.javabackend.shop.Utils.ValidationPassword;
import com.javabackend.shop.Utils.ValidationUserName;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Data
@ValidationUserName
@ValidationEmail
public class UserDTO extends AbstractDTO  {
    private String userName;
    @NotBlank(message = "Họ tên không được để trống")
    private String fullName;
    @NotBlank(message = "Mật khẩu không được để trống")
    private String password;
    private Integer status;
    @NotBlank(message = "Số điện thoại không được để trống")
    private String phone;
    private String email;
    private List<RoleDTO> roles = new ArrayList<>();
    private String roleName;
    private String roleCode;
    private String loginType;
    private Map<String,String> roleDTOs = new HashMap<>();

}
