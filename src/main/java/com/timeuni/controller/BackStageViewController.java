package com.timeuni.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.timeuni.bean.Seller;
import com.timeuni.service.BackStageViewService;

@Controller
public class BackStageViewController {
	@Autowired
	private BackStageViewService backstageViewService;

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
	@RequestMapping(value = "/backstage/statisticview", method = RequestMethod.GET)
	public String handleGetStatisticViewRequest() {
		return "backstage/content/statistic";
	}

	/* 返回登录界面 */
	@RequestMapping(value = "/backstage/login", method = RequestMethod.GET)
	public String handleGetLoginViewRequest() {
		return "backstage/login";
	}

	/* 验证登录信息 */
	@RequestMapping(value = "/backstage/login_validation", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> handleLoginValidationRequest(HttpSession session, @Valid Seller seller,
			BindingResult result) {
		return backstageViewService.loginValidation(session, seller, result);
	}

}
