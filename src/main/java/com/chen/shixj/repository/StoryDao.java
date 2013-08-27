package com.chen.shixj.repository;

import com.chen.shixj.entity.Story;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * User: jpm
 * Date: 13-8-21
 * Time: 上午9:32
 */
public interface StoryDao extends PagingAndSortingRepository<Story, Long>, JpaSpecificationExecutor<Story> {
}
