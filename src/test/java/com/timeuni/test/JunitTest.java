package com.timeuni.test;

import org.junit.Test;

import com.timeuni.resourcebundle.ResourceLocation;

public class JunitTest {

	@Test
	public void test() {
		String str = new ResourceLocation().getCommodityCoverImageLocation();
		System.out.println(str);
	}

}
