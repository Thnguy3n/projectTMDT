package com.javabackend.shop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "galery")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GaleryEntity extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "image")
    private String image;
    @ManyToOne
    @JoinColumn(name ="product_id")
    private ProductEntity productEntity;


}
