package com.timeuni.mybean;

import java.util.List;

/* 用来接收前端传来的产品信息 */
public class BackstageProduct {
	private String name;
	private List<BackStageProductRow> rows;
	
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
	
}
