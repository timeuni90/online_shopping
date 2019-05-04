package com.timeuni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timeuni.bean.Province;
import com.timeuni.dao.ProvinceMapper;

@Service
public class AddressService {
	@Autowired
	private ProvinceMapper provinceMapper;
	
	/* 获取所有的省 */
	public List<Province> getProvinces() {
		List<Province> provinces = provinceMapper.selectByExample(null);
		return provinces;
	}
	
}
