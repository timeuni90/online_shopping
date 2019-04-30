package com.timeuni.bean;

import java.util.List;

public class Comment {
    private Integer id;

    private Integer orderId;

    private Integer commodityId;
    
    private List<CommentAppend> commentAppends;
    
    private List<OrderCommoditySelectProperty> orderCommoditySelectPropertys;
    
    private String userName;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(Integer commodityId) {
        this.commodityId = commodityId;
    }

	public List<CommentAppend> getCommentAppends() {
		return commentAppends;
	}

	public void setCommentAppends(List<CommentAppend> commentAppends) {
		this.commentAppends = commentAppends;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<OrderCommoditySelectProperty> getOrderCommoditySelectPropertys() {
		return orderCommoditySelectPropertys;
	}

	public void setOrderCommoditySelectPropertys(List<OrderCommoditySelectProperty> orderCommoditySelectPropertys) {
		this.orderCommoditySelectPropertys = orderCommoditySelectPropertys;
	}
}