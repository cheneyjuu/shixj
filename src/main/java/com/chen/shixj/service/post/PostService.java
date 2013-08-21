package com.chen.shixj.service.post;

import com.chen.shixj.entity.Post;
import com.chen.shixj.repository.PostDao;
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
 * Date: 13-8-20
 * Time: 下午1:14
 */
@Component
@Transactional(readOnly = true)
public class PostService {
    private PostDao postDao;
    public Post getPost(Long id) {
        return postDao.findOne(id);
    }

    @Transactional(readOnly = false)
    public void savePost(Post entity) {
        postDao.save(entity);
    }

    @Transactional(readOnly = false)
    public void deletePost(Long id) {
        postDao.delete(id);
    }

    public List<Post> getAllPost() {
        return (List<Post>) postDao.findAll();
    }

    public List<Post> getAllPostForNavId(final int navId) {
        return postDao.findAll(new Specification<Post>() {
            @Override
            public Predicate toPredicate(Root<Post> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder
                    criteriaBuilder) {
                Path<String> id = contentRoot.get("navId");
                criteriaQuery.where(criteriaBuilder.equal(id, navId));
                return null;
            }


        });
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
    public void setPostDao(PostDao postDao) {
        this.postDao = postDao;
    }

    /**
     * 创建分页请求.
     */
    public Page<Post> pagePost(int pageNumber, final int pagzSize,final int navId) {
        return postDao.findAll(new Specification<Post>() {
            @Override
            public Predicate toPredicate(Root<Post> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<String> id = contentRoot.get("navId");
                criteriaQuery.where(criteriaBuilder.equal(id, navId));
                return null;
            }

        }, new PageRequest(pageNumber - 1, pagzSize));
    }
    /**
     * 创建分页请求.根据栏目id和搜索字段模糊查找产品
     */
    public Page<Post> pagePost(int pageNumber, final int pagzSize, final int navId, final String parameter) {
        return postDao.findAll(new Specification<Post>() {
            @Override
            public Predicate toPredicate(Root<Post> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<String> id = contentRoot.get("navId");
                Path<String> postTitle = contentRoot.get("postTitle");
                //栏目id=0时查找全部
                if (navId == 0){
                    //所有条件为空是查找所有的
                    if (parameter != ""){
                        criteriaQuery.where(criteriaBuilder.like(postTitle, "%"+parameter+"%"));
                    }
                }else {
                    //所有条件为空是查找栏目下所有的
                    if (parameter != ""){
                        criteriaQuery.where(criteriaBuilder.and(criteriaBuilder.equal(id, navId), criteriaBuilder.like(postTitle, "%"+parameter+"%")));
                    }else{
                        criteriaQuery.where(criteriaBuilder.equal(id, navId));
                    }

                }

                return null;
            }

        }, new PageRequest(pageNumber - 1, pagzSize));
    }

    /**
     * 创建分页请求.
     */
    public Page<Post> pagePost(int pageNumber, final int pagzSize) {
        return postDao.findAll(new Specification<Post>() {
            @Override
            public Predicate toPredicate(Root<Post> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                return null;
            }

        }, new PageRequest(pageNumber - 1, pagzSize));
    }
}
