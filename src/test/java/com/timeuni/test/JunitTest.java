package com.timeuni.test;

import java.security.MessageDigest;
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
	
	@Test
	public void test4() {
		String key = "root";
		 char hexDigits[] = {
	                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'
	        };
	        try {
	            byte[] btInput = key.getBytes();
	            // 获得MD5摘要算法的 MessageDigest 对象
	            MessageDigest mdInst = MessageDigest.getInstance("MD5");
	            // 使用指定的字节更新摘要
	            mdInst.update(btInput);
	            // 获得密文
	            byte[] md = mdInst.digest();
	            // 把密文转换成十六进制的字符串形式
	            int j = md.length;
	            char str[] = new char[j * 2];
	            int k = 0;
	            for (int i = 0; i < j; i++) {
	                byte byte0 = md[i];
	                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
	                str[k++] = hexDigits[byte0 & 0xf];
	            }
	            System.out.println(new String(str));
	        } catch (Exception e) {
	            
	        }
	}

}
