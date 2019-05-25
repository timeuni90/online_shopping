package com.timeuni.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timeuni.bean.Cart;
import com.timeuni.bean.CartExample;
import com.timeuni.bean.CommodityVariable;
import com.timeuni.bean.CommodityVariableExample;
import com.timeuni.dao.CartMapper;
import com.timeuni.dao.CommodityVariableMapper;
import com.timeuni.mybean.CartItem;
import com.timeuni.resourcebundle.ResourceLocation;

@Service
public class CartService {
	@Autowired
	private CartMapper cartMapper;
	@Autowired
	private CommodityVariableMapper commodityVariableMapper;
	
	/* 添加商品到购物车 */
	public Boolean addItemToCart(Cart cartItem) {
		/* 检查库存是否足够 */
		CommodityVariableExample commodityVariableExample = new CommodityVariableExample();
		commodityVariableExample.createCriteria().andSelectPropertyRowEqualTo(cartItem.getSelectPropertyRow());
		List<CommodityVariable> commodityVariables = commodityVariableMapper.selectByExample(commodityVariableExample);
		if(commodityVariables.get(0).getStock().intValue() < cartItem.getQuantity().intValue()) {
			return false;
		}
		/* 更新购物车 */
		CartExample cartExample = new CartExample();
		cartExample.createCriteria().andSelectPropertyRowEqualTo(cartItem.getSelectPropertyRow()).andUserIdEqualTo(cartItem.getUserId());
		int row = cartMapper.updateByExampleSelective(cartItem, cartExample);
		if(row == 0) {
			row = cartMapper.insertSelective(cartItem);
		}
		return true;
	}
	
	/* 获得购物车商品 */
	public Map<String, Object> getCartItemsByUserId(Integer userId) {
		Boolean hasItem = false;
		String coverLocation = new ResourceLocation().getCommodityCoverImageLocation();
		List<CartItem> cartItems = cartMapper.selectCartItemsByUserId(userId, coverLocation, null);
		Map<String, List<CartItem>> groups = new HashMap<String, List<CartItem>>();
		for (CartItem cartItem : cartItems) {
			hasItem = true;
			if(groups.containsKey(cartItem.getStoreName())) {
				groups.get(cartItem.getStoreName()).add(cartItem);
			} else {
				List<CartItem> list = new ArrayList<CartItem>();
				list.add(cartItem);
				groups.put(cartItem.getStoreName(), list);
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("groups", groups);
		map.put("totalCount", cartItems.size());
		map.put("hasItem", hasItem);
		return map;
	}
	
	/* 删除购物车物品 */
	public Integer removeCartItems(List<String> rows, Integer userId) {
		CartExample cartExample = new CartExample();
		cartExample.createCriteria().andSelectPropertyRowIn(rows).andUserIdEqualTo(userId);
		return cartMapper.deleteByExample(cartExample);
	}
}
