package com.timeuni.bean;

public class Cart {
    private Integer id;

    private Integer userId;

    private String selectPropertyRow;

    private Integer quantity;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getSelectPropertyRow() {
        return selectPropertyRow;
    }

    public void setSelectPropertyRow(String selectPropertyRow) {
        this.selectPropertyRow = selectPropertyRow == null ? null : selectPropertyRow.trim();
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}