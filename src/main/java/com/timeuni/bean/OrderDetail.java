package com.timeuni.bean;

public class OrderDetail {
    private Integer id;

    private Integer orderId;

    private Integer commodityId;

    private String commotityName;

    private String commodityCover;

    private Float price;

    private Float promotionPrice;

    private Integer quantity;

    public Integer getId() {
        return id;
    }

    public OrderDetail setId(Integer id) {
        this.id = id;
        return this;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public OrderDetail setOrderId(Integer orderId) {
        this.orderId = orderId;
        return this;
    }

    public Integer getCommodityId() {
        return commodityId;
    }

    public OrderDetail setCommodityId(Integer commodityId) {
        this.commodityId = commodityId;
        return this;
    }

    public String getCommotityName() {
        return commotityName;
    }

    public OrderDetail setCommotityName(String commotityName) {
        this.commotityName = commotityName == null ? null : commotityName.trim();
        return this;
    }

    public String getCommodityCover() {
        return commodityCover;
    }

    public OrderDetail setCommodityCover(String commodityCover) {
        this.commodityCover = commodityCover == null ? null : commodityCover.trim();
        return this;
    }

    public Float getPrice() {
        return price;
    }

    public OrderDetail setPrice(Float price) {
        this.price = price;
        return this;
    }

    public Float getPromotionPrice() {
        return promotionPrice;
    }

    public OrderDetail setPromotionPrice(Float promotionPrice) {
        this.promotionPrice = promotionPrice;
        return this;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public OrderDetail setQuantity(Integer quantity) {
        this.quantity = quantity;
        return this;
    }
}