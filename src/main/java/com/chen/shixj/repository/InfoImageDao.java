package com.chen.shixj.repository;

import com.chen.shixj.entity.InfoImage;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * User: jpm
 * Date: 13-8-22
 * Time: 下午11:27
 */
public interface InfoImageDao extends PagingAndSortingRepository<InfoImage, Long>, JpaSpecificationExecutor<InfoImage> {
}
