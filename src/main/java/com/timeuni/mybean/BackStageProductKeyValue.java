package com.timeuni.mybean;

import javax.validation.constraints.NotEmpty;

/* 接收前端传来的商品的可选属性信息 */
public class BackStageProductKeyValue {
	@NotEmpty(message = "请输入所有参数名！")
	private String propertyName;
	@NotEmpty(message = "请输入所有参数值！")
	private String propertyValue;
	private Integer type;

	@Override
	public String toString() {
		return "BackStageProductKeyValue [propertyName=" + propertyName + ", propertyValue=" + propertyValue + ", type="
				+ type + "]";
	}

	public String getPropertyName() {
		return propertyName;
	}

	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}

	public String getPropertyValue() {
		return propertyValue;
	}

	public void setPropertyValue(String propertyValue) {
		this.propertyValue = propertyValue;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
}
