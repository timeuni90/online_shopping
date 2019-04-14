package com.timeuni.dao;

import com.timeuni.bean.CollectSeller;
import com.timeuni.bean.CollectSellerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CollectSellerMapper {
    long countByExample(CollectSellerExample example);

    int deleteByExample(CollectSellerExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CollectSeller record);

    int insertSelective(CollectSeller record);

    List<CollectSeller> selectByExample(CollectSellerExample example);

    CollectSeller selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CollectSeller record, @Param("example") CollectSellerExample example);

    int updateByExample(@Param("record") CollectSeller record, @Param("example") CollectSellerExample example);

    int updateByPrimaryKeySelective(CollectSeller record);

    int updateByPrimaryKey(CollectSeller record);
}