package com.javabackend.shop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
@Entity
@Table(name = "category")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryEntity extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "categoryEntity")
    List<ProductEntity> productEntities=new ArrayList<>();

}
