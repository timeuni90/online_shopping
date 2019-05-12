package com.timeuni.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.timeuni.bean.Commodity;
import com.timeuni.bean.CommodityExample;
import com.timeuni.bean.CommodityMediaResource;
import com.timeuni.bean.CommodityMediaResourceExample;
import com.timeuni.bean.CommoditySelectProperty;
import com.timeuni.bean.CommodityVariable;
import com.timeuni.dao.CommodityMapper;
import com.timeuni.dao.CommodityMediaResourceMapper;
import com.timeuni.dao.CommoditySelectPropertyMapper;
import com.timeuni.dao.CommodityVariableMapper;
import com.timeuni.mybean.BackStageProductKeyValue;
import com.timeuni.mybean.BackStageProductRow;
import com.timeuni.mybean.BackstageProduct;
import com.timeuni.mybean.SellerProduct;
import com.timeuni.status.CommodityPropertyType;
import com.timeuni.status.ProductMediaType;
import com.timeuni.status.ProductStatus;

@Service
public class BackStageCommodityService {
	@Autowired
	private CommodityMapper commodityMapper;
	@Autowired
	private CommoditySelectPropertyMapper commoditySelectPropertyMapper;
	@Autowired
	private CommodityVariableMapper commodityVariableMapper;
	@Autowired
	private CommodityMediaResourceMapper commodityMediaResourceMapper;
	
	/* 获取商家的商品 */
	public PageInfo<SellerProduct> getCommoditiesBySellerId(Integer sellerId, Integer page) {
		PageHelper.startPage(page, 10);
		List<SellerProduct> sellerProducts = commodityMapper.selectBySellerId(sellerId);
		PageInfo<SellerProduct> pageInfo = new PageInfo<SellerProduct>(sellerProducts, 5);
		return pageInfo;
	}
	
	/* 添加商品 */
	public Map<String, Object> addProduct(BackstageProduct product, Integer sellerId) {
		Map<String, String> propertyMap = new HashMap<String, String>();
		Commodity commodity = new Commodity();
		commodity.setTitle(product.getName());
		commodity.setSellerId(sellerId);
		CommodityExample commodityExample = new CommodityExample();
		commodityExample.createCriteria().andSellerIdEqualTo(sellerId);
		commodityMapper.insertSelective(commodity);
		for (BackStageProductRow row : product.getRows()) {
			String rowNumber = UUID.randomUUID().toString();
			for (BackStageProductKeyValue property : row.getProperties()) {
				CommoditySelectProperty commoditySelectProperty = new CommoditySelectProperty();
				commoditySelectProperty.setCommodityId(commodity.getId());
				commoditySelectProperty.setSelectPropertyRow(rowNumber);
				commoditySelectProperty.setMediaType(property.getType());
				commoditySelectProperty.setPropertyName(property.getPropertyName());
				if(property.getType() == CommodityPropertyType.TEXT_IMAGE.ordinal()) {
					String key = property.getPropertyName() + property.getPropertyValue();
					if(!propertyMap.containsKey(key)) {
						String imageName = UUID.randomUUID().toString() + ".jpg";
						propertyMap.put(key, imageName);
					}
					property.setPropertyValue(propertyMap.get(key) + "+" + property.getPropertyValue());
				}
				commoditySelectProperty.setPropertyValue(property.getPropertyValue());
				commoditySelectPropertyMapper.insertSelective(commoditySelectProperty);
			}
			CommodityVariable commodityVariable = new CommodityVariable();
			commodityVariable.setSelectPropertyRow(rowNumber);
			commodityVariable.setPrice(row.getPrice());
			commodityVariable.setStock(row.getStock());
			commodityVariableMapper.insertSelective(commodityVariable);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commodityId", commodity.getId());
		map.put("propertyMap", propertyMap);
		return map;
	}
	
	/* 添加商品的宣传图片 */
	public void addProductImages(Integer commodityId, String realPath, MultipartFile[] multipartFiles)
			throws IllegalStateException, IOException {
		for (MultipartFile multipartFile : multipartFiles) {
			String originalFilename = multipartFile.getOriginalFilename();
			String type = originalFilename.substring(originalFilename.lastIndexOf("."));
			String imageName = UUID.randomUUID().toString() + type;
			CommodityMediaResource commodityMediaResource = new CommodityMediaResource();
			commodityMediaResource.setCommodityId(commodityId);
			commodityMediaResource.setLocation(imageName);
			commodityMediaResource.setMediaType(ProductMediaType.IMAGE.ordinal());
			commodityMediaResourceMapper.insertSelective(commodityMediaResource);
			File file = new File(realPath + "/" + imageName);
			multipartFile.transferTo(file);
		}
	}
	
	/* 批量删除商品 */
	public Integer removeProdutes(List<Integer> ids) {
		CommodityExample commodityExample = new CommodityExample();
		commodityExample.createCriteria().andIdIn(ids);
		Commodity commodity = new Commodity();
		commodity.setIsDelete(true);
		return commodityMapper.updateByExampleSelective(commodity, commodityExample);
	}
	
	/* 商品上架 */
	public Integer shangjia(List<Integer> ids) {
		CommodityExample commodityExample = new CommodityExample();
		commodityExample.createCriteria().andIdIn(ids);
		Commodity commodity = new Commodity();
		commodity.setStatus(ProductStatus.shangjia.ordinal());
		return commodityMapper.updateByExampleSelective(commodity, commodityExample);
	}
	
	/* 商品下架 */
	public Integer xiajia(List<Integer> ids) {
		CommodityExample commodityExample = new CommodityExample();
		commodityExample.createCriteria().andIdIn(ids);
		Commodity commodity = new Commodity();
		commodity.setStatus(ProductStatus.xiajia.ordinal());
		return commodityMapper.updateByExampleSelective(commodity, commodityExample);
	}
}
