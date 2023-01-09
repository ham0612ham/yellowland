package com.sp.app.commercial;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "sg_rent_dong_h")
public class Sg_rent_dong_h {
	private String siguNum;
	private String siguName;
	private long dongNum;
	private String dongName;
	
	private long q20221;
	private long q20222;
	private long q20223;
	
	private float longitude;
	private float latitude;
	
	public String getSiguNum() {
		return siguNum;
	}
	public void setSiguNum(String siguNum) {
		this.siguNum = siguNum;
	}
	public String getSiguName() {
		return siguName;
	}
	public void setSiguName(String siguName) {
		this.siguName = siguName;
	}
	public long getDongNum() {
		return dongNum;
	}
	public void setDongNum(long dongNum) {
		this.dongNum = dongNum;
	}
	public String getDongName() {
		return dongName;
	}
	public void setDongName(String dongName) {
		this.dongName = dongName;
	}
	public long getQ20221() {
		return q20221;
	}
	public void setQ20221(long q20221) {
		this.q20221 = q20221;
	}
	public long getQ20222() {
		return q20222;
	}
	public void setQ20222(long q20222) {
		this.q20222 = q20222;
	}
	public long getQ20223() {
		return q20223;
	}
	public void setQ20223(long q20223) {
		this.q20223 = q20223;
	}
	public float getLongitude() {
		return longitude;
	}
	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}
	public float getLatitude() {
		return latitude;
	}
	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}
}
