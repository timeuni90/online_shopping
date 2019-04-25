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
		/* 获取商品基本信息 */
		ResourceLocation resourceLocation = new ResourceLocation();
		String commodityCoverImageLocation = resourceLocation.getCommodityCoverImageLocation();
		String storeLogoLocation = resourceLocation.getStoreLogoLocation();
		Commodity commodity = commodityMapper.selectByCommodityIdFromMultiTable(commodityId, commodityCoverImageLocation, storeLogoLocation);
		CommoditySelectPropertyExample commoditySelectPropertyExample = new CommoditySelectPropertyExample();
		commoditySelectPropertyExample.createCriteria().andCommodityIdEqualTo(commodity.getId());
		/* 封装商品的可选属性 */
		List<CommoditySelectProperty> commoditySelectProperties = commoditySelectPropertyMapper.selectByExample(commoditySelectPropertyExample);
		commodity.setCommoditySelectProperties(commoditySelectProperties);
		CommodityVariableExample commodityVariableExample = new CommodityVariableExample();
		List<String> rows = new ArrayList<String>();
		for (CommoditySelectProperty commoditySelectProperty : commoditySelectProperties) {
			rows.add(commoditySelectProperty.getSelectPropertyRow());
		}
		commodityVariableExample.createCriteria().andSelectPropertyRowIn(rows);
		/* 封装商品的变量信息 */
		List<CommodityVariable> commodityVariables = commodityVariableMapper.selectByExample(commodityVariableExample);
		commodity.setCommodityVariables(commodityVariables);
		CommodityExtendPropertyExample commodityExtendPropertyExample = new CommodityExtendPropertyExample();
		commodityExtendPropertyExample.createCriteria().andCommodityIdEqualTo(commodity.getId());
		List<CommodityExtendProperty> commodityExtendProperties = commodityExtendPropertyMapper.selectByExample(commodityExtendPropertyExample);
		commodity.setCommodityExtendProperties(commodityExtendProperties);
		/* 封装商品的月销量 */
		commodity.setMonthSale(commodityMapper.selectMonthSaleByCommodityId(commodityId));
		/* 封装商品的累计评价 */
		commodity.setCommentQuantity(commodityMapper.selectCountCommodityComment(commodityId));
		/* 提取可选属性value的所有行 */
		for(int i = 0; i < commoditySelectProperties.size() - 1; i++) {
			CommoditySelectProperty commoditySelectProperty1 = commoditySelectProperties.get(i);
			commoditySelectProperty1.setRows(commoditySelectProperty1.getSelectPropertyRow());
			for(int j = i + 1; j < commoditySelectProperties.size(); j++) {
				CommoditySelectProperty commoditySelectProperty2 = commoditySelectProperties.get(j);
				if(commoditySelectProperty1.getPropertyName().equals(commoditySelectProperty2.getPropertyName()) && 
						commoditySelectProperty1.getPropertyValue().equals(commoditySelectProperty2.getPropertyValue())) {
					String rowsString = commoditySelectProperty1.getRows() + "," + commoditySelectProperty2.getSelectPropertyRow();
					commoditySelectProperty1.setRows(rowsString);
					commoditySelectProperties.remove(j);
					j--;
				}
			}
		}
		/* 将可选属性分组装配 */
		return commodity;
	}
	
}
