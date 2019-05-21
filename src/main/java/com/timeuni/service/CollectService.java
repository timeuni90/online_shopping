package com.timeuni.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timeuni.bean.CollectCommodity;
import com.timeuni.bean.CollectCommodityExample;
import com.timeuni.bean.Commodity;
import com.timeuni.bean.CommodityExample;
import com.timeuni.dao.CollectCommodityMapper;
import com.timeuni.dao.CommodityMapper;
import com.timeuni.resourcebundle.ResourceLocation;

@Service
public class CollectService {
	@Autowired
	private CollectCommodityMapper collectCommodityMapper;
	@Autowired
	private CommodityMapper commodityMapper;
	
	/* 获得收藏 */
	public List<Commodity> getCollects(Integer userId) {
		CollectCommodityExample collectCommodityExample = new CollectCommodityExample();
		collectCommodityExample.createCriteria().andUserIdEqualTo(userId);
		List<CollectCommodity> collectCommodities = collectCommodityMapper.selectByExample(collectCommodityExample);
		/* 没有收藏直接返回NULL */
		if(collectCommodities == null || collectCommodities.size() < 1) {
			return null;
		}
		List<Integer> commodityIds = new ArrayList<Integer>();
		for (CollectCommodity collectCommodity : collectCommodities) {
			commodityIds.add(collectCommodity.getCommodityId());
		}
		CommodityExample commodityExample = new CommodityExample();
		commodityExample.createCriteria().andIdIn(commodityIds);
		List<Commodity> commodities = commodityMapper.selectByExample(commodityExample);
		/* 确定图片位置 */
		String location = new ResourceLocation().getCommodityCoverImageLocation();
		for (Commodity commodity : commodities) {
			commodity.setCoverImage(location + commodity.getCoverImage());
		}
		return commodities;
	}
	
}
