package com.timeuni.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timeuni.bean.Commodity;
import com.timeuni.bean.CommodityExtendProperty;
import com.timeuni.bean.CommodityExtendPropertyExample;
import com.timeuni.bean.CommoditySelectProperty;
import com.timeuni.bean.CommoditySelectPropertyExample;
import com.timeuni.bean.CommodityVariable;
import com.timeuni.bean.CommodityVariableExample;
import com.timeuni.dao.CommodityExtendPropertyMapper;
import com.timeuni.dao.CommodityMapper;
import com.timeuni.dao.CommoditySelectPropertyMapper;
import com.timeuni.dao.CommodityVariableMapper;
import com.timeuni.resourcebundle.ResourceLocation;

@Service
public class CommodityService {
	@Autowired
	private CommodityMapper commodityMapper;	
	@Autowired
	private CommoditySelectPropertyMapper commoditySelectPropertyMapper;
	@Autowired
	private CommodityVariableMapper commodityVariableMapper;
	@Autowired
	private CommodityExtendPropertyMapper commodityExtendPropertyMapper;
	
	/* 按关键字获取商品 */
	public List<Commodity> getCommoditiesBySearchKey(String key, Integer sortType) {
		key = "%" + key + "%";
		String commodityCoverImageLocation = new ResourceLocation().getCommodityCoverImageLocation();
		List<Commodity> commodities = commodityMapper.selectByKey(key, sortType, commodityCoverImageLocation);
		return commodities;
	}
	
	/* 按商品id获取商品信息 */
	public Commodity getCommodityById(Integer commodityId) {
		Commodity commodity = commodityMapper.selectByCommodityIdFromMultiTable(commodityId);
		CommoditySelectPropertyExample commoditySelectPropertyExample = new CommoditySelectPropertyExample();
		commoditySelectPropertyExample.createCriteria().andCommodityIdEqualTo(commodity.getId());
		List<CommoditySelectProperty> commoditySelectProperties = commoditySelectPropertyMapper.selectByExample(commoditySelectPropertyExample);
		commodity.setCommoditySelectProperties(commoditySelectProperties);
		CommodityVariableExample commodityVariableExample = new CommodityVariableExample();
		List<String> rows = new ArrayList<String>();
		for (CommoditySelectProperty commoditySelectProperty : commoditySelectProperties) {
			rows.add(commoditySelectProperty.getSelectPropertyRow());
		}
		commodityVariableExample.createCriteria().andSelectPropertyRowIn(rows);
		List<CommodityVariable> commodityVariables = commodityVariableMapper.selectByExample(commodityVariableExample);
		commodity.setCommodityVariables(commodityVariables);
		CommodityExtendPropertyExample commodityExtendPropertyExample = new CommodityExtendPropertyExample();
		commodityExtendPropertyExample.createCriteria().andCommodityIdEqualTo(commodity.getId());
		List<CommodityExtendProperty> commodityExtendProperties = commodityExtendPropertyMapper.selectByExample(commodityExtendPropertyExample);
		commodity.setCommodityExtendProperties(commodityExtendProperties);
		return commodity;
	}
	
}
