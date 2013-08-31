package com.chen.shixj.service.story;

import com.chen.shixj.entity.Story;
import com.chen.shixj.repository.StoryDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.List;

/**
 * User: jpm
 * Date: 13-8-21
 * Time: 上午9:34
 */
@Component
@Transactional(readOnly = true)
public class StoryService {
    private StoryDao storyDao;

    public Story getStory(Long id) {
        return storyDao.findOne(id);
    }

    @Transactional(readOnly = false)
    public void saveStory(Story entity) {
        storyDao.save(entity);
    }

    @Transactional(readOnly = false)
    public void deleteStory(Long id) {
        storyDao.delete(id);
    }

    public List<Story> getAllStory() {
        return (List<Story>) storyDao.findAll();
    }

    public Story getLastStory(){
        List<Story> storyList = (List<Story>) storyDao.findAll(new Sort(Sort.Direction.DESC,"id"));
        if (storyList.size() > 0){
            return storyList.get(0);
        } else {
            return null;
        }
    }

    /**
     * 创建分页请求.
     */
    private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Sort.Direction.DESC, "id");
        } else if ("title".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "title");
        }

        return new PageRequest(pageNumber - 1, pagzSize, sort);
    }


    @Autowired
    public void setStoryDao(StoryDao StoryDao) {
        this.storyDao = StoryDao;
    }

    /**
     * 创建分页请求.根据搜索条件查找产品
     */
    public Page<Story> pageStory(int pageNumber, final int pagzSize,final String parameter) {
        return storyDao.findAll(new Specification<Story>() {
            @Override
            public Predicate toPredicate(Root<Story> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<String> title = contentRoot.get("storyTitle");
                criteriaQuery.where(criteriaBuilder.like(title, "%"+parameter+"%"));
                return null;
            }

        }, new PageRequest(pageNumber - 1, pagzSize));
    }

    /**
     * 创建分页请求.查找所有产品
     */
    public Page<Story> pageStory(int pageNumber, final int pagzSize) {
        return storyDao.findAll(new Specification<Story>() {
            @Override
            public Predicate toPredicate(Root<Story> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                return null;
            }

        }, new PageRequest(pageNumber - 1, pagzSize));
    }
}
