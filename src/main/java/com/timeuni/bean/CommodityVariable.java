package com.timeuni.bean;

public class CommodityVariable {
    private Integer id;

    private String selectPropertyRow;

    private Integer stock;

    private Float price;

    private Float promotionPrice;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSelectPropertyRow() {
        return selectPropertyRow;
    }

    public void setSelectPropertyRow(String selectPropertyRow) {
        this.selectPropertyRow = selectPropertyRow == null ? null : selectPropertyRow.trim();
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
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
}