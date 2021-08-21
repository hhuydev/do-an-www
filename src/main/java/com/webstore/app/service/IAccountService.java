package com.webstore.app.service;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import com.webstore.app.entity.User;

@Service
public interface IAccountService extends CrudRepository<User, Long> {
	public User AddAccount(User user);

	public User CheckAccount(User user);
}
