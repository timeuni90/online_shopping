package com.timeuni.bean;

public class CommentImage {
    private Integer id;

    private Integer commentAppendId;

    private String commentImage;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCommentAppendId() {
        return commentAppendId;
    }

    public void setCommentAppendId(Integer commentAppendId) {
        this.commentAppendId = commentAppendId;
    }

    public String getCommentImage() {
        return commentImage;
    }

    public void setCommentImage(String commentImage) {
        this.commentImage = commentImage == null ? null : commentImage.trim();
    }
}