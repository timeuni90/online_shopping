package com.timeuni.bean;

import java.util.List;

public class Commodity {
    private Integer id;

    private Integer sellerId;

    private String title;

    private String subtitle;

    private Integer status;

    private Boolean isDelete;

    private String coverImage;

    private String detail;
    
    private Seller seller;
    
    private Float minPrice;
    
    private Float maxPrice;
    
    private Float minPromotionPrice;
    
    private Float maxPromotionPrice;
    
    private Integer monthSale;
    
    private Integer commentQuantity;
    
    private List<CommoditySelectProperty> commoditySelectProperties;
    
    private List<CommodityVariable> commodityVariables;
    
    private List<CommodityExtendProperty> commodityExtendProperties;
    
    private List<CommodityMediaResource> commodityMediaResources;
    
    private Integer stock;
    
    private Long collectQuantity;
    
    @Override
	public String toString() {
		return "Commodity [id=" + id + ", sellerId=" + sellerId + ", title=" + title + ", subtitle=" + subtitle
				+ ", status=" + status + ", isDelete=" + isDelete + ", coverImage=" + coverImage + ", detail=" + detail
				+ ", seller=" + seller + ", minPrice=" + minPrice + ", monthSale=" + monthSale + ", commentQuantity="
				+ commentQuantity + ", commoditySelectProperties=" + commoditySelectProperties + ", commodityVariables="
				+ commodityVariables + ", commodityExtendProperties=" + commodityExtendProperties + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSellerId() {
        return sellerId;
    }

    public void setSellerId(Integer sellerId) {
        this.sellerId = sellerId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle == null ? null : subtitle.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }

    public String getCoverImage() {
        return coverImage;
    }

    public void setCoverImage(String coverImage) {
        this.coverImage = coverImage == null ? null : coverImage.trim();
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }

	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}

	public Float getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(Float minPrice) {
		this.minPrice = minPrice;
	}

	public Integer getMonthSale() {
		return monthSale;
	}

	public void setMonthSale(Integer monthSale) {
		this.monthSale = monthSale;
	}

	public Integer getCommentQuantity() {
		return commentQuantity;
	}

	public void setCommentQuantity(Integer commentQuantity) {
		this.commentQuantity = commentQuantity;
	}

	public List<CommodityVariable> getCommodityVariables() {
		return commodityVariables;
	}

	public void setCommodityVariables(List<CommodityVariable> commodityVariables) {
		this.commodityVariables = commodityVariables;
	}

	public List<CommodityExtendProperty> getCommodityExtendProperties() {
		return commodityExtendProperties;
	}

	public void setCommodityExtendProperties(List<CommodityExtendProperty> commodityExtendProperties) {
		this.commodityExtendProperties = commodityExtendProperties;
	}

	public List<CommoditySelectProperty> getCommoditySelectProperties() {
		return commoditySelectProperties;
	}

	public void setCommoditySelectProperties(List<CommoditySelectProperty> commoditySelectProperties) {
		this.commoditySelectProperties = commoditySelectProperties;
	}

	public Float getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(Float maxPrice) {
		this.maxPrice = maxPrice;
	}

	public Float getMinPromotionPrice() {
		return minPromotionPrice;
	}

	public void setMinPromotionPrice(Float minPromotionPrice) {
		this.minPromotionPrice = minPromotionPrice;
	}

	public Float getMaxPromotionPrice() {
		return maxPromotionPrice;
	}

	public void setMaxPromotionPrice(Float maxPromotionPrice) {
		this.maxPromotionPrice = maxPromotionPrice;
	}

	public List<CommodityMediaResource> getCommodityMediaResources() {
		return commodityMediaResources;
	}

	public void setCommodityMediaResources(List<CommodityMediaResource> commodityMediaResources) {
		this.commodityMediaResources = commodityMediaResources;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public Long getCollectQuantity() {
		return collectQuantity;
	}

	public void setCollectQuantity(Long collectQuantity) {
		this.collectQuantity = collectQuantity;
	}
}