package com.timeuni.dao;

import com.timeuni.bean.CommodityExtendProperty;
import com.timeuni.bean.CommodityExtendPropertyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommodityExtendPropertyMapper {
    long countByExample(CommodityExtendPropertyExample example);

    int deleteByExample(CommodityExtendPropertyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CommodityExtendProperty record);

    int insertSelective(CommodityExtendProperty record);

    List<CommodityExtendProperty> selectByExample(CommodityExtendPropertyExample example);

    CommodityExtendProperty selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CommodityExtendProperty record, @Param("example") CommodityExtendPropertyExample example);

    int updateByExample(@Param("record") CommodityExtendProperty record, @Param("example") CommodityExtendPropertyExample example);

    int updateByPrimaryKeySelective(CommodityExtendProperty record);

    int updateByPrimaryKey(CommodityExtendProperty record);
}