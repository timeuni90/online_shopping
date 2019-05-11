package com.timeuni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.timeuni.dao.CommodityMapper;
import com.timeuni.mybean.SellerProduct;

@Service
public class BackStageCommodityService {
	@Autowired
	private CommodityMapper commodityMapper;
	
	public PageInfo<SellerProduct> getCommoditiesBySellerId(Integer sellerId, Integer page) {
		PageHelper.startPage(page, 10);
		List<SellerProduct> sellerProducts = commodityMapper.selectBySellerId(sellerId);
		PageInfo<SellerProduct> pageInfo = new PageInfo<SellerProduct>(sellerProducts, 5);
		return pageInfo;
	}
	
}
