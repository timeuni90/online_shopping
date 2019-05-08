package com.timeuni.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.timeuni.bean.Commodity;
import com.timeuni.service.CommodityService;

@Controller
public class CommodityController {
	@Autowired
	private CommodityService commodityService;

	/* 处理搜索商品请求请求 */
	@RequestMapping(value = "/search_product", method = RequestMethod.GET)
	public ModelAndView handleSearchProductRequest(String key, @RequestParam(required = false) Integer sortType,
			@RequestParam(required = false) Integer page) {
		if (sortType == null)
			sortType = 0;
		if (page == null)
			page = 1;
		PageInfo<Commodity> pageInfo = commodityService.getCommoditiesBySearchKey(key.trim(), sortType, page);
		ModelAndView modelAndView = new ModelAndView("sousuo");
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("key", key.trim());
		return modelAndView;
	}

	/* 处理获取商品信息请求 */
	@RequestMapping(value = "/product/{commodityId}", method = RequestMethod.GET)
	public ModelAndView handleGetCommodityRequest(@PathVariable Integer commodityId) {
		Map<String, Object> map = commodityService.getCommodityById(commodityId);
		ModelAndView modelAndView = new ModelAndView("commodity_detail");
		modelAndView.addAllObjects(map);
		return modelAndView;
	}

	@RequestMapping(value = "/order")
	public String abcdefg() {
		return "order_confirm";
	}
}
