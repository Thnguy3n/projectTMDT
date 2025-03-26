package com.javabackend.shop.service.Impl;

import com.javabackend.shop.exception.MyException;
import com.javabackend.shop.model.dto.PasswordDTO;
import com.javabackend.shop.model.dto.UserDTO;
import com.javabackend.shop.service.IUserService;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;
import org.springframework.data.domain.Pageable;

public abstract class UserServiceDecorator implements IUserService {

    protected final IUserService userService;

    public UserServiceDecorator(IUserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDTO findOneByUserNameAndStatus(String username, int status) {
        return userService.findOneByUserNameAndStatus(username, status);
    }

    @Override
    public UserDTO findIdByEmail(String email) {
        return userService.findIdByEmail(email);
    }

    @Override
    public UserDTO findOneByUserNameAndStatusAndLoginType(String username, int status, String loginType) {
        return userService.findOneByUserNameAndStatusAndLoginType(username, status, loginType);
    }

    @Override
    public List<UserDTO> getUsers(String searchValue, Pageable pageable) {
        return userService.getUsers(searchValue, pageable);
    }

    @Override
    public int getTotalItems(String searchValue) {
        return userService.getTotalItems(searchValue);
    }

    @Override
    public UserDTO findOneByUserName(String userName) {
        return userService.findOneByUserName(userName);
    }

    @Override
    public UserDTO findUserById(long id) {
        return userService.findUserById(id);
    }

    @Override
    public UserDTO insert(UserDTO userDTO) {
        return userService.insert(userDTO);
    }

    @Override
    public UserDTO update(Long id, UserDTO userDTO) {
        return userService.update(id, userDTO);
    }

    @Override
    public void updatePassword(long id, PasswordDTO passwordDTO) throws MyException {
        userService.updatePassword(id, passwordDTO);
    }

    @Override
    public UserDTO resetPassword(long id) {
        return userService.resetPassword(id);
    }

    @Override
    public UserDTO updateProfileOfUser(String id, UserDTO userDTO) {
        return userService.updateProfileOfUser(id, userDTO);
    }

    @Override
    public void delete(long[] ids) {
        userService.delete(ids);
    }

    @Override
    public List<UserDTO> getAllUsers(Pageable pageable) {
        return userService.getAllUsers(pageable);
    }

    @Override
    public int countTotalItems() {
        return userService.countTotalItems();
    }

    @Override
    public UserDTO addCustomerAccount(UserDTO userDTO) {
        return userService.addCustomerAccount(userDTO);
    }

    @Override
    public UserDTO LoggedinInformation() {
        return userService.LoggedinInformation();
    }

    @Override
    public boolean verifyOtp(String email, String otp) {
        return userService.verifyOtp(email, otp);
    }

    @Override
    public boolean existsByEmail(String email) {
        return userService.existsByEmail(email);
    }

    @Override
    public UserDTO updateProfile(Long id, UserDTO userDTO) {
        return userService.updateProfile(id, userDTO);
    }
}

