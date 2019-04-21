package com.timeuni.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.timeuni.bean.Commodity;
import com.timeuni.service.CommodityService;

@Controller
public class CommodityController {
	@Autowired
	private CommodityService commodityService;
	
	/* 处理搜索商品请求请求 */
	@RequestMapping(value = "/search_product", method = RequestMethod.GET)
	public ModelAndView handleSearchProductRequest(String key, @RequestParam(required = false)Integer sortType) {
		if(sortType == null)
			sortType = 0;
		List<Commodity> commodities = commodityService.getCommoditiesBySearchKey(key, sortType);
		ModelAndView modelAndView = new ModelAndView("sousuo");
		modelAndView.addObject("commodities", commodities);
		return modelAndView;
	}
	
	/* 处理获取商品信息请求 */
	@RequestMapping(value = "/product/{commodityId}", method = RequestMethod.GET)
	public ModelAndView handleGetCommodityRequest(@PathVariable Integer commodityId) {
		return null;
	}
}
