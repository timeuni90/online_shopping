package com.timeuni.dao;

import com.timeuni.bean.AddressDetail;
import com.timeuni.bean.AddressDetailExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AddressDetailMapper {
    long countByExample(AddressDetailExample example);

    int deleteByExample(AddressDetailExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(AddressDetail record);

    int insertSelective(AddressDetail record);

    List<AddressDetail> selectByExample(AddressDetailExample example);

    AddressDetail selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") AddressDetail record, @Param("example") AddressDetailExample example);

    int updateByExample(@Param("record") AddressDetail record, @Param("example") AddressDetailExample example);

    int updateByPrimaryKeySelective(AddressDetail record);

    int updateByPrimaryKey(AddressDetail record);
}