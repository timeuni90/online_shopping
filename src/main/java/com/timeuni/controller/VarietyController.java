package com.timeuni.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.timeuni.bean.Variety;
import com.timeuni.service.VarietyService;

@Controller
public class VarietyController {
	@Autowired
	private VarietyService varietyService;
	
	@ResponseBody
	@RequestMapping(value = "/indexclass/{string}", method = RequestMethod.GET)
	public List<List<Variety>> handleIndexClassReuqest(@PathVariable String string) {
		List<Integer> ids = new ArrayList<Integer>();
		String[] idStrings = string.split(",");
		for (String idString : idStrings) {
			ids.add(Integer.parseInt(idString));
		}
		List<List<Variety>> list = varietyService.getIndexClass(ids);
		return list;
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String handleIndexRequest() {
		System.out.println("a");
		return "shouye";
	}
}
