package com.timeuni.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.timeuni.bean.Order;
import com.timeuni.bean.OrderCommoditySelectProperty;
import com.timeuni.bean.OrderCommoditySelectPropertyExample;
import com.timeuni.bean.OrderDetail;
import com.timeuni.bean.OrderDetailExample;
import com.timeuni.bean.OrderExample;
import com.timeuni.dao.OrderCommoditySelectPropertyMapper;
import com.timeuni.dao.OrderDetailMapper;
import com.timeuni.dao.OrderMapper;
import com.timeuni.mybean.BackStageOrder;
import com.timeuni.status.OrderStatus;

@Service
public class BackStageOrderService {
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private OrderDetailMapper orderDetailMapper;
	@Autowired
	private OrderCommoditySelectPropertyMapper orderCommoditySelectPropertyMapper;
	
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
	
	/* 获得订单明细 */
	public Map<String, Object> getOrderDetailByOrderId(Integer orderId) {
		Order order = orderMapper.selectByPrimaryKey(orderId);
	 	OrderDetailExample orderDetailExample = new OrderDetailExample();
	 	orderDetailExample.createCriteria().andOrderIdEqualTo(orderId);
		List<OrderDetail> orderDetails = orderDetailMapper.selectByExample(orderDetailExample);
		List<Integer> detailIds = new ArrayList<Integer>();
		for (OrderDetail orderDetail : orderDetails) {
			detailIds.add(orderDetail.getId());
		}
		OrderCommoditySelectPropertyExample orderCommoditySelectPropertyExample = new OrderCommoditySelectPropertyExample();
		orderCommoditySelectPropertyExample.createCriteria().andOrderDetailIdIn(detailIds);
		List<OrderCommoditySelectProperty> properties = orderCommoditySelectPropertyMapper.selectByExample(orderCommoditySelectPropertyExample);
		List<Map<String, Object>> orderDetailsWithParam = new ArrayList<Map<String,Object>>();
		for (OrderDetail orderDetail : orderDetails) {
			Map<String, Object> orderDetailMap = new HashMap<String, Object>();
			orderDetailMap.put("orderDetail", orderDetails);
			String param = "";
			for (OrderCommoditySelectProperty property : properties) {
				if(orderDetail.getId() == property.getOrderDetailId()) {
					param += property.getPropertyValue();
				}
			}
			orderDetailMap.put("param", param);
			orderDetailsWithParam.add(orderDetailMap);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("order", order);
		map.put("orderDetail", orderDetailsWithParam);
		return map;
	}
}
