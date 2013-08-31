package com.chen.shixj.service.infoImage;

import com.chen.shixj.entity.InfoImage;
import com.chen.shixj.repository.InfoImageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.List;

/**
 * User: jpm
 * Date: 13-8-22
 * Time: 下午11:28
 */
@Component
@Transactional(readOnly = true)
public class InfoImageService {
    private InfoImageDao infoImageDao;

    public InfoImage getInfoImage(Long id) {
        return infoImageDao.findOne(id);
    }

    @Transactional(readOnly = false)
    public void saveInfoImage(InfoImage entity) {
        infoImageDao.save(entity);
    }

    @Transactional(readOnly = false)
    public void deleteInfoImage(Long id) {
        infoImageDao.delete(id);
    }

    public List<InfoImage> getAllInfoImage() {
        return (List<InfoImage>) infoImageDao.findAll();
    }

    public List<InfoImage> getAllInfoImageWithInfoId(final Long infoId) {
        return infoImageDao.findAll(new Specification<InfoImage>() {
            @Override
            public Predicate toPredicate(Root<InfoImage> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder
                    criteriaBuilder) {
                Path<String> id = contentRoot.get("infoId");
                criteriaQuery.where(criteriaBuilder.equal(id, infoId));
                return null;
            }


        });
    }

    @Autowired
    public void setInfoImageDao(InfoImageDao InfoImageDao) {
        this.infoImageDao = InfoImageDao;
    }
}