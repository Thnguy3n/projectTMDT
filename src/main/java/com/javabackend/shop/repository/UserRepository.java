package com.javabackend.shop.repository;

import com.javabackend.shop.entity.UserEntity;
import com.javabackend.shop.model.dto.UserDTO;
import com.javabackend.shop.repository.custom.UserRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<UserEntity, Long>, UserRepositoryCustom {
    UserEntity findOneByUserNameAndStatus(String username, int status);
    UserEntity findOneByUserNameAndStatusAndLoginType(String userName, Integer status, String loginType);
    Page<UserEntity> findByUserNameContainingIgnoreCaseOrFullNameContainingIgnoreCaseAndStatusNot(String userName, String fullName, int status,
                                                                                                     Pageable pageable);
    List<UserEntity> findByStatusAndRoles_Code(Integer status, String roleCode);
    Page<UserEntity> findByStatusNot(int status, Pageable pageable);
    long countByUserNameContainingIgnoreCaseOrFullNameContainingIgnoreCaseAndStatusNot(String userName, String fullName, int status);
    long countByStatusNot(int status);
    UserEntity findOneByUserName(String userName);
    List<UserEntity> findByIdIn(List<Long> id);
    UserEntity findAllById(Long id);

    Optional<UserEntity> findAllByEmail(String email);


    boolean existsByEmail(String email);

    boolean existsByStatusIsContainingAndEmail(Integer status, String email);

    boolean existsByEmailAndStatus(String email, Integer status);

    boolean existsByUserName(String userName);

    Optional<UserEntity> findAllByEmailAndStatusAndLoginType(String email, Integer status, String loginType);


    UserEntity findUserEntityByEmailAndStatus(String email, Integer status);
}
