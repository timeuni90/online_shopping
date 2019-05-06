package com.timeuni.mybean;

import java.util.List;

public class SubmitOrder {
	private Integer detailAddressId;
	private List<List<SubmitOrderCommodity>> submitOrderCommodityGroups;

	@Override
	public String toString() {
		return "SubmitOrder [detailAddressId=" + detailAddressId + ", SubmitOrderCommodityGroups="
				+ submitOrderCommodityGroups + "]";
	}

	public Integer getDetailAddressId() {
		return detailAddressId;
	}

	public void setDetailAddressId(Integer detailAddressId) {
		this.detailAddressId = detailAddressId;
	}

	public List<List<SubmitOrderCommodity>> getSubmitOrderCommodityGroups() {
		return submitOrderCommodityGroups;
	}

	public void setSubmitOrderCommodityGroups(List<List<SubmitOrderCommodity>> submitOrderCommodityGroups) {
		this.submitOrderCommodityGroups = submitOrderCommodityGroups;
	}
	
}
