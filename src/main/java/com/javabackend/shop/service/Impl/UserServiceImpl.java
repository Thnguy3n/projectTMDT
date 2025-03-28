package com.javabackend.shop.service.Impl;

import com.javabackend.shop.constant.SystemConstant;
import com.javabackend.shop.converter.UserConverter;
import com.javabackend.shop.entity.RoleEntity;
import com.javabackend.shop.entity.UserEntity;
import com.javabackend.shop.exception.MyException;
import com.javabackend.shop.model.dto.MyUserDetail;
import com.javabackend.shop.model.dto.PasswordDTO;
import com.javabackend.shop.model.dto.UserDTO;
import com.javabackend.shop.repository.RoleRepository;
import com.javabackend.shop.repository.UserRepository;
import com.javabackend.shop.service.IEmailService;
import com.javabackend.shop.service.IOtpService;
import com.javabackend.shop.service.IUserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service("userServiceImpl")
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserConverter userConverter;
    @Autowired
    private UserRepository userRepository;
    @Qualifier("roleRepository")
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    @Autowired
    private IOtpService otpService;
    @Autowired
    private IEmailService emailService;

    @Override
    public UserDTO findOneByUserNameAndStatus(String username, int status) {
        return userConverter.convertToDto(userRepository.findOneByUserNameAndStatus(username, status));
    }

    @Override
    public UserDTO findIdByEmail(String email) {
        return userConverter.convertToDto(userRepository.findAllByEmail(email). get());
    }

    @Override
    public UserDTO findOneByUserNameAndStatusAndLoginType(String username, int status, String loginType) {
        return userConverter.convertToDto(userRepository.findOneByUserNameAndStatusAndLoginType(username, status, loginType));
    }

    @Override
    public List<UserDTO> getUsers(String searchValue, Pageable pageable) {
        Page<UserEntity> users = null;
        if (StringUtils.isNotBlank(searchValue)) {
            users = userRepository.findByUserNameContainingIgnoreCaseOrFullNameContainingIgnoreCaseAndStatusNot(searchValue, searchValue, 0, pageable);
        } else {
            users = userRepository.findByStatusNot(0, pageable);
        }
        List<UserEntity> newsEntities = users.getContent();
        List<UserDTO> result = new ArrayList<>();
        for (UserEntity userEntity : newsEntities) {
            UserDTO userDTO = userConverter.convertToDto(userEntity);
            userDTO.setRoleCode(userEntity.getRoles().get(0).getCode());
            result.add(userDTO);
        }
        return result;
    }

    @Override
    public int getTotalItems(String searchValue) {
        int totalItem = 0;
        if (StringUtils.isNotBlank(searchValue)) {
            totalItem = (int) userRepository.countByUserNameContainingIgnoreCaseOrFullNameContainingIgnoreCaseAndStatusNot(searchValue, searchValue, 0);
        } else {
            totalItem = (int) userRepository.countByStatusNot(0);
        }
        return totalItem;
    }

    @Override
    public UserDTO findOneByUserName(String userName) {
        UserEntity userEntity = userRepository.findOneByUserName(userName);
        UserDTO userDTO = userConverter.convertToDto(userEntity);
        return userDTO;
    }

    @Override
    public UserDTO  findUserById(long id) {
        UserEntity entity = userRepository.findById(id).get();
        List<RoleEntity> roles = entity.getRoles();
        UserDTO dto = userConverter.convertToDto(entity);
        roles.forEach(item -> {
            dto.setRoleCode(item.getCode());
        });
        return dto;
    }

    @Override
    @Transactional
    public UserDTO insert(UserDTO userDTO) {
        RoleEntity role = roleRepository.findOneByCode(userDTO.getRoleCode());
        UserEntity userEntity = userConverter.convertToEntity(userDTO);
        userEntity.setRoles(Stream.of(role).collect(Collectors.toList()));
        userEntity.setStatus(1);
        userEntity.setLoginType("WebLogin");
        userEntity.setPassword(passwordEncoder.encode(SystemConstant.PASSWORD_DEFAULT));
        return userConverter.convertToDto(userRepository.save(userEntity));
    }

    @Override
    @Transactional
    public UserDTO update(Long id, UserDTO userDTO) {
        RoleEntity role = roleRepository.findOneByCode(userDTO.getRoleCode());
        UserEntity oldUser = userRepository.findById(id).get();
        UserEntity userEntity = userConverter.convertToEntity(userDTO);
        userEntity.setUserName(oldUser.getUserName());
        userEntity.setStatus(oldUser.getStatus());
        userEntity.setRoles(Stream.of(role).collect(Collectors.toList()));
        userEntity.setPassword(oldUser.getPassword());
        return userConverter.convertToDto(userRepository.save(userEntity));
    }

    @Override
    @Transactional
    public void updatePassword(long id, PasswordDTO passwordDTO) throws MyException {
        UserEntity user = userRepository.findById(id).get();
        if (passwordEncoder.matches(passwordDTO.getOldPassword(), user.getPassword())
                && passwordDTO.getNewPassword().equals(passwordDTO.getConfirmPassword())) {
            user.setPassword(passwordEncoder.encode(passwordDTO.getNewPassword()));
            userRepository.save(user);
        } else {
            throw new MyException(SystemConstant.CHANGE_PASSWORD_FAIL);
        }
    }

    @Override
    @Transactional
    public UserDTO resetPassword(long id) {
        UserEntity userEntity = userRepository.findById(id).get();
        userEntity.setPassword(passwordEncoder.encode(SystemConstant.PASSWORD_DEFAULT));
        return userConverter.convertToDto(userRepository.save(userEntity));
    }

    @Override
    @Transactional
    public UserDTO updateProfileOfUser(String username, UserDTO updateUser) {
        UserEntity oldUser = userRepository.findOneByUserName(username);
        oldUser.setFullName(updateUser.getFullName());
        return userConverter.convertToDto(userRepository.save(oldUser));
    }

    @Override
    @Transactional
    public void delete(long[] ids) {
        for (Long item : ids) {
            UserEntity userEntity = userRepository.findById(item).get();
            userEntity.setStatus(0);
            userRepository.save(userEntity);
        }
    }

    @Override
    public List<UserDTO> getAllUsers(Pageable pageable) {
        List<UserEntity> userEntities = userRepository.getAllUsers(pageable);
        List<UserDTO> results = new ArrayList<>();
        for (UserEntity userEntity : userEntities) {
            UserDTO userDTO = userConverter.convertToDto(userEntity);
            userDTO.setRoleCode(userEntity.getRoles().get(0).getCode());
            results.add(userDTO);
        }
        return results;    }

    @Override
    public int countTotalItems() {
        return userRepository.countTotalItem();
    }



    @Override
    public UserDTO addCustomerAccount(UserDTO userDTO) {
        RoleEntity role = roleRepository.findOneByCode("CUSTOMER");
        UserEntity userEntity = userConverter.convertToEntity(userDTO);
        userEntity.setRoles(Stream.of(role).collect(Collectors.toList()));
        userEntity.setStatus(0);
        userEntity.setLoginType("WebLogin");
        userEntity.setPassword(passwordEncoder.encode(userDTO.getPassword()));
        userRepository.save(userEntity);
        String otpCode = otpService.generateOTP();
        otpService.saveOTP(userEntity, otpCode);
        emailService.sendOtpEmail(userEntity.getEmail(), otpCode);
        return userConverter.convertToDto(userRepository.save(userEntity));
    }
    @Override
    public boolean verifyOtp(String email, String otp) {
        Optional<UserEntity>userEntity= userRepository.findTop1ByEmailOrderByCreatedDateDesc(email);
        if (userEntity.isPresent()&&otpService.validateOTP(userEntity.get(), otp)) {
            userEntity.get().setStatus(1);
            userRepository.save(userEntity.get());
            return true;
        }
        return false;
    }

    @Override
    public boolean existsByEmail(String email) {
        return userRepository.existsByEmailAndStatus(email, 1);
    }

    @Override
    public UserDTO updateProfile(Long id, UserDTO userDTO) {
        UserEntity userEntity = userRepository.findById(id).get();
        userEntity.setFullName(userDTO.getFullName());
        userEntity.setEmail(userDTO.getEmail());
        userEntity.setPhone(userDTO.getPhone());
        return userConverter.convertToDto(userRepository.save(userEntity));
    }

    @Override
    public UserDTO LoggedinInformation() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDTO userDTO = new UserDTO();
        if (authentication.getPrincipal() instanceof MyUserDetail) {
            MyUserDetail userDetails = (MyUserDetail) authentication.getPrincipal();
            userDTO.setId(userDetails.getId());
        }
        //(String) attributes.get("email")).get().getId()
        else if (authentication.getPrincipal() instanceof OAuth2User) {
            OAuth2User oauth2User = (OAuth2User) authentication.getPrincipal();
            Map<String, Object> attributes = oauth2User.getAttributes();
            UserEntity userEntity = userRepository.findUserEntityByEmailAndStatus(attributes.get("email").toString(),1);
            userDTO.setId(userEntity.getId());
        }
        return userDTO;
    }



}
