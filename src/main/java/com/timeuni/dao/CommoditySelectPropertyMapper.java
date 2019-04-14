package com.timeuni.dao;

import com.timeuni.bean.CommoditySelectProperty;
import com.timeuni.bean.CommoditySelectPropertyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommoditySelectPropertyMapper {
    long countByExample(CommoditySelectPropertyExample example);

    int deleteByExample(CommoditySelectPropertyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CommoditySelectProperty record);

    int insertSelective(CommoditySelectProperty record);

    List<CommoditySelectProperty> selectByExample(CommoditySelectPropertyExample example);

    CommoditySelectProperty selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CommoditySelectProperty record, @Param("example") CommoditySelectPropertyExample example);

    int updateByExample(@Param("record") CommoditySelectProperty record, @Param("example") CommoditySelectPropertyExample example);

    int updateByPrimaryKeySelective(CommoditySelectProperty record);

    int updateByPrimaryKey(CommoditySelectProperty record);
}