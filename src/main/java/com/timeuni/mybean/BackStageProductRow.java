package com.timeuni.mybean;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

public class BackStageProductRow {
	private String rowId;
	@NotNull(message = "请输入价格")
	private Float price;
	@NotNull(message = "请输入库存")
	private Integer stock;
	@Valid
	private List<BackStageProductKeyValue> properties;
	
	@Override
	public String toString() {
		return "BackStageProductRow [rowId=" + rowId + ", price=" + price + ", stock=" + stock + ", properties="
				+ properties + "]";
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

	public String getRowId() {
		return rowId;
	}

	public void setRowId(String rowId) {
		this.rowId = rowId;
	}
}
