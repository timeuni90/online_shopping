package com.timeuni.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.junit.Test;

import com.timeuni.resourcebundle.ResourceLocation;

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
}
