package com.timeuni.mybean;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BackStageOrder {
	private Integer id;
	private String orderNumber;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date generateTime;
	private Integer status;
	private String userName;
	private Float totalPrice;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "BackStageOrder [id=" + id + ", orderNumber=" + orderNumber + ", generateTime=" + generateTime
				+ ", status=" + status + ", userName=" + userName + ", totalPrice=" + totalPrice + "]";
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Date getGenerateTime() {
		return generateTime;
	}

	public void setGenerateTime(Date generateTime) {
		this.generateTime = generateTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Float totalPrice) {
		this.totalPrice = totalPrice;
	}
}
