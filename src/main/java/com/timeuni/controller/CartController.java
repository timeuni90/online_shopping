package com.timeuni.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.timeuni.bean.Cart;
import com.timeuni.service.CartService;

@Controller
public class CartController {
	@Autowired
	private CartService cartService;
	
	/* 添加购物请求 */
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public void handleAddItemToCartRequest(HttpSession httpSession, Cart cartItem) {
		cartItem.setUserId((Integer) httpSession.getAttribute("userId"));
		cartService.addItemToCart(cartItem);
	}
	
	/* 显示购物车里的商品 */
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView handleShowCartItemsRequest(HttpSession httpSession) {
		Map<String, Object> map = cartService.getCartItemsByUserId((Integer) httpSession.getAttribute("userId"));
		ModelAndView modelAndView = new ModelAndView("cart");
		modelAndView.addAllObjects(map);
		return modelAndView;
	}
}
