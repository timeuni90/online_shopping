package com.timeuni.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.timeuni.bean.Province;
import com.timeuni.service.AddressService;

@Controller
public class AddressController {
	@Autowired
	private AddressService addressSerivce;
	
	@RequestMapping(value = "/provinces", method = RequestMethod.GET)
	@ResponseBody
	public List<Province> handleGetProvincesRequest() {
		return addressSerivce.getProvinces();
	}
	
}
