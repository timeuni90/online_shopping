package com.timeuni.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.timeuni.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/prepareorder", method = RequestMethod.GET)
	public ModelAndView handlePrepareOrderRequest(HttpSession httpSession, Integer commodityId, String row, Integer quantity) {
		Integer userId = (Integer) httpSession.getAttribute("userId");
		Map<String, Object> map = orderService.getPrepareOrderInformation(commodityId, row, quantity, userId);
		ModelAndView modelAndView = new ModelAndView("order_confirm");
		modelAndView.addAllObjects(map);
		return modelAndView;
	}
	
	@RequestMapping(value = "/prepareorders", method = RequestMethod.GET)
	public ModelAndView handlePrepareOrdersRequest(HttpSession httpSession, @RequestParam(name = "rows")List<String> rows) {
		Map<String, Object> map = orderService.getPrepareOrdersInformationFromCart((Integer) httpSession.getAttribute("userId"), rows);
		ModelAndView modelAndView = new ModelAndView("order_confirm");
		modelAndView.addAllObjects(map);
		return modelAndView;
	}
}
