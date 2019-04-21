package com.timeuni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timeuni.bean.Commodity;
import com.timeuni.dao.CommodityMapper;
import com.timeuni.resourcebundle.ResourceLocation;

@Service
public class CommodityService {
	@Autowired
	private CommodityMapper commodityMapper;
	
	/* 按关键字获取商品 */
	public List<Commodity> getCommoditiesBySearchKey(String key, Integer sortType) {
		key = "%" + key + "%";
		String commodityCoverImageLocation = new ResourceLocation().getCommodityCoverImageLocation();
		List<Commodity> commodities = commodityMapper.selectByKey(key, sortType, commodityCoverImageLocation);
		return commodities;
	}
	
	/* 按商品id获取商品信息 */
	public Commodity getCommodityById(Integer commodityId) {
		
		return null;
	}
	
}
