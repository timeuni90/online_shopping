package com.timeuni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timeuni.bean.Variety;
import com.timeuni.bean.VarietyExample;
import com.timeuni.dao.VarietyMapper;

@Service
public class BackStageVarietyService {
	@Autowired
	private VarietyMapper varietyMapper;
	
	public List<Variety> getVarieties(Integer parentId) {
		if(parentId == null) {
			return null;
		}
		VarietyExample varietyExample = new VarietyExample();
		varietyExample.createCriteria().andParentIdEqualTo(parentId);
		List<Variety> varieties = varietyMapper.selectByExample(varietyExample);
		return varieties;
	}
	
}
