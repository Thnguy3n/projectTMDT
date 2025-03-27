package com.javabackend.shop.repository.custom.Impl;

import com.javabackend.shop.entity.OrderEntity;
import com.javabackend.shop.model.request.OrderSearchRequest;
import com.javabackend.shop.repository.custom.OrderRepositoryCustom;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;

@Repository
@PropertySource("classpath:application.properties")
@Primary
public class OrderRepositoryCustomImpl implements OrderRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    @Value("${spring.datasource.url}")
    private String DB_URL;
    @Value("${spring.datasource.username}")
    private String USER;
    @Value("${spring.datasource.password}")
    private String PASS;
    public static void queryNormal(OrderSearchRequest orderSearchRequest, StringBuilder where) {
        try {
            Field[] fields = OrderSearchRequest.class.getDeclaredFields();
            for (Field item : fields) {
                item.setAccessible(true);
                String fieldName = item.getName();
                Object value = item.get(orderSearchRequest);
                if (value != null && !value.toString().isEmpty()) {
                    if (item.getType().getName().equals("java.lang.String")) {
                        where.append(" AND o." + fieldName + " LIKE '%" + value + "%' ");
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public List<OrderEntity> findAll(OrderSearchRequest orderSearchRequest, Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT * FROM orders o ");
        StringBuilder where = new StringBuilder(" WHERE 1 = 1 ");
        queryNormal(orderSearchRequest, where);
        sql.append(where);
        sql.append(" LIMIT ").append(pageable.getPageSize())
                .append(" OFFSET ").append(pageable.getPageNumber() * pageable.getPageSize());
        Query query = entityManager.createNativeQuery(sql.toString(), OrderEntity.class);
        return query.getResultList();
    }

}
