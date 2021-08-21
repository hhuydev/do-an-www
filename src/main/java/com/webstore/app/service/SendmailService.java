/***************************************************************************
 * Copyright 2016 by HomeDirect - All rights reserved.                *    
 **************************************************************************/
package com.webstore.app.service;

import java.util.Properties;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.webstore.app.entity.User;

@Service
public class SendmailService {
	public static final String MY_EMAIL = "gmannvm1@gmail.com	";

	public static final String MY_PASSWORD = "123456789aaAA";

//	public static final String FRIEND_EMAIL = "gmannvm1@gmail.com";
	public void sendMail(User user) throws EmailException {
		Email email = new SimpleEmail();

		// Cấu hình thông tin Email Server
		email.setHostName("smtp.googlemail.com");
		email.setSmtpPort(587);
		email.setAuthenticator(new DefaultAuthenticator(MY_EMAIL, MY_PASSWORD));

		// Với gmail cái này là bắt buộc.
		email.setSSLOnConnect(true);
		// Người gửi
		email.setFrom(MY_EMAIL);
		// Tiêu đề
		email.setSubject("Đăng ký tài khoản từ Office Store");
		// Nội dung email
		email.setMsg("Bạn đã đăng ký tài khoản thành công! Chúc bạn mua sắm vui vẻ.");
		// Người nhận
		email.addTo(user.getUserEmail());
		email.send();
	}

}
