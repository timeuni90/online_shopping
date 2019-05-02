package com.timeuni.mybean;

public class CartItem {
	private Integer commodityId;
	private String coverImage;
	private String title;
	private String commodityParameter;
	private Float price;
	private Float promotionPrice;
	private Integer quantity;
	private String storeName;
	
	public String getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(String coverImage) {
		this.coverImage = coverImage;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCommodityParameter() {
		return commodityParameter;
	}

	public void setCommodityParameter(String commodityParameter) {
		this.commodityParameter = commodityParameter;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
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

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public Integer getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(Integer commodityId) {
		this.commodityId = commodityId;
	}

}
