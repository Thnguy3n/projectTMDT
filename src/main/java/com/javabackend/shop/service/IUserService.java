package com.javabackend.shop.service;

import com.javabackend.shop.exception.MyException;
import com.javabackend.shop.model.dto.PasswordDTO;
import com.javabackend.shop.model.dto.UserDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IUserService {
    UserDTO findOneByUserNameAndStatus(String username, int status);
    UserDTO findIdByEmail(String email);
    UserDTO findOneByUserNameAndStatusAndLoginType(String username, int status, String loginType);
    List<UserDTO> getUsers(String searchValue, Pageable pageable);
    int getTotalItems(String searchValue);
    UserDTO findOneByUserName(String userName);
    UserDTO findUserById(long id);
    UserDTO insert(UserDTO userDTO);
    UserDTO update(Long id, UserDTO userDTO);
    void updatePassword(long id, PasswordDTO passwordDTO) throws MyException;
    UserDTO resetPassword(long id);
    UserDTO updateProfileOfUser(String id, UserDTO userDTO);
    void delete(long[] ids);
    List<UserDTO> getAllUsers(Pageable pageable);
    int countTotalItems();
    UserDTO addCustomerAccount(UserDTO userDTO) ;
    UserDTO LoggedinInformation();
    boolean verifyOtp(String email, String otp);
    boolean existsByEmail(String email);
    UserDTO updateProfile(Long id, UserDTO userDTO);
}
