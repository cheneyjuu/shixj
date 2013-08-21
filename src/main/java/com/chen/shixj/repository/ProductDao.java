package com.chen.shixj.repository;

import com.chen.shixj.entity.Product;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * User: jpm
 * Date: 13-8-21
 * Time: 上午9:32
 */
public interface ProductDao extends PagingAndSortingRepository<Product, Long>, JpaSpecificationExecutor<Product> {
}
