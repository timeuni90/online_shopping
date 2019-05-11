package com.timeuni.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.timeuni.mybean.BackstageProduct;
import com.timeuni.mybean.SellerProduct;
import com.timeuni.service.BackStageCommodityService;

@Controller
public class BackStageCommodityController {
	@Autowired
	private BackStageCommodityService backStageCommodityService;
	
	/* 获得商家商品 */
	@RequestMapping(value = "/backstageproducts", method = RequestMethod.GET)
	@ResponseBody
	public PageInfo<SellerProduct> HandleGetProductsRequest(HttpSession httpSession, @RequestParam(required = false)Integer pageNum) {
		if(pageNum == null) {
			pageNum = 1;
		}
		Integer sellerId = (Integer) httpSession.getAttribute("sellerId");
		return backStageCommodityService.getCommoditiesBySellerId(sellerId, pageNum);
	}
	
	/* 添加商品 */
	@RequestMapping(value = "/backstageproduct", method = RequestMethod.POST)
	@ResponseBody
	public void handleAddProductRquest(@RequestBody BackstageProduct product) {
		System.out.println(product);
	}
}
