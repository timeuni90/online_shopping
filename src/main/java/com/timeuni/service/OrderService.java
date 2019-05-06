package com.timeuni.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alipay.api.AlipayApiException;
import com.timeuni.bean.AddressDetail;
import com.timeuni.bean.Area;
import com.timeuni.bean.AreaExample;
import com.timeuni.bean.City;
import com.timeuni.bean.CityExample;
import com.timeuni.bean.Commodity;
import com.timeuni.bean.CommoditySelectProperty;
import com.timeuni.bean.CommoditySelectPropertyExample;
import com.timeuni.bean.CommodityVariable;
import com.timeuni.bean.CommodityVariableExample;
import com.timeuni.bean.Order;
import com.timeuni.bean.OrderCommoditySelectProperty;
import com.timeuni.bean.OrderDetail;
import com.timeuni.bean.OrderDetailExample;
import com.timeuni.bean.OrderExample;
import com.timeuni.bean.Province;
import com.timeuni.bean.ProvinceExample;
import com.timeuni.bean.Seller;
import com.timeuni.bean.User;
import com.timeuni.dao.AddressDetailMapper;
import com.timeuni.dao.AreaMapper;
import com.timeuni.dao.CartMapper;
import com.timeuni.dao.CityMapper;
import com.timeuni.dao.CommodityMapper;
import com.timeuni.dao.CommoditySelectPropertyMapper;
import com.timeuni.dao.CommodityVariableMapper;
import com.timeuni.dao.OrderCommoditySelectPropertyMapper;
import com.timeuni.dao.OrderDetailMapper;
import com.timeuni.dao.OrderMapper;
import com.timeuni.dao.ProvinceMapper;
import com.timeuni.dao.SellerMapper;
import com.timeuni.dao.UserMapper;
import com.timeuni.mybean.CartItem;
import com.timeuni.mybean.SubmitOrder;
import com.timeuni.mybean.SubmitOrderCommodity;
import com.timeuni.resourcebundle.ResourceLocation;
import com.timeuni.status.OrderStatus;
import com.timeuni.pay.Alipay;;

@Service
public class OrderService {
	@Autowired
	private CommodityMapper commodityMapper;
	@Autowired
	private SellerMapper sellerMapper;
	@Autowired
	private CommoditySelectPropertyMapper commoditySelectPropertyMapper;
	@Autowired
	private CommodityVariableMapper commodityVariableMapper;
	@Autowired
	private CartMapper cartMapper;
	@Autowired
	private AddressDetailMapper addressDetailMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private AreaMapper areaMapper;
	@Autowired
	private CityMapper cityMapper;
	@Autowired
 	private ProvinceMapper provinceMapper;
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private OrderDetailMapper orderDetailMapper;
	@Autowired
	OrderCommoditySelectPropertyMapper orderCommoditySelectPropertyMapper;
	
	/* 直接购买，获取待确认订单的信息 */
	public Map<String, Object> getPrepareOrderInformation(Integer commodityId, String row, Integer quantity, Integer userId) {
		/* 获取用户的收货地址 */
		List<AddressDetail> addressDetails = addressDetailMapper.selectAllAdressByUserId(userId);
		/* 获得商品 */
		Map<String, Object> map = new HashMap<String, Object>();
		Commodity commodity = commodityMapper.selectByPrimaryKey(commodityId);
		/* 获得商家 */
		Seller seller = sellerMapper.selectByPrimaryKey(commodity.getSellerId());
		commodity.setSeller(seller);
		/* 获得商品可选属性 */
		CommoditySelectPropertyExample commoditySelectPropertyExample = new CommoditySelectPropertyExample();
		commoditySelectPropertyExample.createCriteria().andSelectPropertyRowEqualTo(row);
		List<CommoditySelectProperty> commoditySelectProperties = commoditySelectPropertyMapper.selectByExample(commoditySelectPropertyExample);
		String commodityParameter = "";
		for (CommoditySelectProperty commoditySelectProperty : commoditySelectProperties) {
			String[] split = commoditySelectProperty.getPropertyValue().split("jpg\\+");
			if(split.length > 1) {
				commodityParameter += split[1] + " ";
			} else {
				commodityParameter += split[0] + " ";
			}
		}
		/* 获得商品变量 */
		CommodityVariableExample commodityVariableExample = new CommodityVariableExample();
		commodityVariableExample.createCriteria().andSelectPropertyRowEqualTo(row);
		List<CommodityVariable> commodityVariables = commodityVariableMapper.selectByExample(commodityVariableExample);
		CommodityVariable commodityVariable = commodityVariables.get(0);
		/* 计算总价 */
		Float allPrice = commodityVariables.get(0).getPrice() * quantity;
		if(commodityVariables.get(0).getPromotionPrice() != null) {
			allPrice = commodityVariables.get(0).getPromotionPrice() * quantity;
		}
		/* 封装到CartItem中 */
		CartItem cartItem = new CartItem();
		cartItem.setCommodityId(commodity.getId()).setCommodityParameter(commodityParameter).
			setCoverImage(new ResourceLocation().getCommodityCoverImageLocation() + commodity.getCoverImage()).
			setPrice(commodityVariable.getPrice()).setPromotionPrice(commodityVariable.getPromotionPrice()).
			setQuantity(quantity).setRow(row).setStoreName(seller.getStoreName()).setTitle(commodity.getTitle());
		List<CartItem> list = new ArrayList<CartItem>();
		list.add(cartItem);
		Map<String, List<CartItem>> groups = new HashMap<String, List<CartItem>>();
		groups.put(seller.getStoreName(), list);
		map.put("groups", groups);
		map.put("totalPrice", allPrice);
		map.put("addressDetails", addressDetails);
		return map;
	}
	
	/* 购物车生成确认订单信息 */
	public Map<String, Object> getPrepareOrdersInformationFromCart(Integer userId, List<String> rows) {
		/* 获取用户的收货地址 */
		List<AddressDetail> addressDetails = addressDetailMapper.selectAllAdressByUserId(userId);
		/* 获取提交的购物车商品信息 */
		String coverLocation = new ResourceLocation().getCommodityCoverImageLocation();
		List<CartItem> cartItems = cartMapper.selectCartItemsByUserId(userId, coverLocation, rows);
		Map<String, List<CartItem>> groups = new HashMap<String, List<CartItem>>();
		Float totalPrice = (float)0;
		for (CartItem cartItem : cartItems) {
			if(cartItem.getPromotionPrice() != null) {
				totalPrice += cartItem.getPromotionPrice() * cartItem.getQuantity();
			} else {
				totalPrice += cartItem.getPrice() * cartItem.getQuantity();
			}
			if(groups.containsKey(cartItem.getStoreName())) {
				groups.get(cartItem.getStoreName()).add(cartItem);
			} else {
				List<CartItem> list = new ArrayList<CartItem>();
				list.add(cartItem);
				groups.put(cartItem.getStoreName(), list);
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("groups", groups);
		map.put("totalPrice", totalPrice);
		map.put("addressDetails", addressDetails);
		return map;
	}
	
	/* 添加订单 */
	public List<Integer> addOrder(Integer userId, SubmitOrder submitOrder) {
		List<Integer> orderIds = new ArrayList<Integer>();
		AddressDetail addressDetail = addressDetailMapper.selectByPrimaryKey(submitOrder.getDetailAddressId());
		AreaExample areaExample = new AreaExample();
		areaExample.createCriteria().andAreaIdEqualTo(addressDetail.getAreaId());
		Area area = areaMapper.selectByExample(areaExample).get(0);
		CityExample cityExample = new CityExample();
		cityExample.createCriteria().andCityIdEqualTo(area.getCityId());
		City city = cityMapper.selectByExample(cityExample).get(0);
		ProvinceExample provinceExample = new ProvinceExample();
		provinceExample.createCriteria().andProvinceIdEqualTo(city.getProvinceId());
		Province province = provinceMapper.selectByExample(provinceExample).get(0);
		String receiveAddress = province.getProvince() + city.getCity() + area.getArea() + "+" + addressDetail.getDetailAddress() + "+" + addressDetail.getReceiver() + "+" + addressDetail.getPhoneNumber();
		for(List<SubmitOrderCommodity> SubmitOrderCommodities : submitOrder.getSubmitOrderCommodityGroups()) {
			/* 生成唯一订单号 */
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MMddHHmmss");
		    String orderNumber = simpleDateFormat.format(new Date());
		    Random random = new Random();
	        for(int i = 0; i < 10; i++){
	        	orderNumber += random.nextInt(10);
	        }
			User user = userMapper.selectByPrimaryKey(userId);
			Commodity commodity = commodityMapper.selectByPrimaryKey(SubmitOrderCommodities.get(0).getCommodityId());
			Seller seller = sellerMapper.selectByPrimaryKey(commodity.getSellerId());
			Order order = new Order();
			order.setUserId(userId).setSellerId(commodity.getSellerId()).setUserName(user.getName()).
				setOrderNumber(orderNumber).setStoreName(seller.getStoreName()).
				setStatus(OrderStatus.UNPAID.ordinal()).setReceiveAddress(receiveAddress);
			/* 插入订单 */
			orderMapper.insertSelective(order);
			orderIds.add(order.getId());
			for (SubmitOrderCommodity submitOrderCommodity : SubmitOrderCommodities) {
				CommodityVariableExample commodityVariableExample = new CommodityVariableExample();
				commodityVariableExample.createCriteria().andSelectPropertyRowEqualTo(submitOrderCommodity.getRow());
				CommodityVariable commodityVariable = commodityVariableMapper.selectByExample(commodityVariableExample).get(0);
				CommoditySelectPropertyExample commoditySelectPropertyExample = new CommoditySelectPropertyExample();
				commoditySelectPropertyExample.createCriteria().andSelectPropertyRowEqualTo(submitOrderCommodity.getRow());
				List<CommoditySelectProperty> commoditySelectProperties = commoditySelectPropertyMapper.selectByExample(commoditySelectPropertyExample);
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setOrderId(order.getId()).setCommodityId(commodity.getId()).setCommotityName(commodity.getTitle()).
					setCommodityCover(commodity.getCoverImage()).setPrice(commodityVariable.getPrice()).
					setPromotionPrice(commodityVariable.getPromotionPrice()).setQuantity(submitOrderCommodity.getQuantity());
				/* 插入订单详情 */
				orderDetailMapper.insertSelective(orderDetail);
				for (CommoditySelectProperty commoditySelectProperty : commoditySelectProperties) {
					OrderCommoditySelectProperty orderCommoditySelectProperty = new OrderCommoditySelectProperty();
					orderCommoditySelectProperty.setOrderDetailId(orderDetail.getId()).setPropertyName(commoditySelectProperty.getPropertyName()).setPropertyValue(commoditySelectProperty.getPropertyValue());
					orderCommoditySelectPropertyMapper.insertSelective(orderCommoditySelectProperty);
				}
			}
		}
		return orderIds;
	}
	
	public String  Alipay(List<Integer> orderIds) throws AlipayApiException {
		OrderExample orderExample = new OrderExample();
		orderExample.createCriteria().andIdIn(orderIds);
		List<Order> orders = orderMapper.selectByExample(orderExample);
		OrderDetailExample orderDetailExample = new OrderDetailExample();
		orderDetailExample.createCriteria().andOrderIdIn(orderIds);
		List<OrderDetail> orderDetails = orderDetailMapper.selectByExample(orderDetailExample);
		Float payPrice = (float) 0;
		for (OrderDetail orderDetail : orderDetails) {
			if(orderDetail.getPromotionPrice() != null) {
				payPrice += orderDetail.getPromotionPrice() * orderDetail.getQuantity();
			} else {
				payPrice += orderDetail.getPrice() * orderDetail.getQuantity();
			}
		}
		Alipay alipay = new Alipay();
		return alipay.pay(orders.get(0).getOrderNumber(), payPrice, "pay");
	}
}
