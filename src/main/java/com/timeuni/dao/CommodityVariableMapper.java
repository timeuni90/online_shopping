package com.timeuni.dao;

import com.timeuni.bean.CommodityVariable;
import com.timeuni.bean.CommodityVariableExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommodityVariableMapper {
    long countByExample(CommodityVariableExample example);

    int deleteByExample(CommodityVariableExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CommodityVariable record);

    int insertSelective(CommodityVariable record);

    List<CommodityVariable> selectByExample(CommodityVariableExample example);

    CommodityVariable selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CommodityVariable record, @Param("example") CommodityVariableExample example);

    int updateByExample(@Param("record") CommodityVariable record, @Param("example") CommodityVariableExample example);

    int updateByPrimaryKeySelective(CommodityVariable record);

    int updateByPrimaryKey(CommodityVariable record);
}