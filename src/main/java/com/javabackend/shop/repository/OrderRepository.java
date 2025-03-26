package com.javabackend.shop.repository;

import com.javabackend.shop.entity.CartEntity;
import com.javabackend.shop.entity.CategoryEntity;
import com.javabackend.shop.entity.OrderEntity;
import com.javabackend.shop.entity.UserEntity;
import com.javabackend.shop.repository.custom.OrderRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface OrderRepository extends JpaRepository<OrderEntity, Long>, OrderRepositoryCustom {
    @Query("SELECT o FROM OrderEntity o WHERE o.userEntity.id = :userId")
    List<OrderEntity> findOrderByUserId(@Param("userId") Long userId);
    List<OrderEntity> findAllByStatus(String status);
    @Query("SELECT MONTH(o.createdDate) AS month, YEAR(o.createdDate) AS year, SUM(oi.total) AS totalRevenue " +
            "FROM OrderEntity o " +
            "JOIN OrderItemEntity oi ON o.id = oi.orderEntity.id " +
            "WHERE YEAR(o.createdDate) = :year " +
            "AND (:month IS NULL OR MONTH(o.createdDate) = :month) " +
            "AND (:status IS NULL OR o.status = :status) " +
            "GROUP BY YEAR(o.createdDate), MONTH(o.createdDate) " +
            "ORDER BY YEAR(o.createdDate), MONTH(o.createdDate)")
    List<Object[]> getMonthlyRevenue(@Param("year") int year,
                                     @Param("month") Integer month,
                                     @Param("status") String status);
    @Query("SELECT MONTH(o.createdDate) AS month, YEAR(o.createdDate) AS year, SUM(oi.total) AS totalRevenue " +
            "FROM OrderEntity o " +
            "JOIN OrderItemEntity oi ON o.id = oi.orderEntity.id " +
            "WHERE YEAR(o.createdDate) = :year " +
            "AND (:month IS NULL OR MONTH(o.createdDate) = :month) " +
            "AND o.status IN :statuses " +
            "GROUP BY YEAR(o.createdDate), MONTH(o.createdDate) " +
            "ORDER BY YEAR(o.createdDate), MONTH(o.createdDate)")
    List<Object[]> getMonthlyRevenueWithStatuses(@Param("year") int year,
                                                 @Param("month") Integer month,
                                                 @Param("statuses") List<String> statuses);
    @Query("SELECT MONTH(o.createdDate) AS month, YEAR(o.createdDate) AS year, SUM(oi.total) AS totalRevenue " +
            "FROM OrderEntity o " +
            "JOIN OrderItemEntity oi ON o.id = oi.orderEntity.id " +
            "WHERE YEAR(o.createdDate) = :year " +
            "AND (:month IS NULL OR MONTH(o.createdDate) = :month) " +
            "GROUP BY YEAR(o.createdDate), MONTH(o.createdDate) " +
            "ORDER BY YEAR(o.createdDate), MONTH(o.createdDate)")
    List<Object[]> getMonthlyRevenueWithoutStatuses(@Param("year") int year,
                                                    @Param("month") Integer month);


    Page<OrderEntity> findAll(Pageable pageable);
}
