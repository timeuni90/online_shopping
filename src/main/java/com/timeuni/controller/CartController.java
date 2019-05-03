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
import org.springframework.web.servlet.ModelAndView;

import com.timeuni.bean.Cart;
import com.timeuni.service.CartService;

@Controller
public class CartController {
	@Autowired
	private CartService cartService;
	
	/* 添加购物车请求 */
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	@ResponseBody
	public Boolean handleAddItemToCartRequest(HttpSession httpSession, Cart cartItem) {
		cartItem.setUserId((Integer) httpSession.getAttribute("userId"));
		return cartService.addItemToCart(cartItem);
	}
	
	/* 显示购物车里的商品 */
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView handleShowCartItemsRequest(HttpSession httpSession) {
		Map<String, Object> map = cartService.getCartItemsByUserId((Integer) httpSession.getAttribute("userId"));
		ModelAndView modelAndView = new ModelAndView("cart");
		modelAndView.addAllObjects(map);
		return modelAndView;
	}
	
	/* 删除购物车请求 */
	@RequestMapping(value = "/cart", method = RequestMethod.DELETE)
	@ResponseBody
	public Integer handleRemoveItemsFromCartRequest(HttpSession httpSession, @RequestParam(name = "rows")List<String> rows) {
		return cartService.removeCartItems(rows, (Integer) httpSession.getAttribute("userId"));
	}
}
