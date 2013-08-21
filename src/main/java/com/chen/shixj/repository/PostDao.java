package com.chen.shixj.repository;

import com.chen.shixj.entity.Post;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * User: jpm
 * Date: 13-8-20
 * Time: 下午1:11
 */
public interface  PostDao extends PagingAndSortingRepository<Post, Long>, JpaSpecificationExecutor<Post> {

}
