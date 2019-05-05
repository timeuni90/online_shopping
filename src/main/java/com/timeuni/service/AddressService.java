package com.timeuni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timeuni.bean.AddressDetail;
import com.timeuni.bean.AddressDetailExample;
import com.timeuni.bean.Area;
import com.timeuni.bean.AreaExample;
import com.timeuni.bean.City;
import com.timeuni.bean.CityExample;
import com.timeuni.bean.Province;
import com.timeuni.dao.AddressDetailMapper;
import com.timeuni.dao.AreaMapper;
import com.timeuni.dao.CityMapper;
import com.timeuni.dao.ProvinceMapper;

@Service
public class AddressService {
	@Autowired
	private ProvinceMapper provinceMapper;
	@Autowired
	private CityMapper cityMapper;
	@Autowired
	private AreaMapper areaMapper;
	@Autowired
	private AddressDetailMapper addressDetailMapper;
	
	/* 获取所有的省 */
	public List<Province> getProvinces() {
		List<Province> provinces = provinceMapper.selectByExample(null);
		return provinces;
	}
	
	/* 获取对应所有的市 */
	public List<City> getCities(String provinceId) {
		CityExample cityExample = new CityExample ();
		cityExample.createCriteria().andProvinceIdEqualTo(provinceId);
		List<City> cities = cityMapper.selectByExample(cityExample);
		return cities;
	}
	
	/* 获取对应的区 */
	public List<Area> getAreas(String cityId) {
		AreaExample areaExample = new AreaExample();
		areaExample.createCriteria().andCityIdEqualTo(cityId);
		return areaMapper.selectByExample(areaExample);
	}
	
	/* 保存新增地址 */
	public Integer addAddressDetail(AddressDetail addressDetail) {
		addressDetailMapper.insertSelective(addressDetail);
		return addressDetail.getId();
	}
	
	/* 删除收货地址 */
	public Integer removeAddressDetailById(Integer id, Integer userId) {
		AddressDetailExample addressDetailExample = new AddressDetailExample();
		addressDetailExample.createCriteria().andIdEqualTo(id).andUserIdEqualTo(userId);
		return addressDetailMapper.deleteByExample(addressDetailExample);
	}
}
