package cn.allene.yun.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class MailUtils {

	public static void sendMail(String userEmail,String emailContent) throws AddressException, MessagingException {
		//1.得到session对象，与邮件服务器建立了连接 ，通过邮件服务器发送邮件
		Properties props = new Properties();
		//设置发送邮件协议
		props.setProperty("mail.transport.protocol", "SMTP");
		//设置发送邮箱的服务器    通过该账号  
		props.setProperty("mail.host", "smtp.126.com");
		//设置stmp服务器是由用户验证，
		props.setProperty("mail.smtp.auth", "true");
		//创建校验对象
		Authenticator auth = new Authenticator() {
			@Override
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				String username = "yyn9299@126.com";
				String password = "yyn9299";
				return new javax.mail.PasswordAuthentication(username, password);
			}
		};
		
		Session session = Session.getInstance(props, auth);
		
		//2.准备要发送的内容
		Message message = new MimeMessage(session);
		//设置发件人
		message.setFrom(new InternetAddress("yyn9299@126.com"));
		//设置收件人
		//userEmail = "761723347@qq.com";
		message.setRecipient(RecipientType.TO, new InternetAddress(userEmail));
		//设置邮件主题
		message.setSubject("用户激活邮件！");
		//emailContent = "我在发邮件.................";
		message.setContent(emailContent, "text/html;charset=utf-8");
		//发送邮件
		Transport.send(message);
	}
}
