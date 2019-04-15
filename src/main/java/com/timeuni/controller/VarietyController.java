package com.timeuni.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<List<Variety>> handleIndexReuqest(@PathVariable String string) {
		List<Integer> ids = new ArrayList<Integer>();
		String[] idStrings = string.split(",");
		for (String idString : idStrings) {
			ids.add(Integer.parseInt(idString));
		}
		List<List<Variety>> list = varietyService.getIndexClass(ids);
		//Map<String, List<List<Variety>>> map = new HashMap<String, List<List<Variety>>>();
		//map.put("msg", list);
		return list;
	}
}
