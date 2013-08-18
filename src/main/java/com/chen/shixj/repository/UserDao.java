package com.chen.shixj.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import com.chen.shixj.entity.User;

public interface UserDao extends PagingAndSortingRepository<User, Long> {
	User findByLoginName(String loginName);
}
