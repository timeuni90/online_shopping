package com.timeuni.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.timeuni.bean.Comment;
import com.timeuni.bean.CommentAppend;
import com.timeuni.bean.CommentExample;
import com.timeuni.bean.CommentImage;
import com.timeuni.dao.CommentAppendMapper;
import com.timeuni.dao.CommentImageMapper;
import com.timeuni.dao.CommentMapper;

@Service
public class CommentService {
	@Autowired
	private CommentMapper commentMapper;
	@Autowired
	private CommentAppendMapper commentAppendMapper;
	@Autowired
	private CommentImageMapper commentImageMapper;
	
	/* 添加评论 */
	public Integer addComment(MultipartFile[] images, String commentContent, Comment comment, String realPath) throws IllegalStateException, IOException {
		CommentExample commentExample = new CommentExample();
		commentExample.createCriteria().andOrderIdEqualTo(comment.getOrderId()).andCommodityIdEqualTo(comment.getCommodityId());
		List<Comment> comments = commentMapper.selectByExample(commentExample);
		if(comments.size() < 1) {
			commentMapper.insertSelective(comment);
		} else {
			comment.setId(comments.get(0).getId());
		}
		CommentAppend commentAppend = new CommentAppend();
		commentAppend.setCommentId(comment.getId());
		commentAppend.setComment(commentContent);
		int count = commentAppendMapper.insertSelective(commentAppend);
		if(images != null && images.length > 0) {
			for (MultipartFile image : images) {
				String originalFilename = image.getOriginalFilename();
				String type = originalFilename.substring(originalFilename.lastIndexOf("."));
				String imageName = UUID.randomUUID().toString() + type;
				image.transferTo(new File(realPath + "/" + imageName));
				CommentImage commentImage = new CommentImage();
				commentImage.setCommentAppendId(commentAppend.getId());
				commentImage.setCommentImage(imageName);
				commentImageMapper.insertSelective(commentImage);
			}
		}
		return count;
	}
	
}
