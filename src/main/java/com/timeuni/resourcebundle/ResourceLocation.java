package com.timeuni.resourcebundle;

import java.util.ResourceBundle;

public class ResourceLocation {
	private ResourceBundle resourceBundle = ResourceBundle.getBundle("resource-loc");
	
	public String getCommodityCoverImageLocation() {
		return resourceBundle.getString("commodity_cover_image");
	}
	
	public String getStoreLogoLocation() {
		return resourceBundle.getString("store_logo");
	}
	
	public String getCommoditySelectPropertyMediaLocation() {
		return resourceBundle.getString("commodity_select_property_media");
	}
	
	public String getCommdotiyMediaResourcesLocation() {
		return resourceBundle.getString("commodity_media_resources");
	}
	
	public String getCommentImagesLocation() {
		return resourceBundle.getString("comment_images");
	}
	
	public String getUserImageLocation() {
		return resourceBundle.getString("user_image");
	}
}
