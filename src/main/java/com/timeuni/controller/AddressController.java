package com.timeuni.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.timeuni.bean.AddressDetail;
import com.timeuni.bean.Area;
import com.timeuni.bean.City;
import com.timeuni.bean.Province;
import com.timeuni.service.AddressService;

@Controller
public class AddressController {
	@Autowired
	private AddressService addressSerivce;
	
	/* 获取省 */
	@RequestMapping(value = "/provinces", method = RequestMethod.GET)
	@ResponseBody
	public List<Province> handleGetProvincesRequest() {
		return addressSerivce.getProvinces();
	}
	
	/* 获取市 */
	@RequestMapping(value = "/cities", method = RequestMethod.GET)
	@ResponseBody
	public List<City> handleGetCitiesRequest(String provinceId) {
		return addressSerivce.getCities(provinceId);
	}
	
	/* 获取区 */
	@RequestMapping(value = "/areas", method = RequestMethod.GET)
	@ResponseBody
	public List<Area> handleGetAreasRequest(String cityId) {
		return addressSerivce.getAreas(cityId);
	}

	/* 添加用户的收货地址 */
	@RequestMapping(value = "/addressdetail", method = RequestMethod.POST)
	@ResponseBody
	public Integer handleAddAddressRequest(HttpSession httpSession, AddressDetail addressDetail) {
		addressDetail.setUserId((Integer) httpSession.getAttribute("userId"));
		return addressSerivce.addAddressDetail(addressDetail);
	}
	
	/* 删除收货地址 */
	@RequestMapping(value = "/addressdetail", method = RequestMethod.DELETE)
	@ResponseBody
	public Integer handleDeleteAddressDetailRequest(HttpSession httpSession, Integer id) {
		Integer userId = (Integer) httpSession.getAttribute("userId");
		return addressSerivce.removeAddressDetailById(id, userId);
	}
}
