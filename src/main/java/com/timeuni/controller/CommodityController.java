package com.timeuni.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.timeuni.bean.Commodity;
import com.timeuni.myexception.NoFindException;
import com.timeuni.service.CommodityService;
import com.timeuni.status.CommoditySort;

@Controller
public class CommodityController {
	@Autowired
	private CommodityService commodityService;
	
	/* 处理搜索商品请求请求 */
	@RequestMapping(value = "/search_products", method = RequestMethod.GET)
	public ModelAndView handleSearchProductRequest(String key, @RequestParam(required = false) Integer sortType,
			@RequestParam(required = false) Integer page) throws NoFindException {
		if (sortType == null)
			sortType = 0;
		if (page == null)
			page = 1;
		PageInfo<Commodity> pageInfo = commodityService.getCommoditiesBySearchKey(key.trim(), sortType, page);
		ModelAndView modelAndView = new ModelAndView("search_products");
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("key", key.trim());
		modelAndView.addObject("sortType", sortType);
		return modelAndView;
	}

	/* 处理获取商品信息请求 */
	@RequestMapping(value = "/product/{commodityId}", method = RequestMethod.GET)
	public ModelAndView handleGetCommodityRequest(HttpSession session, @PathVariable Integer commodityId) {
		Map<String, Object> map = commodityService.getCommodityById(commodityId);
		ModelAndView modelAndView = new ModelAndView("commodity_detail");
		modelAndView.addAllObjects(map);
		modelAndView.addObject("userId", session.getAttribute("userId"));
		return modelAndView;
	}

	/* 按类别获取商品 */
	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public ModelAndView handleGetProductsByVarietyRequest(Integer varietyId,
			@RequestParam(required = false) Integer page, @RequestParam(required = false) Integer sortType)
			throws NoFindException {
		if(page == null) {
			page = 1;
		}
		if(sortType == null) {
			sortType = CommoditySort.GENERATE_TIME_DESC.ordinal();
		}
		Map<String, Object> map = commodityService.getProducts(varietyId, page, sortType);
		ModelAndView modelAndView = new ModelAndView("products");
		modelAndView.addAllObjects(map);
		modelAndView.addObject("varietyId", varietyId);
		modelAndView.addObject("sortType", sortType);
		return modelAndView;
	}
}
