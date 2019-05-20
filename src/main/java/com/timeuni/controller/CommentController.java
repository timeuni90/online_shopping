package com.timeuni.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.timeuni.bean.Comment;
import com.timeuni.bean.CommentAppend;
import com.timeuni.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	/* 添加评论 */
	@RequestMapping(value = "/comment", method = RequestMethod.POST)
	@ResponseBody
	public Integer handleAddCommentRequest(MultipartFile[] images, String commentContent, Integer orderId,
			Integer commodityId, HttpSession session) throws IllegalStateException, IOException {
		Comment comment = new Comment();
		comment.setOrderId(orderId);
		comment.setCommodityId(commodityId);
		String realPath = session.getServletContext().getRealPath("static/images/comment_images");
		return commentService.addComment(images, commentContent, comment, realPath);
	}
	
	/* 获取评论 */
	@RequestMapping(value = "/comments", method = RequestMethod.GET)
	@ResponseBody
	public List<CommentAppend> handleCommentsRequest(Comment comment) {
		return commentService.getComments(comment);
	}
	
}
