package com.javabackend.shop.service.Impl;

import com.javabackend.shop.Utils.UploadFileUtils;
import com.javabackend.shop.entity.ProductEntity;
import com.javabackend.shop.entity.SlidesEntity;
import com.javabackend.shop.model.dto.ProductDTO;
import com.javabackend.shop.model.dto.SlidesDTO;
import com.javabackend.shop.repository.SlideRepository;
import com.javabackend.shop.service.ISlidesService;
import org.apache.tomcat.util.codec.binary.Base64;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class SlidesServiceImpl implements ISlidesService {
    @Autowired
    private SlideRepository slideRepository;
    @Autowired
    private ModelMapper modelMapper;
    private final UploadFileUtils uploadFileUtils;
    @Autowired
    public SlidesServiceImpl(UploadFileUtils uploadFileUtils) {
        this.uploadFileUtils = uploadFileUtils;
    }
    @Override
    public void addSlides(SlidesDTO slidesDTO) {
        SlidesEntity slidesEntity = modelMapper.map(slidesDTO, SlidesEntity.class);
        slidesEntity.setIsActive(0);
        saveThumbnail(slidesDTO, slidesEntity);
        slideRepository.save(slidesEntity);
    }

    @Override
    public List<SlidesDTO> findAllSlides() {
        List<SlidesEntity> slidesEntities = slideRepository.findAll();
        List<SlidesDTO> slidesDTOs = new ArrayList<>();
        for (SlidesEntity slide : slidesEntities) {
            SlidesDTO slidesDTO = modelMapper.map(slide, SlidesDTO.class);
            slidesDTOs.add(slidesDTO);
        }
        return slidesDTOs;
    }

    @Override
    public List<SlidesDTO> findAllSlidesByStatus() {
        List<SlidesEntity> slidesEntities = slideRepository.findAllByIsActive(1);
        List<SlidesDTO> slidesDTOs = new ArrayList<>();
        for (SlidesEntity slide : slidesEntities) {
            SlidesDTO slidesDTO = modelMapper.map(slide, SlidesDTO.class);
            slidesDTOs.add(slidesDTO);
        }
        return slidesDTOs;
    }

    @Override
    public void useSlide(Long id ,String req) {
        SlidesEntity slidesEntity = slideRepository.findById(id).get() ;
        if(req.equals("yes")){
            slidesEntity.setIsActive(1);

        }
        else if(req.equals("no")){
            slidesEntity.setIsActive(0);
        }
        slideRepository.save(slidesEntity);
    }



    public void saveThumbnail(SlidesDTO slidesDTO,  SlidesEntity slidesEntity) {
        String path = "/slide/" + slidesDTO.getImageName();
        if (null != slidesDTO.getImageBase64()) {
            if (null != slidesEntity.getImage()) {
                if (!path.equals(slidesEntity.getImage())) {
                    File file = new File("C://home/office" + slidesEntity.getImage());
                    file.delete();
                }
            }
            String base64Image = slidesDTO.getImageBase64().split(",")[1]; // Bỏ phần 'data:image/png;base64,'
            byte[] bytes = Base64.decodeBase64(base64Image);

            uploadFileUtils.writeOrUpdate(path,bytes);
            slidesEntity.setImage(path);
        }

    }
}
