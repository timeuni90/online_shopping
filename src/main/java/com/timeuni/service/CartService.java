package com.timeuni.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timeuni.bean.Cart;
import com.timeuni.bean.CartExample;
import com.timeuni.dao.CartMapper;
import com.timeuni.mybean.CartItem;
import com.timeuni.resourcebundle.ResourceLocation;

@Service
public class CartService {
	@Autowired
	private CartMapper cartMapper;
	
	/* 添加商品到购物车 */
	public void addItemToCart(Cart cartItem) {
		CartExample cartExample = new CartExample();
		cartExample.createCriteria().andSelectPropertyRowEqualTo(cartItem.getSelectPropertyRow()).andUserIdEqualTo(cartItem.getUserId());
		int row = cartMapper.updateByExampleSelective(cartItem, cartExample);
		if(row == 0) {
			cartMapper.insertSelective(cartItem);
		}
	}
	
	/* 获得购物车商品 */
	public Map<String, Object> getCartItemsByUserId(Integer userId) {
		String coverLocation = new ResourceLocation().getCommodityCoverImageLocation();
		List<CartItem> cartItems = cartMapper.selectCartItemsByUserId(userId, coverLocation);
		Map<String, List<CartItem>> groups = new HashMap<String, List<CartItem>>();
		for (CartItem cartItem : cartItems) {
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
		return map;
	}
}
