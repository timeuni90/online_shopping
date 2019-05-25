package com.timeuni.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.timeuni.mybean.ProductWithSaleQuantity;
import com.timeuni.service.BackstageStatisticService;

@Controller
public class BackStageStatisticController {
	@Autowired
	private BackstageStatisticService staticticService;

	/* 销量统计 */
	@RequestMapping(value = "/backstage/salequantity", method = RequestMethod.GET)
	@ResponseBody
	public List<ProductWithSaleQuantity> handleSaleQuantityStatisticRequest(HttpSession session,
			@RequestParam(required = false) Integer varietyId) {
		Integer sellerId = (Integer) session.getAttribute("sellerId");
		return staticticService.saleQuantityStatistic(sellerId, varietyId);
	}

}
