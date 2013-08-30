package com.chen.shixj.service.nav;

import com.chen.shixj.entity.Nav;
import com.chen.shixj.repository.NavDao;
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
 * Date: 13-8-19
 * Time: 上午11:18
 */
@Component
@Transactional(readOnly = true)
public class NavService {
    private NavDao navDao;

    public Nav getNav(Long id) {
        return navDao.findOne(id);
    }

    @Transactional(readOnly = false)
    public void saveNav(Nav entity) {
        navDao.save(entity);
    }

    @Transactional(readOnly = false)
    public void deleteNav(Long id) {
        navDao.delete(id);
    }

    public List<Nav> getAllNav() {
        return (List<Nav>) navDao.findAll();
    }
    //根据父id查找所有栏目
    public List<Nav> getAllNavForParentNav(final Long parentNav) {
        return navDao.findAll(new Specification<Nav>() {
            @Override
            public Predicate toPredicate(Root<Nav> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder
                    criteriaBuilder) {
                Path<String> column = contentRoot.get("parentNav");
                criteriaQuery.where(criteriaBuilder.equal(column, parentNav));
                return null;
            }


        });
    }
    //根据栏目类型查找所有栏目
    public List<Nav> getAllNavWithNavTypeParentNav(final int navType,final Long parentNav) {
        return navDao.findAll(new Specification<Nav>() {
            @Override
            public Predicate toPredicate(Root<Nav> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder
                    criteriaBuilder) {
                Path<String> type = contentRoot.get("navType");
                Path<String> column = contentRoot.get("parentNav");
                criteriaQuery.where(criteriaBuilder.and(criteriaBuilder.equal(type, navType), criteriaBuilder.equal(column, parentNav)));
                return null;
            }


        }, new Sort(Sort.Direction.ASC, "navOrder"));
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
    public void setNavDao(NavDao navDao) {
        this.navDao = navDao;
    }

    /**
     * 创建分页请求.
     */
    public Page<Nav> pageNav(int pageNumber, final int pagzSize) {
        return navDao.findAll(new Specification<Nav>() {
            @Override
            public Predicate toPredicate(Root<Nav> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
//                Path<String> column = contentRoot.get("newsColumn");
//                criteriaQuery.where(criteriaBuilder.equal(column, newsColumn));
                return null;
            }

        }, new PageRequest(pageNumber - 1, pagzSize));
    }

}
