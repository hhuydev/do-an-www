package com.webstore.app.mysql.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.webstore.app.entity.User;
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	User findByUserEmail(String mail);

	User findByUserEmailAndUserPassAndGroupid(String mail, String password, int groupId);

	@Query(value = "Select *from users where user_email = ?1",nativeQuery = true)
	User findByUser(String email);

	@Query(value = "Select * from users where user_email = ?1 and user_pass = ?2 and usergroup_id = 2", nativeQuery = true)
	User findAdmin(String email, String password);
}
