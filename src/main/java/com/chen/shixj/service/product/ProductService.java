package com.chen.shixj.service.product;

import com.chen.shixj.entity.Product;
import com.chen.shixj.repository.ProductDao;
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
public class ProductService {
    private ProductDao productDao;
    public Product getProduct(Long id) {
        return productDao.findOne(id);
    }

    @Transactional(readOnly = false)
    public void saveProduct(Product entity) {
        productDao.save(entity);
    }

    @Transactional(readOnly = false)
    public void deleteProduct(Long id) {
        productDao.delete(id);
    }

    public List<Product> getAllProduct() {
        return (List<Product>) productDao.findAll();
    }

    public List<Product> getAllProductForNavId(final int navId) {
        return productDao.findAll(new Specification<Product>() {
            @Override
            public Predicate toPredicate(Root<Product> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder
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
    public void setProductDao(ProductDao ProductDao) {
        this.productDao = ProductDao;
    }

    /**
     * 创建分页请求.
     */
    public Page<Product> pageProduct(int pageNumber, final int pagzSize,final int navId) {
        return productDao.findAll(new Specification<Product>() {
            @Override
            public Predicate toPredicate(Root<Product> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<String> id = contentRoot.get("navId");
                criteriaQuery.where(criteriaBuilder.equal(id, navId));
                return null;
            }

        }, new PageRequest(pageNumber - 1, pagzSize));
    }
    /**
     * 创建分页请求.
     */
    public Page<Product> pageProduct(int pageNumber, final int pagzSize) {
        return productDao.findAll(new Specification<Product>() {
            @Override
            public Predicate toPredicate(Root<Product> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                return null;
            }

        }, new PageRequest(pageNumber - 1, pagzSize));
    }
}
