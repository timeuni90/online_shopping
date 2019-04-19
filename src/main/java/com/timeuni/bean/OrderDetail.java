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

    public String getCommotityName() {
        return commotityName;
    }

    public void setCommotityName(String commotityName) {
        this.commotityName = commotityName == null ? null : commotityName.trim();
    }

    public String getCommodityCover() {
        return commodityCover;
    }

    public void setCommodityCover(String commodityCover) {
        this.commodityCover = commodityCover == null ? null : commodityCover.trim();
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getPromotionPrice() {
        return promotionPrice;
    }

    public void setPromotionPrice(Float promotionPrice) {
        this.promotionPrice = promotionPrice;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}