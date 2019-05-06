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
	private String row;
	
	public String getCoverImage() {
		return coverImage;
	}

	public CartItem setCoverImage(String coverImage) {
		this.coverImage = coverImage;
		return this;
	}

	public String getTitle() {
		return title;
	}

	public CartItem setTitle(String title) {
		this.title = title;
		return this;
	}

	public String getCommodityParameter() {
		return commodityParameter;
	}

	public CartItem setCommodityParameter(String commodityParameter) {
		this.commodityParameter = commodityParameter;
		return this;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public CartItem setQuantity(Integer quantity) {
		this.quantity = quantity;
		return this;
	}

	public Float getPrice() {
		return price;
	}

	public CartItem setPrice(Float price) {
		this.price = price;
		return this;
	}

	public Float getPromotionPrice() {
		return promotionPrice;
	}

	public CartItem setPromotionPrice(Float promotionPrice) {
		this.promotionPrice = promotionPrice;
		return this;
	}

	public String getStoreName() {
		return storeName;
	}

	public CartItem setStoreName(String storeName) {
		this.storeName = storeName;
		return this;
	}

	public Integer getCommodityId() {
		return commodityId;
	}

	public CartItem setCommodityId(Integer commodityId) {
		this.commodityId = commodityId;
		return this;
	}

	public String getRow() {
		return row;
	}

	public CartItem setRow(String row) {
		this.row = row;
		return this;
	}

}
