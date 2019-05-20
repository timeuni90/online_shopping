package com.timeuni.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.timeuni.bean.Commodity;
import com.timeuni.bean.Variety;
import com.timeuni.service.SellerService;
import com.timeuni.status.CommoditySort;

@Controller
public class SellerController {
	@Autowired
	private SellerService sellerService;

	@RequestMapping(value = "/store", method = RequestMethod.GET)
	public ModelAndView handleStoreRequest(@RequestParam(required = true) Integer sellerId,
			@RequestParam(required = false) Integer varietyId, @RequestParam(required = false) Integer page,
			@RequestParam(required = false) Integer sortType) {
		if(page == null) {
			page = 1;
		}
		if(sortType == null) {
			sortType = CommoditySort.GENERATE_TIME_DESC.ordinal();
		}
		List<Variety> categories = sellerService.getCategories(sellerId);
		PageInfo<Commodity> pageInfo = sellerService.getProducts(varietyId, sellerId, page, sortType);
		ModelAndView modelAndView = new ModelAndView("store");
		modelAndView.addObject("varieties", categories);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("sellerId", sellerId);
		modelAndView.addObject("varietyId", varietyId);
		return modelAndView;
	}

}
