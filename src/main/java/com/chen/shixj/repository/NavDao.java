package com.chen.shixj.repository;

import com.chen.shixj.entity.Nav;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * User: jpm
 * Date: 13-8-19
 * Time: 上午11:15
 */
public interface  NavDao extends PagingAndSortingRepository<Nav, Long>, JpaSpecificationExecutor<Nav> {
    @Override
    List<Nav> findAll(Specification<Nav> navSpecification);
}
