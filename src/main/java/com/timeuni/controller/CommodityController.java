package com.timeuni.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.timeuni.service.CommodityService;

@Controller
public class CommodityController {
	@Autowired
	private CommodityService commodityService;
	
	@RequestMapping(value = "/search_product", method = RequestMethod.GET)
	public String handleSearchProductRequest(String key, @RequestParam(required = false)Integer sortType) {
		System.out.println(key);
		if(sortType == null)
			sortType = 0;
		commodityService.getCommoditiesBySearchKey(key, sortType);
		return null;
	}
	
}
