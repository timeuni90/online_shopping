package com.timeuni.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import com.timeuni.bean.User;
import com.timeuni.bean.UserExample;
import com.timeuni.dao.UserMapper;
import com.timeuni.md5.MD5;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;

	public Map<String, Object> userLoginValidation(User user, BindingResult result, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(result.hasErrors()) {
			FieldError fieldError = result.getFieldError();
			map.put("isPassed", false);
			map.put("message", fieldError.getDefaultMessage());
			return map;
		}
		UserExample userExample = new UserExample();
		userExample.createCriteria().andUsernameEqualTo(user.getUsername()).andPasswordEqualTo(MD5.encripy(user.getPassword()));
		List<User> users = userMapper.selectByExample(userExample);
		if(users == null || users.size() < 1) {
			map.put("isPassed", false);
			map.put("message", "账号或密码错误");
			return map;
		}
		map.put("isPassed", true);
		map.put("message", "/index.jsp");
		session.setAttribute("userId", users.get(0).getId());
		return map;
	}
	
}
