package com.timeuni.dao;

import com.timeuni.bean.CommentImage;
import com.timeuni.bean.CommentImageExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommentImageMapper {
    long countByExample(CommentImageExample example);

    int deleteByExample(CommentImageExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CommentImage record);

    int insertSelective(CommentImage record);

    List<CommentImage> selectByExample(CommentImageExample example);

    CommentImage selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CommentImage record, @Param("example") CommentImageExample example);

    int updateByExample(@Param("record") CommentImage record, @Param("example") CommentImageExample example);

    int updateByPrimaryKeySelective(CommentImage record);

    int updateByPrimaryKey(CommentImage record);
}