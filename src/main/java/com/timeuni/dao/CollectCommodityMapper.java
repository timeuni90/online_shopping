package com.timeuni.dao;

import com.timeuni.bean.CollectCommodity;
import com.timeuni.bean.CollectCommodityExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CollectCommodityMapper {
    long countByExample(CollectCommodityExample example);

    int deleteByExample(CollectCommodityExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CollectCommodity record);

    int insertSelective(CollectCommodity record);

    List<CollectCommodity> selectByExample(CollectCommodityExample example);

    CollectCommodity selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CollectCommodity record, @Param("example") CollectCommodityExample example);

    int updateByExample(@Param("record") CollectCommodity record, @Param("example") CollectCommodityExample example);

    int updateByPrimaryKeySelective(CollectCommodity record);

    int updateByPrimaryKey(CollectCommodity record);
}