package com.timeuni.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BackStageViewController {
	
	/* 返回后台界面 */
	@RequestMapping(value = "/backstage", method = RequestMethod.GET)
	public String handleGetBackStageViewRequest(HttpSession session, Model model) {
		model.addAttribute("sellerId", session.getAttribute("sellerId"));
		return "backstage/starter";
	}
	
	/* 获取商品中心界面 */
	@RequestMapping(value = "/backstage/commoditycenter", method = RequestMethod.GET)
	public String handleGetCommodityCenterViewRequest() {
		return "backstage/content/commodity_center";
	}
	
	/* 获取订单列表界面 */
	@RequestMapping(value = "/backstage/orderview", method = RequestMethod.GET)
	public String handleGetOrderViewRequest() {
		return "backstage/content/order";
	}
	
	/* 获取统计界面 */
	@RequestMapping(value = "/backstage/statisticview")
	public String handleGetStatisticViewRequest() {
		return "backstage/content/statistic";
	}
}
