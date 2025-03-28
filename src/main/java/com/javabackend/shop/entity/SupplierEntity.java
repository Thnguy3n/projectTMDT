package com.javabackend.shop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "supplier")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SupplierEntity extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name="productname")
    private String productName;
    @Column(name="quantity")
    private Integer quantity;
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "supplierEntity")
    List<ProductEntity> productEntities=new ArrayList<>();
}
