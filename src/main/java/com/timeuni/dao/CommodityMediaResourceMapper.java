package com.timeuni.dao;

import com.timeuni.bean.CommodityMediaResource;
import com.timeuni.bean.CommodityMediaResourceExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommodityMediaResourceMapper {
    long countByExample(CommodityMediaResourceExample example);

    int deleteByExample(CommodityMediaResourceExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CommodityMediaResource record);

    int insertSelective(CommodityMediaResource record);

    List<CommodityMediaResource> selectByExample(CommodityMediaResourceExample example);

    CommodityMediaResource selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CommodityMediaResource record, @Param("example") CommodityMediaResourceExample example);

    int updateByExample(@Param("record") CommodityMediaResource record, @Param("example") CommodityMediaResourceExample example);

    int updateByPrimaryKeySelective(CommodityMediaResource record);

    int updateByPrimaryKey(CommodityMediaResource record);
}