package com.timeuni.dao;

import com.timeuni.bean.Seller;
import com.timeuni.bean.SellerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SellerMapper {
    long countByExample(SellerExample example);

    int deleteByExample(SellerExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Seller record);

    int insertSelective(Seller record);

    List<Seller> selectByExampleWithBLOBs(SellerExample example);

    List<Seller> selectByExample(SellerExample example);

    Seller selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Seller record, @Param("example") SellerExample example);

    int updateByExampleWithBLOBs(@Param("record") Seller record, @Param("example") SellerExample example);

    int updateByExample(@Param("record") Seller record, @Param("example") SellerExample example);

    int updateByPrimaryKeySelective(Seller record);

    int updateByPrimaryKeyWithBLOBs(Seller record);

    int updateByPrimaryKey(Seller record);
}