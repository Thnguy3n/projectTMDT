package com.javabackend.shop.security;

import com.javabackend.shop.converter.UserConverter;
import com.javabackend.shop.entity.RoleEntity;
import com.javabackend.shop.entity.UserEntity;
import com.javabackend.shop.model.dto.UserDTO;
import com.javabackend.shop.repository.RoleRepository;
import com.javabackend.shop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Component
public class CustomOAuth2AuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserConverter userConverter;
    @Autowired
    private RoleRepository roleRepository;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        if (authentication.getPrincipal() instanceof OAuth2User) {
            OAuth2User oauth2User = (OAuth2User) authentication.getPrincipal();
            String email = (String) oauth2User.getAttributes().get("email");
            Integer x =0;
            Optional<UserEntity> userOpt = userRepository.findAllByEmailAndStatusAndLoginType(email,1,"oAuth2Login");
            if (!userOpt.isPresent()) {
                UserDTO userDTO = new UserDTO();
                userDTO.setEmail(email);
                userDTO.setFullName((String) oauth2User.getAttributes().get("name"));
                userDTO.setLoginType("oAuth2Login");
                userDTO.setUserName("not-using"+ UUID.randomUUID().toString());
                userDTO.setPassword("not-using");
                userDTO.setStatus(1);
                userDTO.setRoleCode("CUSTOMER");
                RoleEntity role = roleRepository.findOneByCode(userDTO.getRoleCode());
                UserEntity userEntity = userConverter.convertToEntity(userDTO);
                userEntity.setRoles(Stream.of(role).collect(Collectors.toList()));
                userRepository.save(userEntity);
            }
        }
        response.sendRedirect("/trang-chu");
    }
}
