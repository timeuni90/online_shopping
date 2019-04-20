package com.timeuni.dao;

import com.timeuni.bean.Commodity;
import com.timeuni.bean.CommodityExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommodityMapper {
    long countByExample(CommodityExample example);

    int deleteByExample(CommodityExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Commodity record);

    int insertSelective(Commodity record);

    List<Commodity> selectByExampleWithBLOBs(CommodityExample example);

    List<Commodity> selectByExample(CommodityExample example);

    Commodity selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Commodity record, @Param("example") CommodityExample example);

    int updateByExampleWithBLOBs(@Param("record") Commodity record, @Param("example") CommodityExample example);

    int updateByExample(@Param("record") Commodity record, @Param("example") CommodityExample example);

    int updateByPrimaryKeySelective(Commodity record);

    int updateByPrimaryKeyWithBLOBs(Commodity record);

    int updateByPrimaryKey(Commodity record);
    
    /* 以下为新增方法 */
    
    /* 按照关键字查找商品 */
    List<Commodity> selectByKey(@Param("key")String key, @Param("sortType")Integer sortType, @Param("commodityCoverImageLocation")String commodityCoverImageLocation);
}