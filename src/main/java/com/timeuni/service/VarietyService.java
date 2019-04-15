package com.timeuni.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timeuni.bean.Variety;
import com.timeuni.bean.VarietyExample;
import com.timeuni.dao.VarietyMapper;

@Service
public class VarietyService {
	@Autowired
	private  VarietyMapper varietyMapper; 
	
	/* 获取首页的分类 */
	public List<List<Variety>> getIndexClass(List<Integer> ids) {
		List<List<Variety>> list = new ArrayList<List<Variety>>();
		for (Integer id : ids) {
			VarietyExample varietyExample = new VarietyExample();
			varietyExample.createCriteria().andParentIdEqualTo(id);
			List<Variety> varieties = varietyMapper.selectByExample(varietyExample);
			for (Variety variety : varieties) {
				VarietyExample varietyExample2 = new VarietyExample();
				varietyExample2.createCriteria().andParentIdEqualTo(variety.getId());
				List<Variety> varieties2 = new ArrayList<Variety>();
				varieties2.add(variety);
				varieties2.addAll(varietyMapper.selectByExample(varietyExample2));
				list.add(varieties2);
			}
		}
		return list;
	}
	
}
