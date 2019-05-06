package com.timeuni.bean;

import java.util.Date;

public class Order {
    private Integer id;

    private Integer userId;

    private Integer sellerId;

    private String orderNumber;

    private String userName;

    private String storeName;

    private Date generateTime;

    private Integer status;

    private Boolean isDelete;

    private String receiveAddress;

    public Integer getId() {
        return id;
    }

    public Order setId(Integer id) {
        this.id = id;
        return this;
    }

    public Integer getUserId() {
        return userId;
    }

    public Order setUserId(Integer userId) {
        this.userId = userId;
        return this;
    }

    public Integer getSellerId() {
        return sellerId;
    }

    public Order setSellerId(Integer sellerId) {
        this.sellerId = sellerId;
        return this;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public Order setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber == null ? null : orderNumber.trim();
        return this;
    }

    public String getUserName() {
        return userName;
    }

    public Order setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
        return this;
    }

    public String getStoreName() {
        return storeName;
    }

    public Order setStoreName(String storeName) {
        this.storeName = storeName == null ? null : storeName.trim();
        return this;
    }

    public Date getGenerateTime() {
        return generateTime;
    }

    public Order setGenerateTime(Date generateTime) {
        this.generateTime = generateTime;
        return this;
    }

    public Integer getStatus() {
        return status;
    }

    public Order setStatus(Integer status) {
        this.status = status;
        return this;
    }

    public Boolean getIsDelete() {
        return isDelete;
    }

    public Order setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
        return this;
    }

    public String getReceiveAddress() {
        return receiveAddress;
    }

    public Order setReceiveAddress(String receiveAddress) {
        this.receiveAddress = receiveAddress == null ? null : receiveAddress.trim();
        return this;
    }
}