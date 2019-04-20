package com.timeuni.resourcebundle;

import java.util.ResourceBundle;

public class ResourceLocation {
	private ResourceBundle resourceBundle;
	
	public ResourceLocation() {
		this.resourceBundle = ResourceBundle.getBundle("resource-loc");
	}
	
	public String getCommodityCoverImageLocation() {
		return resourceBundle.getString("commodity_cover_image");
	}
	
}
