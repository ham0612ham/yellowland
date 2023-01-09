package com.sp.app.prop;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.util.Properties;

public class PropReader {
	
	public String readDaumKey() {
		String key = null;
		try {
			String propFile = this.getClass().getResource("keyList.properties").getPath();
			Properties props = new Properties();
			FileInputStream fis = new FileInputStream(propFile);
			props.load(new BufferedInputStream(fis));
			
			key = props.getProperty("daumKey");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return key;
	} 
	
	public String readNaverEmail() {
		String key = null;
		try {
			String propFile = this.getClass().getResource("keyList.properties").getPath();
			Properties props = new Properties();
			FileInputStream fis = new FileInputStream(propFile);
			props.load(new BufferedInputStream(fis));
			
			key = props.getProperty("naverEmail");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return key;
	}
	
	public String readNaverId() {
		String key = null;
		try {
			String propFile = this.getClass().getResource("keyList.properties").getPath();
			Properties props = new Properties();
			FileInputStream fis = new FileInputStream(propFile);
			props.load(new BufferedInputStream(fis));
			
			key = props.getProperty("naverId");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return key;
	}
	
	public String readnaverPwd() {
		String key = null;
		try {
			String propFile = this.getClass().getResource("keyList.properties").getPath();
			Properties props = new Properties();
			FileInputStream fis = new FileInputStream(propFile);
			props.load(new BufferedInputStream(fis));
			
			key = props.getProperty("naverPwd");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return key;
	}
}
