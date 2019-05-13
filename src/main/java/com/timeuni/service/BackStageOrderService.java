package com.timeuni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.timeuni.bean.Order;
import com.timeuni.bean.OrderExample;
import com.timeuni.dao.OrderMapper;
import com.timeuni.mybean.BackStageOrder;
import com.timeuni.status.OrderStatus;

@Service
public class BackStageOrderService {
	@Autowired
	private OrderMapper orderMapper;
	
	/* 获取商家所有订单 */
	public PageInfo<BackStageOrder> getOrders(Integer sellerId, Integer pageNum) {
		PageHelper.startPage(pageNum, 10);
		List<BackStageOrder> backStageOrders = orderMapper.selectBySellerId(sellerId);
		PageInfo<BackStageOrder> pageInfo = new PageInfo<BackStageOrder>(backStageOrders, 5);
		return pageInfo;
	}
	
	/* 删除订单 */
	public Integer removeOrders(List<Integer> orderIds) {
		OrderExample orderExample = new OrderExample();
		orderExample.createCriteria().andIdIn(orderIds).andStatusEqualTo(OrderStatus.RECEIVED.ordinal());
		Order order = new Order();
		order.setSellerIsDelete(true);
		return orderMapper.updateByExampleSelective(order , orderExample);
	}
}
