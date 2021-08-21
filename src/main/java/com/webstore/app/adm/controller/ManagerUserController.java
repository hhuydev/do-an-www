package com.webstore.app.adm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webstore.app.entity.User;
import com.webstore.app.mysql.repo.UserRepository;
import com.webstore.app.service.AccountServiceImpl;
import com.webstore.app.service.SendmailService;

@Controller
@RequestMapping("/user")
public class ManagerUserController {

	@Autowired
	private UserRepository userRepository;
	@Autowired
	AccountServiceImpl accountServiceImpl;
	@Autowired
	SendmailService sendmailService;
	private final static int customer_group = 1;

	@PostMapping("/login")
	protected String userlogin(@RequestParam String command, @RequestParam String email,
			@RequestParam(required = false) String phone, @RequestParam String password, HttpServletRequest request)
			throws EmailException {
		String url = "";
		User users = new User();
		HttpSession session = request.getSession();
		switch (command) {
		case "insert":
			users.setUserEmail(email);
			users.setUserPass(password);
			users.setUserRole(false);
			users.setGroupid(customer_group);
			users.setPhone(phone);
			User user = accountServiceImpl.AddAccount(users);
			// send mail
			sendmailService.sendMail(user);
			// save user
//			userRepository.save(user);
			session.setAttribute("user", user);
			url = "shop/homepage";
			break;

		case "login":
			users = userRepository.findByUserEmailAndUserPassAndGroupid(email, password, customer_group);
//			User checkUser = accountServiceImpl.CheckAccount(users);
			if (users != null) {
				session.setAttribute("user", users);
				url = "shop/homepage";
			} else {
				session.setAttribute("error", "Email hoặc mật khẩu không đúng.!");
				url = "shop/login";
			}
			break;
		}
		return "redirect:/" + url;
	}
}
