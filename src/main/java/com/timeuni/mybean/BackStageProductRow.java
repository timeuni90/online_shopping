package com.timeuni.mybean;

import java.util.List;

public class BackStageProductRow {
	private Float price;
	private Integer stock;
	private List<BackStageProductKeyValue> properties;
	
	@Override
	public String toString() {
		return "BackStageProductRow [price=" + price + ", stock=" + stock + ", properties=" + properties + "]";
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public List<BackStageProductKeyValue> getProperties() {
		return properties;
	}

	public void setProperties(List<BackStageProductKeyValue> properties) {
		this.properties = properties;
	}
}
