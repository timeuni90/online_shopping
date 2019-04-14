package com.timeuni.dao;

import com.timeuni.bean.OrderCommoditySelectProperty;
import com.timeuni.bean.OrderCommoditySelectPropertyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderCommoditySelectPropertyMapper {
    long countByExample(OrderCommoditySelectPropertyExample example);

    int deleteByExample(OrderCommoditySelectPropertyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(OrderCommoditySelectProperty record);

    int insertSelective(OrderCommoditySelectProperty record);

    List<OrderCommoditySelectProperty> selectByExample(OrderCommoditySelectPropertyExample example);

    OrderCommoditySelectProperty selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") OrderCommoditySelectProperty record, @Param("example") OrderCommoditySelectPropertyExample example);

    int updateByExample(@Param("record") OrderCommoditySelectProperty record, @Param("example") OrderCommoditySelectPropertyExample example);

    int updateByPrimaryKeySelective(OrderCommoditySelectProperty record);

    int updateByPrimaryKey(OrderCommoditySelectProperty record);
}