package com.timeuni.mybean;

import java.util.List;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/* 用来接收前端传来的产品信息 */
public class BackstageProduct {
	@NotEmpty(message = "请输入商品标题！")
	private String name;
	private List<BackStageProductRow> rows;
	@NotNull(message = "请选择类别！")
	private Integer varietyId;
	
	@Override
	public String toString() {
		return "BackstageProduct [name=" + name + ", rows=" + rows + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<BackStageProductRow> getRows() {
		return rows;
	}

	public void setRows(List<BackStageProductRow> rows) {
		this.rows = rows;
	}

	public Integer getVarietyId() {
		return varietyId;
	}

	public void setVarietyId(Integer varietyId) {
		this.varietyId = varietyId;
	}
	
}
