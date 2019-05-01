package com.timeuni.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timeuni.bean.Commodity;
import com.timeuni.bean.CommoditySelectProperty;
import com.timeuni.bean.CommoditySelectPropertyExample;
import com.timeuni.bean.CommodityVariable;
import com.timeuni.bean.CommodityVariableExample;
import com.timeuni.bean.Seller;
import com.timeuni.dao.CommodityMapper;
import com.timeuni.dao.CommoditySelectPropertyMapper;
import com.timeuni.dao.CommodityVariableMapper;
import com.timeuni.dao.SellerMapper;

@Service
public class OrderService {
	@Autowired
	private CommodityMapper commodityMapper;
	@Autowired
	private SellerMapper sellerMapper;
	@Autowired
	private CommoditySelectPropertyMapper commoditySelectPropertyMapper;
	@Autowired
	private CommodityVariableMapper commodityVariableMapper;
	
	/* 获取待确认订单的信息 */
	public Map<String, Object> getPrepareOrderInformation(Integer commodityId, String row, Integer quantity, Integer userId) {
		/* 获得商品 */
		Map<String, Object> map = new HashMap<String, Object>();
		Commodity commodity = commodityMapper.selectByPrimaryKey(commodityId);
		map.put("commodity", commodity);
		/* 获得商家 */
		Seller seller = sellerMapper.selectByPrimaryKey(commodity.getSellerId());
		commodity.setSeller(seller);
		/* 获得商品可选属性 */
		CommoditySelectPropertyExample commoditySelectPropertyExample = new CommoditySelectPropertyExample();
		commoditySelectPropertyExample.createCriteria().andSelectPropertyRowEqualTo(row);
		List<CommoditySelectProperty> commoditySelectProperties = commoditySelectPropertyMapper.selectByExample(commoditySelectPropertyExample);
		commodity.setCommoditySelectProperties(commoditySelectProperties);
		/* 获得商品变量 */
		CommodityVariableExample commodityVariableExample = new CommodityVariableExample();
		commodityVariableExample.createCriteria().andSelectPropertyRowEqualTo(row);
		List<CommodityVariable> commodityVariables = commodityVariableMapper.selectByExample(commodityVariableExample);
		map.put("commodityVaraible", commodityVariables.get(0));
		/* 计算总价 */
		Float allPrice = commodityVariables.get(0).getPrice() * quantity;
		if(commodityVariables.get(0).getPromotionPrice() != null) {
			allPrice = commodityVariables.get(0).getPromotionPrice() * quantity;
		}
		map.put("allPrice", allPrice);
		return map;
	}
	
}
