package com.kbms_module.controller;
import com.kbms_module.pojo.User;
import com.sun.mail.util.MailSSLSocketFactory;
import org.apache.log4j.Logger;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;
import java.util.UUID;

public class MySendMailThread extends Thread {
    private Logger log= Logger.getLogger(MySendMailThread.class);
    private User user=null;
	public MySendMailThread(User user) {
		log.info("进入构造函数");
		this.user = user;
	}

	@Override
	public void run() {
		log.info("可以开始发邮件了");

		// 跟smtp服务器建立一个连接
		Properties p = new Properties();
		// 设置邮件服务器主机名
		p.setProperty("mail.host", "smtp.qq.com");// 指定邮件服务器，默认端口 25
		// 发送服务器需要身份验证
		p.setProperty("mail.smtp.auth", "true");// 要采用指定用户名密码的方式去认证
		// 发送邮件协议名称
		p.setProperty("mail.transport.protocol", "smtp");

		// 开启SSL加密，否则会失败
		MailSSLSocketFactory sf = null;
		try {
			sf = new MailSSLSocketFactory();
		} catch (GeneralSecurityException e1) {
			e1.printStackTrace();
		}
		sf.setTrustAllHosts(true);
		p.put("mail.smtp.ssl.enable", "true");
		p.put("mail.smtp.ssl.socketFactory", sf);

		// 开启debug调试，以便在控制台查看
		// session.setDebug(true);也可以这样设置
		// p.setProperty("mail.debug", "true");

		// 创建session
		Session session = Session.getDefaultInstance(p, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// 用户名可以用QQ账号也可以用邮箱的别名
				PasswordAuthentication pa = new PasswordAuthentication(
						"2249263162@qq.com", "aulwsfkleahneaif");
				// 后面的字符是授权码，用qq密码不行！！
				return pa;
			}
		});

		session.setDebug(true);// 设置打开调试状态

		try {
			// 声明一个Message对象(代表一封邮件),从session中创建
			MimeMessage msg = new MimeMessage(session);
			// 邮件信息封装
			// 1发件人
			msg.setFrom(new InternetAddress("2249263162@qq.com"));
			// 2收件人
			msg.setRecipient(RecipientType.TO, new InternetAddress(user.getUserEmail()));
			// 3邮件内容:主题、内容
			msg.setSubject(user.getUserName() + ",欢迎注册KnowAll企业知识库管理系统,请点击链接激活账号");

			// StringBuilder是线程不安全的,但是速度快，这里因为只会有这个线程来访问，所以可以用这个
			StringBuilder sbd = new StringBuilder();
			sbd.append(user.getUserName() + "<br/>欢迎！请确认此邮件地址以激活您的账号。<br/>");
			sbd.append("<font color='red'><a href='http://10.0.0.66:8080/kbms/user/emailactive?acode="
					+ user.getUserAcode() + "' target='_blank'");//新开一个窗口
			sbd.append(">立即激活</a></font><br/>");
			sbd.append("或者点击下面链接:<br/>");
			sbd.append("http://10.0.0.66:8080/kbms/user/emailactive?acode="
					+ user.getUserAcode() + "<br/>");
			sbd.append("这是一封自动发送的邮件；如果您并未要求但收到这封信件，您不需要进行任何操作。");

			msg.setContent(sbd.toString(), "text/html;charset=utf-8");// 发html格式的文本

			// 发送动作
			Transport.send(msg);
			
			System.out.println("给" + user.getUserName() + "发送邮件成功。");
			log.info("给" + user.getUserName() + " 发送邮件成功");

		}
		catch (Exception e) {
			e.printStackTrace();
			log.info("发送失败");
		}


	}
	public static void main(String[] args){
		User user=new User();
		user.setUserName("123");
		user.setUserPassword("123");
		//user.setUserEmail("2249263161@qq.com");
		user.setUserActive(0);//默认没有激活
		user.setUserImgid("/default.jpg");
		user.setUserAcode(UUID.randomUUID().toString().replace("-", ""));//随机生成acode 且唯一*/
		new MySendMailThread(user).start();
	}

}
