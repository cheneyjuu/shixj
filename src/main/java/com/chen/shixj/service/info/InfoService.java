package com.chen.shixj.service.info;

import com.chen.shixj.entity.Info;
import com.chen.shixj.entity.Nav;
import com.chen.shixj.repository.InfoDao;
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
public class InfoService {
    private InfoDao infoDao;

    public Info getInfo(Long id) {
        return infoDao.findOne(id);
    }

    @Transactional(readOnly = false)
    public void saveInfo(Info entity) {
        infoDao.save(entity);
    }

    @Transactional(readOnly = false)
    public void deleteInfo(Long id) {
        infoDao.delete(id);
    }

    public List<Info> getAllInfo() {
        return (List<Info>) infoDao.findAll();
    }

    public List<Info> getAllInfoForNavId(final int navId) {
        return infoDao.findAll(new Specification<Info>() {
            @Override
            public Predicate toPredicate(Root<Info> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder
                    criteriaBuilder) {
                Path<Long> id = contentRoot.get("nav").get("id");
                criteriaQuery.where(criteriaBuilder.equal(id, navId));
                return null;
            }


        } , new Sort(Sort.Direction.DESC,"id"));
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
    public void setInfoDao(InfoDao InfoDao) {
        this.infoDao = InfoDao;
    }

    /**
     * 创建分页请求.根据栏目id查找产品
     */
    public Page<Info> pageInfo(int pageNumber, final int pagzSize,final int navId) {
        return infoDao.findAll(new Specification<Info>() {
            @Override
            public Predicate toPredicate(Root<Info> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<String> id = contentRoot.get("navId");
                criteriaQuery.where(criteriaBuilder.equal(id, navId));
                return null;
            }

        }, new PageRequest(pageNumber - 1, pagzSize));
    }
    /**
     * 创建分页请求.根据栏目类型和搜索字段模糊查找产品
     */
    public Page<Info> pageInfoWithNavsParam(int pageNumber, final int pagzSize, final List<Nav> navs, final String parameter) {
        return infoDao.findAll(new Specification<Info>() {
            @Override
            public Predicate toPredicate(Root<Info> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {

                Path<Long> id = contentRoot.get("nav").get("id");
                Path<String> infoName = contentRoot.get("infoTitle");

                CriteriaBuilder.In<Long> in = criteriaBuilder.in(id);
                for (Nav nav : navs) {
                    in.value(nav.getId());
                }

                if (parameter != ""){
                    criteriaQuery.where(criteriaBuilder.and(in, criteriaBuilder.like(infoName, "%" + parameter + "%")));
                }else{
                    criteriaQuery.where(in);
                }

                return null;
            }

        }, new PageRequest(pageNumber - 1, pagzSize, new Sort(Sort.Direction.DESC,"id")));
    }

    /**
     * 创建分页请求.根据栏目id和搜索字段模糊查找产品
     */
    public Page<Info> pageInfo(int pageNumber, final int pagzSize, final int navId, final String parameter) {
        return infoDao.findAll(new Specification<Info>() {
            @Override
            public Predicate toPredicate(Root<Info> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<String> id = contentRoot.get("nav").get("id");
                Path<String> infoName = contentRoot.get("infoTitle");
                //栏目id=0时查找全部
                if (navId == 0){
                    //所有条件为空是查找所有的
                    if (parameter != ""){
                        criteriaQuery.where(criteriaBuilder.like(infoName, "%"+parameter+"%"));
                    }
                }else {
                    //所有条件为空是查找栏目下所有的
                    if (parameter != ""){
                        criteriaQuery.where(criteriaBuilder.and(criteriaBuilder.equal(id, navId), criteriaBuilder.like(infoName, "%"+parameter+"%")));
                    }else{
                        criteriaQuery.where(criteriaBuilder.equal(id, navId));
                    }

                }

                return null;
            }

        }, new PageRequest(pageNumber - 1, pagzSize));
    }

    /**
     * 创建分页请求.查找所有产品
     */
    public Page<Info> pageInfo(int pageNumber, final int pagzSize) {
        return infoDao.findAll(new Specification<Info>() {
            @Override
            public Predicate toPredicate(Root<Info> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                return null;
            }

        }, new PageRequest(pageNumber - 1, pagzSize));
    }

    public Info getInfoById(Long infoId){
        return infoDao.findOne(infoId);
    }

    public List<Info> getIndexInfo(){
        return infoDao.findAll(new Specification<Info>() {
            @Override
            public Predicate toPredicate(Root<Info> infoRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                criteriaQuery.where(criteriaBuilder.equal(infoRoot.get("infoShowIndex"),1));
                return null;
            }
        });
    }
}
