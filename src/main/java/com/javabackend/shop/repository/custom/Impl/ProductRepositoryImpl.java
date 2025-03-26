package com.javabackend.shop.repository.custom.Impl;

import com.javabackend.shop.entity.ProductEntity;
import com.javabackend.shop.model.request.ProductRequest;
import com.javabackend.shop.repository.custom.ProductRepositoryCustom;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;
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
public class ProductRepositoryImpl implements ProductRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    @Value("${spring.datasource.url}")
    private String DB_URL;
    @Value("${spring.datasource.username}")
    private String USER;
    @Value("${spring.datasource.password}")
    private String PASS;

    public static void queryNormal(ProductRequest productRequest, StringBuilder where) {
        try {
            Field[] fields = ProductRequest.class.getDeclaredFields();
            for (Field item : fields) {
                item.setAccessible(true);
                String fieldName = item.getName();
                if (!fieldName.equals("staffId") && !fieldName.equals("rentTypeCode")
                        && !fieldName.startsWith("area") && !fieldName.startsWith("rentPrice")) {
                    Object value = item.get(productRequest);
                    if (value != null && value != "") {
                        if (item.getType().getName().equals("java.lang.Long") || item.getType().getName().equals("java.lang.Integer")) {
                            where.append(" AND p." + fieldName + "=" + value + " ");
                        } else if (item.getType().getName().equals("java.lang.String")) {
                            where.append(" AND p." + fieldName + " LIKE '%" + value + "%' ");
                        }
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public List<ProductEntity> findAll(ProductRequest productRequest) {
        StringBuilder sql = new StringBuilder("Select * From product p ");
        StringBuilder where = new StringBuilder(" where 1 = 1  ");
        queryNormal(productRequest, where);
//        specialQuery(productRequest,where);
        sql.append(where);
        Query query = entityManager.createNativeQuery(sql.toString(), ProductEntity.class);
        return query.getResultList();
    }
}
