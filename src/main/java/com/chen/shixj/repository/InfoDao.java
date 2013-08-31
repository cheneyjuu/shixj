package com.chen.shixj.repository;

import com.chen.shixj.entity.Info;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * User: jpm
 * Date: 13-8-21
 * Time: 上午9:32
 */
public interface InfoDao extends PagingAndSortingRepository<Info, Long>, JpaSpecificationExecutor<Info> {
}
