package com.timeuni.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timeuni.bean.CommodityVariety;
import com.timeuni.bean.CommodityVarietyExample;
import com.timeuni.dao.CommodityMapper;
import com.timeuni.dao.CommodityVarietyMapper;
import com.timeuni.dao.VarietyMapper;
import com.timeuni.mybean.ProductWithSaleQuantity;

@Service
public class BackstageStatisticService {
	@Autowired
	private CommodityMapper commodityMapper;
	@Autowired
	private VarietyMapper varietyMapper;
	@Autowired
	private CommodityVarietyMapper commodityVarietyMapper;
	
	public List<ProductWithSaleQuantity> saleQuantityStatistic(Integer sellerId, Integer varietyId) {
		/* 类别为空，查询全部 */
		if(varietyId == null) {
			return commodityMapper.selectSumSaleQuantityBySellerId(sellerId, null);
		}
		List<Integer> varietyIds = new ArrayList<Integer>();
		varietyIds.add(varietyId);
		List<Integer> parentIds = new ArrayList<Integer>();
		parentIds.add(varietyId);
		/* 层序遍历 */
		while (true) {
			List<Integer> childrenIds = varietyMapper.selectIdsByParentIds(parentIds);
			/* 查看是否到叶子节点 */
			if (childrenIds == null || childrenIds.size() < 1) {
				break;
			}
			varietyIds.addAll(childrenIds);
			parentIds = childrenIds;
		}
		CommodityVarietyExample commodityVarietyExample = new CommodityVarietyExample();
		commodityVarietyExample.createCriteria().andVarietyIdIn(varietyIds);
		List<CommodityVariety> commodityVarieties = commodityVarietyMapper.selectByExample(commodityVarietyExample);
		List<Integer> commodityIds = new ArrayList<Integer>();
		for (CommodityVariety commodityVariety : commodityVarieties) {
			Integer commodityId = commodityVariety.getCommodityId();
			if (commodityIds.contains(commodityId)) {
				continue;
			}
			commodityIds.add(commodityId);
		}
		if(commodityIds.size() < 1) {
			return null;
		}
		return commodityMapper.selectSumSaleQuantityBySellerId(sellerId, commodityIds);
	}
}
