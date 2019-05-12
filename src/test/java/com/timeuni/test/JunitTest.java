package com.timeuni.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

import org.junit.Test;

import com.timeuni.resourcebundle.ResourceLocation;
import com.timeuni.status.CommodityPropertyType;

public class JunitTest {

	@Test
	public void test() {
		String str = new ResourceLocation().getCommodityCoverImageLocation();
		System.out.println(str);
	}
	
	@Test
	public void test1() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MMddHHmmss");
	    String orderNumber = simpleDateFormat.format(new Date());
	    Random random=new Random();
        for(int i = 0; i < 8; i++){
        	orderNumber += random.nextInt(10);
        }
        System.out.println(orderNumber);
	}
	
	@Test
	public void test2() {
		System.out.println(UUID.randomUUID().toString());
	}
	
	@Test
	public void test3() {
		System.out.println(CommodityPropertyType.TEXT.ordinal());
		System.out.println(CommodityPropertyType.IMAGE.ordinal());
		System.out.println(CommodityPropertyType.TEXT_IMAGE.ordinal());
	}
}
