package com.timeuni.dao;

import com.timeuni.bean.CommentAppend;
import com.timeuni.bean.CommentAppendExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommentAppendMapper {
    long countByExample(CommentAppendExample example);

    int deleteByExample(CommentAppendExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CommentAppend record);

    int insertSelective(CommentAppend record);

    List<CommentAppend> selectByExample(CommentAppendExample example);

    CommentAppend selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CommentAppend record, @Param("example") CommentAppendExample example);

    int updateByExample(@Param("record") CommentAppend record, @Param("example") CommentAppendExample example);

    int updateByPrimaryKeySelective(CommentAppend record);

    int updateByPrimaryKey(CommentAppend record);
}