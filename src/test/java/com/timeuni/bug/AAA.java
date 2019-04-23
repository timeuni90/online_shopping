package com.timeuni.bug;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AAA {

	public static void main(String[] args) throws IOException {
		String str = "https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w14221003-15189512952.6.202b73f2GMsYht&id=574189749365&scene=taobao_shop&sku_properties=10004:827902415;5919063:6536025";
		URL url = new URL(str);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		InputStream inputStream = con.getInputStream();
		InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "gbk");
		BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
		String line = null;
		StringBuilder stringBuilder = new StringBuilder();
		while ((line = bufferedReader.readLine()) != null) {
			stringBuilder.append(line);
			System.out.println(line);
		}
		/* title */
		Pattern pattern = Pattern.compile("<a target=\"_blank\" href=\"//detail.tmall.com/item.htm\\?id=[^<]*</a>");
		Matcher matcher = pattern.matcher(stringBuilder);
		matcher.find();
		String str3 = matcher.group();
		System.out.println(str3);
		String str4 = str3.replaceAll("(<a [^>]*>)|(</a>)", "");
		System.out.println(str4);
		
		
	}

}
