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
                Path<Long> id = contentRoot.get("nav").get("id");
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
     * 创建分页请求.根据栏目id查找产品
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
     * 创建分页请求.根据栏目id和搜索字段模糊查找产品
     */
    public Page<Product> pageProduct(int pageNumber, final int pagzSize, final int navId, final String parameter) {
        return productDao.findAll(new Specification<Product>() {
            @Override
            public Predicate toPredicate(Root<Product> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<String> id = contentRoot.get("navId");
                Path<String> productName = contentRoot.get("productName");
                //栏目id=0时查找全部
                if (navId == 0){
                    //所有条件为空是查找所有的
                    if (parameter != ""){
                        criteriaQuery.where(criteriaBuilder.like(productName, "%"+parameter+"%"));
                    }
                }else {
                    //所有条件为空是查找栏目下所有的
                    if (parameter != ""){
                        criteriaQuery.where(criteriaBuilder.and(criteriaBuilder.equal(id, navId), criteriaBuilder.like(productName, "%"+parameter+"%")));
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
    public Page<Product> pageProduct(int pageNumber, final int pagzSize) {
        return productDao.findAll(new Specification<Product>() {
            @Override
            public Predicate toPredicate(Root<Product> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                return null;
            }

        }, new PageRequest(pageNumber - 1, pagzSize));
    }

    public List<Product> getIndexProduct(){
        return productDao.findAll(new Specification<Product>() {
            @Override
            public Predicate toPredicate(Root<Product> productRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                criteriaQuery.where(criteriaBuilder.equal(productRoot.get("showIndex"),1));
                return null;
            }
        });
    }
}
