package com.javabackend.shop.service;

import com.javabackend.shop.model.dto.SlidesDTO;

import java.util.List;

public interface ISlidesService {
    void addSlides(SlidesDTO slidesDTO);
    List<SlidesDTO> findAllSlides();
    List<SlidesDTO> findAllSlidesByStatus();
    void useSlide(Long id, String req);
}
