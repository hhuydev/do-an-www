package com.webstore.app.service;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.webstore.app.entity.User;
import com.webstore.app.mysql.repo.UserRepository;

@Service
public class AccountServiceImpl implements IAccountService {

	@Autowired
	private UserRepository userRepository;

	@Override
	public User AddAccount(User user) {
		// TODO Auto-generated method stub
		user.setUserPass(BCrypt.hashpw(user.getUserPass(), BCrypt.gensalt(12))); // hasp password thanh 12 kytu
		return userRepository.save(user);
	}

	@Override
	public User CheckAccount(User user) {
		// TODO Auto-generated method stub
		String password = user.getUserPass();
		user = userRepository.findByUser(user.getUserEmail());
		if (user != null) {
			if (BCrypt.checkpw(password, user.getUserPass())) // so sanh password ban dau = password bi ma hoa trong db
				return user;
		}
		return null;
	}

	@Override
	public <S extends User> S save(S entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends User> Iterable<S> saveAll(Iterable<S> entities) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<User> findById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean existsById(Long id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Iterable<User> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterable<User> findAllById(Iterable<Long> ids) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteById(Long id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(User entity) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteAll(Iterable<? extends User> entities) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteAll() {
		// TODO Auto-generated method stub

	}

}
