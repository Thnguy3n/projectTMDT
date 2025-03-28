package com.javabackend.shop.entity;

import com.javabackend.shop.repository.ProductRepository;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "product")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductEntity extends BaseEntity  {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "title")
    private String title;

    @Column(name = "price")
    private Double price;

    @Column(name = "discount")
    private Integer discount;

    @Column(name = "image")
    private String image;

    @Column(name = "inventory")
    private Integer inventory;

    @Column(name = "description")
    private String description;

    @Column(name = "deleted")
    private Integer deleted;

    @Column(name = "start_discount")
    private LocalDateTime start_discount;

    @Column(name = "end_discount")
    private LocalDateTime end_discount;

    @Column(name = "discount_status")
    private Integer discountStatus;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private CategoryEntity categoryEntity;

    @ManyToOne
    @JoinColumn(name ="supplier_id")
    private SupplierEntity supplierEntity;

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "productEntity")
    List<CartItemEntity> cartEntities=new ArrayList<>();

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "productEntity")
    List<GaleryEntity> galeryEntities=new ArrayList<>();

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "productEntity")
    List<OrderItemEntity>  orderItemEntities=new ArrayList<>();



}
