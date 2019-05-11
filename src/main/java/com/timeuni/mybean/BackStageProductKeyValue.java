package com.timeuni.mybean;

/* 接收前端传来的商品的可选属性信息 */
public class BackStageProductKeyValue {
	private String propertyName;
	private String propertyValue;

	@Override
	public String toString() {
		return "BackStageProductKeyValue [propertyName=" + propertyName + ", propertyValue=" + propertyValue + "]";
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
}
