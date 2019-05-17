package com.timeuni.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.timeuni.bean.CartExample;
import com.timeuni.bean.User;
import com.timeuni.dao.CartMapper;
import com.timeuni.dao.UserMapper;
import com.timeuni.resourcebundle.ResourceLocation;

@Controller
public class HeaderController {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private CartMapper cartMapper;
	
	@RequestMapping(value = "/header", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> handleHeaderRequest(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isLogined", false);
		Integer userId = (Integer) session.getAttribute("userId");
		if(userId == null) {
			return map;
		}
		User user = userMapper.selectByPrimaryKey(userId);
		user.setProfilePhoto(new ResourceLocation().getUserImageLocation() + user.getProfilePhoto());
		CartExample cartExample = new CartExample();
		cartExample.createCriteria().andUserIdEqualTo(userId);
		long cartCount = cartMapper.countByExample(cartExample);
		map.put("isLogined", true);
		map.put("user", user);
		map.put("cartCount", cartCount);
		return map;
	}
	
}
