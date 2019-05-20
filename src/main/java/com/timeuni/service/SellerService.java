package com.timeuni.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.timeuni.bean.Commodity;
import com.timeuni.bean.CommodityExample;
import com.timeuni.bean.CommodityVariety;
import com.timeuni.bean.CommodityVarietyExample;
import com.timeuni.bean.Variety;
import com.timeuni.dao.CommodityMapper;
import com.timeuni.dao.CommodityVarietyMapper;
import com.timeuni.dao.VarietyMapper;
import com.timeuni.myexception.NoFindException;
import com.timeuni.resourcebundle.ResourceLocation;

@Service
public class SellerService {
	@Autowired
	private VarietyMapper varietyMapper;
	@Autowired
	private CommodityMapper commodityMapper;
	@Autowired
	private CommodityVarietyMapper commodityVarietyMapper;

	/* 获取商家的所有分类 */
	public List<Variety> getCategories(Integer sellerId) {
		List<Variety> varieties = varietyMapper.selectBySellerId(sellerId);
		return varieties;
	}

	/* 按类别获取商家的商品 */
	public PageInfo<Commodity> getProducts(Integer varietyId, Integer sellerId, Integer page, Integer sortType) {
		String commodityCoverImageLocation = new ResourceLocation().getCommodityCoverImageLocation();
		/* 返回所有商品 */
		if (varietyId == null) {
			PageHelper.startPage(page, 30);
			List<Commodity> commodities = commodityMapper.selectByCommodityIdsAndSellerId(sellerId, null, sortType,
					commodityCoverImageLocation);
			PageInfo<Commodity> pageInfo = new PageInfo<Commodity>(commodities, 5);
			return pageInfo;
		}
		/* 返回该类别的商品 */
		/* 记录所有子类别 */
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
		/*
		 * if(commodityIds.size() < 1) { throw new NoFindException(); }
		 */
		PageHelper.startPage(page, 30);
		List<Commodity> commodities = commodityMapper.selectByCommodityIdsAndSellerId(sellerId, commodityIds, sortType,
				commodityCoverImageLocation);
		/*
		 * if(commodities == null || commodities.size() < 1) { throw new
		 * NoFindException(); }
		 */
		PageInfo<Commodity> pageInfo = new PageInfo<Commodity>(commodities, 5);
		return pageInfo;
	}
}
