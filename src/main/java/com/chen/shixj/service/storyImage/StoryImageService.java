package com.chen.shixj.service.storyImage;

import com.chen.shixj.entity.StoryImage;
import com.chen.shixj.repository.StoryImageDao;
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
public class StoryImageService {
    private StoryImageDao storyImageDao;

    public StoryImage getStoryImage(Long id) {
        return storyImageDao.findOne(id);
    }

    @Transactional(readOnly = false)
    public void saveStoryImage(StoryImage entity) {
        storyImageDao.save(entity);
    }

    @Transactional(readOnly = false)
    public void deleteStoryImage(Long id) {
        storyImageDao.delete(id);
    }

    public List<StoryImage> getAllStoryImage() {
        return (List<StoryImage>) storyImageDao.findAll();
    }

    public List<StoryImage> getAllStoryImageWithStoryId(final Long storyId) {
        return storyImageDao.findAll(new Specification<StoryImage>() {
            @Override
            public Predicate toPredicate(Root<StoryImage> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder
                    criteriaBuilder) {
                Path<String> id = contentRoot.get("storyId");
                criteriaQuery.where(criteriaBuilder.equal(id, storyId));
                return null;
            }


        });
    }

    @Autowired
    public void setStoryImageDao(StoryImageDao StoryImageDao) {
        this.storyImageDao = StoryImageDao;
    }
}
