package com.timeuni.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.timeuni.bean.CollectCommodityExample;
import com.timeuni.bean.Comment;
import com.timeuni.bean.CommentAppend;
import com.timeuni.bean.CommentAppendExample;
import com.timeuni.bean.CommentImage;
import com.timeuni.bean.CommentImageExample;
import com.timeuni.bean.Commodity;
import com.timeuni.bean.CommodityExtendProperty;
import com.timeuni.bean.CommodityExtendPropertyExample;
import com.timeuni.bean.CommodityMediaResource;
import com.timeuni.bean.CommodityMediaResourceExample;
import com.timeuni.bean.CommoditySelectProperty;
import com.timeuni.bean.CommoditySelectPropertyExample;
import com.timeuni.bean.CommodityVariable;
import com.timeuni.bean.CommodityVariableExample;
import com.timeuni.bean.CommodityVariety;
import com.timeuni.bean.CommodityVarietyExample;
import com.timeuni.bean.OrderCommoditySelectProperty;
import com.timeuni.bean.OrderCommoditySelectPropertyExample;
import com.timeuni.bean.OrderDetail;
import com.timeuni.bean.OrderDetailExample;
import com.timeuni.dao.CollectCommodityMapper;
import com.timeuni.dao.CommentAppendMapper;
import com.timeuni.dao.CommentImageMapper;
import com.timeuni.dao.CommentMapper;
import com.timeuni.dao.CommodityExtendPropertyMapper;
import com.timeuni.dao.CommodityMapper;
import com.timeuni.dao.CommodityMediaResourceMapper;
import com.timeuni.dao.CommoditySelectPropertyMapper;
import com.timeuni.dao.CommodityVariableMapper;
import com.timeuni.dao.CommodityVarietyMapper;
import com.timeuni.dao.OrderCommoditySelectPropertyMapper;
import com.timeuni.dao.OrderDetailMapper;
import com.timeuni.dao.VarietyMapper;
import com.timeuni.myexception.NoFindException;
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
	@Autowired
	private CommodityMediaResourceMapper commodityMediaResourceMapper;
	@Autowired
	private CollectCommodityMapper collectCommodityMapper;
	@Autowired
	private CommentMapper commentMapper;
	@Autowired
	private OrderDetailMapper orderDetailMapper;
	@Autowired
	private OrderCommoditySelectPropertyMapper orderCommoditySelectPropertyMapper;
	@Autowired
	private CommentAppendMapper commentAppendMapper;
	@Autowired
	private CommentImageMapper commentImageMapper;
	@Autowired
	private VarietyMapper varietyMapper;
	@Autowired
	private CommodityVarietyMapper commodityVarietyMapper;
	
	/* 按照类别获取商品 */
	public PageInfo<Commodity> getCommoditiesByCategoryId(Integer varietyId, Integer page, Integer sortType) throws NoFindException {
		/* 记录所有子类别 */
		List<Integer> varietyIds = new ArrayList<Integer>();
		varietyIds.add(varietyId);
		List<Integer> parentIds = new ArrayList<Integer>();
		parentIds.add(varietyId);
		/* 层序遍历 */
		while(true) {
			List<Integer> childrenIds = varietyMapper.selectIdsByParentIds(parentIds);
			/* 查看是否到叶子节点 */
			if(childrenIds == null || childrenIds.size() < 1) {
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
			if(commodityIds.contains(commodityId)) {
				continue;
			}
			commodityIds.add(commodityId);
		}
		if(commodityIds.size() < 1) {
			throw new NoFindException();
		}
		String commodityCoverImageLocation = new ResourceLocation().getCommodityCoverImageLocation();
		PageHelper.startPage(page, 30);
		List<Commodity> commodities = commodityMapper.selectByCommodityIds(commodityIds, sortType, commodityCoverImageLocation);
		PageInfo<Commodity> pageInfo = new PageInfo<Commodity>(commodities, 5);
		return pageInfo;
	}
	
	/* 按收藏量来获取热门商品 */
	public List<Commodity> getRotCommodities() {
		String string = new ResourceLocation().getCommodityCoverImageLocation();
		return commodityMapper.selectRotCommodities(string);
	}
	
	/* 按关键字获取商品 */
	public PageInfo<Commodity> getCommoditiesBySearchKey(String key, Integer sortType, Integer page) throws NoFindException {
		key = "%" + key + "%";
		String commodityCoverImageLocation = new ResourceLocation().getCommodityCoverImageLocation();
		/* 分页插件，每页显示多少数据 */
		PageHelper.startPage(page, 30);
		List<Commodity> commodities = commodityMapper.selectByKey(key, sortType, commodityCoverImageLocation);
		if(commodities == null || commodities.size() < 1) {
			throw new NoFindException();
		}
		/* 封装查询结果，连续显示的页码 */
		PageInfo<Commodity> pageInfo = new PageInfo<Commodity>(commodities, 5);
		for (Commodity commodity : commodities) {
			commodity.setCommentQuantity(commodityMapper.selectCountCommodityComment(commodity.getId()));
		}
		return pageInfo;
	}
	
	/* 按商品id获取商品信息 */
	public Map<String, Object> getCommodityById(Integer commodityId) {
		/* 获取商品基本信息 */
		ResourceLocation resourceLocation = new ResourceLocation();
		String commodityCoverImageLocation = resourceLocation.getCommodityCoverImageLocation();
		String storeLogoLocation = resourceLocation.getStoreLogoLocation();
		Commodity commodity = commodityMapper.selectByCommodityIdFromMultiTable(commodityId, commodityCoverImageLocation, storeLogoLocation);
		/* 封装商品的评论 */
		List<Comment> comments = commentMapper.selectByCommodityIdWithUserName(commodityId);
		commodity.setComments(comments);
		if(comments != null && comments.size() > 0) {
			List<Integer> orderIds = new ArrayList<Integer>();
			List<Integer> commentIds = new ArrayList<Integer>();
			for (Comment comment : comments) {
				orderIds.add(comment.getOrderId());
				commentIds.add(comment.getId());
			}
			/* 查找评论的key-value */
		 	OrderDetailExample orderDetailExample = new OrderDetailExample();
		 	orderDetailExample.createCriteria().andOrderIdIn(orderIds).andCommodityIdEqualTo(commodityId);
		 	List<OrderDetail> orderDetails = orderDetailMapper.selectByExample(orderDetailExample);
		 	List<Integer> orderDetailIds = new ArrayList<Integer>(); 
		 	for (OrderDetail orderDetail : orderDetails) {
		 		orderDetailIds.add(orderDetail.getId());
			}
		 	OrderCommoditySelectPropertyExample orderCommoditySelectPropertyExample = new OrderCommoditySelectPropertyExample();
		 	orderCommoditySelectPropertyExample.createCriteria().andOrderDetailIdIn(orderDetailIds);
		 	List<OrderCommoditySelectProperty> orderCommoditySelectProperties = orderCommoditySelectPropertyMapper.selectByExample(orderCommoditySelectPropertyExample);
		 	for (Comment comment : comments) {
		 		List<OrderCommoditySelectProperty> orderCommoditySelectPropertys1 = new ArrayList<OrderCommoditySelectProperty>();
				for (OrderDetail orderDetail : orderDetails) {
					if(comment.getOrderId().intValue() == orderDetail.getOrderId().intValue()) {
						for (OrderCommoditySelectProperty orderCommoditySelectProperty : orderCommoditySelectProperties) {
							if(orderDetail.getId().intValue() == orderCommoditySelectProperty.getOrderDetailId().intValue()) {
								orderCommoditySelectPropertys1.add(orderCommoditySelectProperty);
							}
						}
					}
				}
				comment.setOrderCommoditySelectPropertys(orderCommoditySelectPropertys1);
			}
		 	/* 查找追评 */
		 	CommentAppendExample commentAppendExample = new CommentAppendExample();
		 	commentAppendExample.createCriteria().andCommentIdIn(commentIds);
		 	List<CommentAppend> commentAppends = commentAppendMapper.selectByExample(commentAppendExample);
		 	List<Integer> commentAppendIds = new ArrayList<Integer>();
		 	for (CommentAppend commentAppend : commentAppends) {
		 		commentAppendIds.add(commentAppend.getId());
			}
		 	CommentImageExample commentImageExample = new CommentImageExample();
		 	commentImageExample.createCriteria().andCommentAppendIdIn(commentAppendIds);
		 	List<CommentImage> commentImages = commentImageMapper.selectByExample(commentImageExample);
		 	for (CommentAppend commentAppend : commentAppends) {
		 		List<CommentImage> commentImages1 = new ArrayList<CommentImage>();
		 		boolean flag = false;
				for (CommentImage commentImage : commentImages) {
					if(commentAppend.getId().intValue() == commentImage.getCommentAppendId().intValue()) {
						flag = true;
						commentImages1.add(commentImage);
					}
				}
				if(flag) {
					commentAppend.setCommentImages(commentImages1);
				}
			}
		 	for (Comment comment : comments) {
		 		List<CommentAppend> commentAppends1 = new ArrayList<CommentAppend>();
				for(CommentAppend commentAppend : commentAppends) {
					if(comment.getId().intValue() == commentAppend.getCommentId().intValue()) {
						commentAppends1.add(commentAppend);
					}
				}
				comment.setCommentAppends(commentAppends1);
			}
		}
		/* 获取商品的收藏量（人气）*/
		CollectCommodityExample collectCommodityExample = new CollectCommodityExample();
		collectCommodityExample.createCriteria().andCommodityIdEqualTo(commodityId);
		commodity.setCollectQuantity(collectCommodityMapper.countByExample(collectCommodityExample));
		/* 封装商品的媒体资源 */
		CommodityMediaResourceExample commodityMediaResourceExample = new CommodityMediaResourceExample();
		commodityMediaResourceExample.createCriteria().andCommodityIdEqualTo(commodityId);
		List<CommodityMediaResource> commodityMediaResources = commodityMediaResourceMapper.selectByExample(commodityMediaResourceExample);
		commodity.setCommodityMediaResources(commodityMediaResources);
		/* 封装商品的可选属性 */
		CommoditySelectPropertyExample commoditySelectPropertyExample = new CommoditySelectPropertyExample();
		commoditySelectPropertyExample.createCriteria().andCommodityIdEqualTo(commodity.getId());
		List<CommoditySelectProperty> commoditySelectProperties = commoditySelectPropertyMapper.selectByExample(commoditySelectPropertyExample);
		/* 封装商品的变量信息，总库存 */
		CommodityVariableExample commodityVariableExample = new CommodityVariableExample();
		List<String> rows = new ArrayList<String>();
		for (CommoditySelectProperty commoditySelectProperty : commoditySelectProperties) {
			rows.add(commoditySelectProperty.getSelectPropertyRow());
		}
		commodityVariableExample.createCriteria().andSelectPropertyRowIn(rows);
		List<CommodityVariable> commodityVariables = commodityVariableMapper.selectByExample(commodityVariableExample);
		commodity.setCommodityVariables(commodityVariables);
		int stock = 0;
		for (CommodityVariable commodityVariable : commodityVariables) {
			stock += commodityVariable.getStock();
		}
		commodity.setStock(stock);
		/* 封装商品的扩展属性 */
		CommodityExtendPropertyExample commodityExtendPropertyExample = new CommodityExtendPropertyExample();
		commodityExtendPropertyExample.createCriteria().andCommodityIdEqualTo(commodity.getId());
		List<CommodityExtendProperty> commodityExtendProperties = commodityExtendPropertyMapper.selectByExample(commodityExtendPropertyExample);
		commodity.setCommodityExtendProperties(commodityExtendProperties);
		/* 封装商品的月销量 */
		commodity.setMonthSale(commodityMapper.selectMonthSaleByCommodityId(commodityId));
		/* 封装商品的累计评价量 */
		commodity.setCommentQuantity(commodityMapper.selectCountCommodityComment(commodityId));
		/* 去除重复value，提取可选属性value的所有行 */
		for(int i = 0; i < commoditySelectProperties.size(); i++) {
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
		/* 按属性名分组装配 */
		Map<String, List<CommoditySelectProperty>> commodityPropertyGroup = new HashMap<String, List<CommoditySelectProperty>>();
		for (CommoditySelectProperty commoditySelectProperty : commoditySelectProperties) {
			String propertyName = commoditySelectProperty.getPropertyName();
			if(commodityPropertyGroup.containsKey(propertyName)) {
				List<CommoditySelectProperty> list = commodityPropertyGroup.get(propertyName);
				list.add(commoditySelectProperty);
			} else {
				List<CommoditySelectProperty> list = new ArrayList<CommoditySelectProperty>();
				list.add(commoditySelectProperty);
				commodityPropertyGroup.put(propertyName, list);
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sellerId", commodity.getSellerId());
		map.put("commodity", commodity);
		map.put("commodityPropertyGroup", commodityPropertyGroup);
		return map;
	}
}
