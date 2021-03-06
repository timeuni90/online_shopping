package com.timeuni.dao;

import com.timeuni.bean.Variety;
import com.timeuni.bean.VarietyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface VarietyMapper {
    long countByExample(VarietyExample example);

    int deleteByExample(VarietyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Variety record);

    int insertSelective(Variety record);

    List<Variety> selectByExample(VarietyExample example);

    Variety selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Variety record, @Param("example") VarietyExample example);

    int updateByExample(@Param("record") Variety record, @Param("example") VarietyExample example);

    int updateByPrimaryKeySelective(Variety record);

    int updateByPrimaryKey(Variety record);
    
    /* 根据parentIds查找类别id */
    public List<Integer> selectIdsByParentIds(@Param("parentIds")List<Integer> parentIds);
    
    /* 找出商家的所有分类 */
    public List<Variety> selectBySellerId(Integer sellerId);
}