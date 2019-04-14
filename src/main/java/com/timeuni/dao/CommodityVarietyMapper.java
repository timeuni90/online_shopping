package com.timeuni.dao;

import com.timeuni.bean.CommodityVariety;
import com.timeuni.bean.CommodityVarietyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommodityVarietyMapper {
    long countByExample(CommodityVarietyExample example);

    int deleteByExample(CommodityVarietyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CommodityVariety record);

    int insertSelective(CommodityVariety record);

    List<CommodityVariety> selectByExample(CommodityVarietyExample example);

    CommodityVariety selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CommodityVariety record, @Param("example") CommodityVarietyExample example);

    int updateByExample(@Param("record") CommodityVariety record, @Param("example") CommodityVarietyExample example);

    int updateByPrimaryKeySelective(CommodityVariety record);

    int updateByPrimaryKey(CommodityVariety record);
}