package com.timeuni.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.timeuni.bean.Variety;
import com.timeuni.service.BackStageVarietyService;

@Controller
public class BackStageVarietyController {
	@Autowired
 	private BackStageVarietyService backStageVariety;
	
	/* 获取一层子分类 */
	@RequestMapping(value = "/backstage/varieties", method= RequestMethod.GET)
	@ResponseBody
	public List<Variety> handleGetVarietiesRequest(Integer parentId) {
		return backStageVariety.getVarieties(parentId);
	}
	
}
