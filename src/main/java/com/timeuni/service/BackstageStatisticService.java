package com.timeuni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timeuni.dao.CommodityMapper;
import com.timeuni.mybean.ProductWithSaleQuantity;

@Service
public class BackstageStatisticService {
	@Autowired
	private CommodityMapper commodityMapper;
	
	public List<ProductWithSaleQuantity> saleQuantityStatistic(Integer sellerId) {
		return commodityMapper.selectSumSaleQuantityBySellerId(sellerId);
	}
}
