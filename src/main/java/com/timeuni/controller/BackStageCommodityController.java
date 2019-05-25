package com.timeuni.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.timeuni.mybean.BackstageProduct;
import com.timeuni.mybean.SellerProduct;
import com.timeuni.service.BackStageCommodityService;

@Controller
public class BackStageCommodityController {
	@Autowired
	private BackStageCommodityService backStageCommodityService;

	/* 获得具体商品 */
	@RequestMapping(value = "/backstage/product", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> handleGetProductRequest(Integer productId) {
		return backStageCommodityService.getProduct(productId);
	}

	/* 获得商家所有商品 */
	@RequestMapping(value = "/backstage/products", method = RequestMethod.GET)
	@ResponseBody
	public PageInfo<SellerProduct> HandleGetProductsRequest(HttpSession httpSession,
			@RequestParam(required = false) Integer pageNum) {
		if (pageNum == null) {
			pageNum = 1;
		}
		Integer sellerId = (Integer) httpSession.getAttribute("sellerId");
		return backStageCommodityService.getCommoditiesBySellerId(sellerId, pageNum);
	}

	/* 添加商品 */
	@RequestMapping(value = "/backstage/product", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> handleAddProductRquest(HttpSession httpSession,
			@RequestBody @Valid BackstageProduct product, BindingResult result) {
		return backStageCommodityService.addProduct(product, (Integer)
		httpSession.getAttribute("sellerId"), result);
	}

	/* 添加商品参数的图片 */
	@RequestMapping(value = "/backstage/product_prop_images", method = RequestMethod.POST)
	@ResponseBody
	public String handleAddProductParamsImagesRequest(HttpSession session, MultipartFile[] files, String[] fileNames)
			throws IllegalStateException, IOException {
		String realPath = session.getServletContext().getRealPath("static/images/commodity_select_property");
		for (int i = 0; i < files.length; i++) {
			File image = new File(realPath + "/" + fileNames[i]);
			files[i].transferTo(image);
		}
		return null;
	}

	/* 添加商品图片 */
	@RequestMapping(value = "/backstage/product_images", method = RequestMethod.POST)
	@ResponseBody
	public String handleAddProductImagesRequest(HttpSession session, MultipartFile[] files, Integer commodityId)
			throws IllegalStateException, IOException {
		String realPath = session.getServletContext().getRealPath("static/images/commodity_media_resources");
		String realPath2 = session.getServletContext().getRealPath("static/images/commodity_cover");
		backStageCommodityService.addProductImages(commodityId, realPath, realPath2, files);
		return null;
	}

	/* 批量删除商品 */
	@RequestMapping(value = "/backstage/products", method = RequestMethod.DELETE)
	@ResponseBody
	public Integer handleRemoveProductsRequest(@RequestParam(name = "productIds") List<Integer> productIds) {
		return backStageCommodityService.removeProdutes(productIds);
	}

	/* 商品上架 */
	@RequestMapping(value = "/backstage/shangjia", method = RequestMethod.POST)
	@ResponseBody
	public Integer handleProductsShangjiaRequest(@RequestParam(name = "productIds") List<Integer> productIds) {
		return backStageCommodityService.shangjia(productIds);
	}

	/* 商品上架 */
	@RequestMapping(value = "/backstage/xiajia", method = RequestMethod.POST)
	@ResponseBody
	public Integer handleProductsXiajiaRequest(@RequestParam(name = "productIds") List<Integer> productIds) {
		return backStageCommodityService.xiajia(productIds);
	}
}
