package com.timeuni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timeuni.bean.Commodity;
import com.timeuni.dao.CommodityMapper;

@Service
public class CommodityService {
	@Autowired
	private CommodityMapper commodityMapper;
	
	public List<Commodity> getCommoditiesBySearchKey(String key, Integer sortType) {
		key = "%" + key + "%";
		List<Commodity> commodities = commodityMapper.selectByKey(key, sortType);
		return commodities;
	}
	
}
