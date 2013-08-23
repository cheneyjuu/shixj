package com.chen.shixj.service.productImage;

import com.chen.shixj.entity.ProductImage;
import com.chen.shixj.repository.ProductImageDao;
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
 * Date: 13-8-22
 * Time: 下午11:28
 */
@Component
@Transactional(readOnly = true)
public class ProductImageService {
    private ProductImageDao productImageDao;

    public ProductImage getProductImage(Long id) {
        return productImageDao.findOne(id);
    }

    @Transactional(readOnly = false)
    public void saveProductImage(ProductImage entity) {
        productImageDao.save(entity);
    }

    @Transactional(readOnly = false)
    public void deleteProductImage(Long id) {
        productImageDao.delete(id);
    }

    public List<ProductImage> getAllProductImage() {
        return (List<ProductImage>) productImageDao.findAll();
    }

    public List<ProductImage> getAllProductImageWithProductId(final int productId) {
        return productImageDao.findAll(new Specification<ProductImage>() {
            @Override
            public Predicate toPredicate(Root<ProductImage> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder
                    criteriaBuilder) {
                Path<String> id = contentRoot.get("productId");
                criteriaQuery.where(criteriaBuilder.equal(id, productId));
                return null;
            }


        });
    }

    @Autowired
    public void setProductImageDao(ProductImageDao ProductImageDao) {
        this.productImageDao = ProductImageDao;
    }
}
