package com.timeuni.bean;

public class CommoditySelectProperty {
    private Integer id;

    private Integer commodityId;

    private String selectPropertyRow;

    private Integer mediaType;

    private String propertyName;

    private String propertyValue;
    
    private String rows;

    @Override
	public String toString() {
		return "CommoditySelectProperty [id=" + id + ", commodityId=" + commodityId + ", selectPropertyRow="
				+ selectPropertyRow + ", mediaType=" + mediaType + ", propertyName=" + propertyName + ", propertyValue="
				+ propertyValue + ", rows=" + rows + "]";
	}

	public Integer getId() {
        return id;
    }

	public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(Integer commodityId) {
        this.commodityId = commodityId;
    }

    public String getSelectPropertyRow() {
        return selectPropertyRow;
    }

    public void setSelectPropertyRow(String selectPropertyRow) {
        this.selectPropertyRow = selectPropertyRow == null ? null : selectPropertyRow.trim();
    }

    public Integer getMediaType() {
        return mediaType;
    }

    public void setMediaType(Integer mediaType) {
        this.mediaType = mediaType;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName == null ? null : propertyName.trim();
    }

    public String getPropertyValue() {
        return propertyValue;
    }

    public void setPropertyValue(String propertyValue) {
        this.propertyValue = propertyValue == null ? null : propertyValue.trim();
    }

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}
}