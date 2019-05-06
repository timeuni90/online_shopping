package com.timeuni.bean;

public class OrderCommoditySelectProperty {
    private Integer id;

    private Integer orderDetailId;

    private String propertyName;

    private String propertyValue;

    public Integer getId() {
        return id;
    }

    public OrderCommoditySelectProperty setId(Integer id) {
        this.id = id;
        return this;
    }

    public Integer getOrderDetailId() {
        return orderDetailId;
    }

    public OrderCommoditySelectProperty setOrderDetailId(Integer orderDetailId) {
        this.orderDetailId = orderDetailId;
        return this;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public OrderCommoditySelectProperty setPropertyName(String propertyName) {
        this.propertyName = propertyName == null ? null : propertyName.trim();
        return this;
    }

    public String getPropertyValue() {
        return propertyValue;
    }

    public OrderCommoditySelectProperty setPropertyValue(String propertyValue) {
        this.propertyValue = propertyValue == null ? null : propertyValue.trim();
        return this;
    }
}