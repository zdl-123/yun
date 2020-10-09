package cn.allene.yun.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.allene.yun.dao.UserDao;
import cn.allene.yun.pojo.User;
import cn.allene.yun.utils.MailUtils;
import cn.allene.yun.utils.UserUtils;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;

	public User findUser(User user) {
		try {
			user.setPassword(UserUtils.MD5(user.getPassword()));
			User exsitUser = userDao.findUser(user);
			return exsitUser;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean addUser(User user){
		try {
			user.setPassword(UserUtils.MD5(user.getPassword()));
			userDao.addUser(user);
			String emailContent = "感谢您注册共享网盘，点击<a href='http://yynwz.top/store/activeUser?activeCode='>激活</a>后使用" +"<br/><br/>明天的课不是很多，反正也不愿意学习!";
			MailUtils.sendMail(user.getEmail(), emailContent);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public User findUser(String username) {
		User user = null;
		try {
			user = userDao.findUserByUserName(username);
		} catch (Exception e) {
			e.printStackTrace();
			return user;
		}
		return user;
	}
	
	public String getCountSize(String username){
		String countSize = null;
		try {
			countSize = userDao.getCountSize(username);
		} catch (Exception e) {
			e.printStackTrace();
			return countSize;
		}
		return countSize;
	}
}
