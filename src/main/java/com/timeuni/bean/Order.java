package com.timeuni.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Order {
    private Integer id;

    private Integer userId;

    private Integer sellerId;

    private String orderNumber;

    private String userName;

    private String storeName;
    
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date generateTime;

    private Integer status;

    private String receiveAddress;

    private String groupId;

    private Boolean userIsDelete;

    private Boolean sellerIsDelete;

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

    public String getReceiveAddress() {
        return receiveAddress;
    }

    public Order setReceiveAddress(String receiveAddress) {
        this.receiveAddress = receiveAddress == null ? null : receiveAddress.trim();
        return this;
    }

    public String getGroupId() {
        return groupId;
    }

    public Order setGroupId(String groupId) {
        this.groupId = groupId == null ? null : groupId.trim();
        return this;
    }

    public Boolean getUserIsDelete() {
        return userIsDelete;
    }

    public Order setUserIsDelete(Boolean userIsDelete) {
        this.userIsDelete = userIsDelete;
        return this;
    }

    public Boolean getSellerIsDelete() {
        return sellerIsDelete;
    }

    public Order setSellerIsDelete(Boolean sellerIsDelete) {
        this.sellerIsDelete = sellerIsDelete;
        return this;
    }
}