package com.timeuni.mybean;

public class SubmitOrderCommodity {
	private String row;
	private Integer quantity;
	private Integer commodityId;
	
	public String getRow() {
		return row;
	}

	@Override
	public String toString() {
		return "SubmitOrderCommodity [row=" + row + ", quantity=" + quantity + "]";
	}

	public void setRow(String row) {
		this.row = row;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(Integer commodityId) {
		this.commodityId = commodityId;
	}
}
