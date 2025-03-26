package com.javabackend.shop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "shipping_method")
public class ShippingMethodEntity extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "title")
    private String title;
    @Column(name = "description")
    private String description;
    @Column(name = "basefee")
    private Double basefee;
    @OneToMany(mappedBy = "shippingMethodEntity",cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    List<OrderEntity> orderEntities= new ArrayList<>();
}
