package com.timeuni.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.timeuni.bean.Commodity;
import com.timeuni.service.CollectService;

@Controller
public class CollectController {
	@Autowired
	private CollectService collectService;
	
	/* 获得收藏商品 */
	@RequestMapping(value = "/collect", method = RequestMethod.GET)
	public ModelAndView handleGetCollectsRequest(HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		List<Commodity> commodities = collectService.getCollects(userId);
		ModelAndView modelAndView = new ModelAndView("collect");
		modelAndView.addObject("commodities", commodities);
		return modelAndView;
	}
	
}
