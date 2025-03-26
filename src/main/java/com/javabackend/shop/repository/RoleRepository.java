package com.javabackend.shop.repository;

import com.javabackend.shop.entity.RoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<RoleEntity,Long> {
	RoleEntity findOneByCode(String code);
}
