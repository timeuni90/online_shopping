package com.timeuni.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alipay.api.AlipayApiException;
import com.timeuni.mybean.SubmitOrder;
import com.timeuni.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	/*  */
	
	/* 准备订单 */
	@RequestMapping(value = "/prepareorder", method = RequestMethod.GET)
	public ModelAndView handlePrepareOrderRequest(HttpSession httpSession, Integer commodityId, String row,
			Integer quantity) {
		Integer userId = (Integer) httpSession.getAttribute("userId");
		Map<String, Object> map = orderService.getPrepareOrderInformation(commodityId, row, quantity, userId);
		ModelAndView modelAndView = new ModelAndView("order_confirm");
		modelAndView.addAllObjects(map);
		return modelAndView;
	}

	/* 准备订单 */
	@RequestMapping(value = "/prepareorders", method = RequestMethod.GET)
	public ModelAndView handlePrepareOrdersRequest(HttpSession httpSession,
			@RequestParam(name = "rows") List<String> rows) {
		Map<String, Object> map = orderService
				.getPrepareOrdersInformationFromCart((Integer) httpSession.getAttribute("userId"), rows);
		ModelAndView modelAndView = new ModelAndView("order_confirm");
		modelAndView.addAllObjects(map);
		return modelAndView;
	}

	/* 提交订单 */
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	@ResponseBody
	public String handleCommitOrderRequest(HttpSession httpSession, @RequestBody SubmitOrder submitOrder) {
		return orderService.addOrder((Integer) httpSession.getAttribute("userId"), submitOrder);
	}
	
	/* 支付 */
	@RequestMapping(value = "/alipay", method = RequestMethod.GET)
	@ResponseBody
	public String handleAlipayRequest(String groupId) throws AlipayApiException {
		return orderService.Alipay(groupId);
	}
	
	/* 付款成功 */
	@RequestMapping(value = "/alipay/success")
	public void handleAlipaySuceessRequest(String out_trade_no) {
		orderService.alipaySuccess(out_trade_no);
	}
}
