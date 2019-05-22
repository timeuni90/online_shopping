package com.timeuni.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import com.timeuni.bean.Seller;
import com.timeuni.bean.SellerExample;
import com.timeuni.dao.SellerMapper;
import com.timeuni.md5.MD5;

@Service
public class BackStageViewService {
	@Autowired
	private SellerMapper sellerMapper;
	
	/* 登录验证 */
	public Map<String, Object> loginValidation(HttpSession session, Seller seller, BindingResult result) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (result.hasErrors()) {
			FieldError fieldError = result.getFieldError();
			map.put("isPassed", false);
			map.put("message", fieldError.getDefaultMessage());
			return map;
		}
		SellerExample sellerExample = new SellerExample();
		sellerExample.createCriteria().andUsernameEqualTo(seller.getUsername())
				.andPasswordEqualTo(MD5.encripy(seller.getPassword()));
		List<Seller> sellers = sellerMapper.selectByExample(sellerExample);
		if(sellers == null || sellers.size() < 1) {
			map.put("isPassed", false);
			map.put("message", "账号或密码错误！");
			return map;
		}
		map.put("isPassed", true);
		map.put("message", "/backstage");
		session.setAttribute("sellerId", sellers.get(0).getId());
		return map;
	}

}
