package com.javabackend.shop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "slides")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SlidesEntity extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column( name = "title")
    private String title;
    @Column( name = "image")
    private String image;
    @Column( name = "is_active")
    private Integer isActive;
}
