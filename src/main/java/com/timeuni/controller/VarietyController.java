package com.timeuni.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.timeuni.bean.Commodity;
import com.timeuni.bean.Variety;
import com.timeuni.service.CommodityService;
import com.timeuni.service.VarietyService;

@Controller
public class VarietyController {
	@Autowired
	private VarietyService varietyService;
	@Autowired
	private CommodityService commodityService;
	
	@ResponseBody
	@RequestMapping(value = "/indexclass", method = RequestMethod.GET)
	public List<List<Variety>> handleIndexClassReuqest(@RequestParam(name = "ids")List<Integer> ids) {
		List<List<Variety>> list = varietyService.getIndexClass(ids);
		return list;
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView handleIndexRequest() {
		List<Commodity> commodities = commodityService.getRotCommodities();
		ModelAndView modelAndView = new ModelAndView("shouye");
		modelAndView.addObject("commodities", commodities);
		return modelAndView;
	}
}
