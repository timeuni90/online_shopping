package com.timeuni.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.timeuni.mybean.BackStageOrder;
import com.timeuni.service.BackStageOrderService;

@Controller
public class BackStageOrderContoller {
	@Autowired
	private BackStageOrderService backstageOrderService;
	
	/* 获取商家所有订单 */
	@RequestMapping(value = "/backstage/orders", method = RequestMethod.GET)
	@ResponseBody
	public PageInfo<BackStageOrder> handleGetOrdersRequest(HttpSession session, @RequestParam(required = false)Integer pageNum) {
		if(pageNum == null) {
			pageNum = 1;
		}
		Integer sellerId = (Integer) session.getAttribute("sellerId");
		return backstageOrderService.getOrders(sellerId, pageNum);
	}
	
	/* 删除订单 */
	@RequestMapping(value = "/backstage/orders", method = RequestMethod.DELETE)
	@ResponseBody
	public Integer handleRemoveOrders(@RequestParam(name = "orderIds")List<Integer> orderIds) {
		return backstageOrderService.removeOrders(orderIds);
	}
	
	/* 获取订单明细 */
	@RequestMapping(value = "/backstage/orderdetail", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> handleGetOrderDetailRequest(Integer orderId) {
		return backstageOrderService.getOrderDetailByOrderId(orderId);
	}
	
	/* 发货 */
	@RequestMapping(value = "/backstage/delieve", method = RequestMethod.POST)
	@ResponseBody
	public Integer handleDelieveRequest(Integer orderId) {
		return backstageOrderService.delieve(orderId);
	}
}
