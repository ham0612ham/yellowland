package com.sp.app.commercial;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "sg_store_top10")
public class Sg_store_top10 {
	private long dongNum;
	private String dongName;
	private long chai;
	private float ratio;
	private float longitude;
	private float latitude;
	private String siguNum;
	private String selectMenu1;
	private String selectWork;
	
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
	public long getChai() {
		return chai;
	}
	public void setChai(long chai) {
		this.chai = chai;
	}
	public float getRatio() {
		return ratio;
	}
	public void setRatio(float ratio) {
		this.ratio = ratio;
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
	public String getSiguNum() {
		return siguNum;
	}
	public void setSiguNum(String siguNum) {
		this.siguNum = siguNum;
	}
	public String getSelectMenu1() {
		return selectMenu1;
	}
	public void setSelectMenu1(String selectMenu1) {
		this.selectMenu1 = selectMenu1;
	}
	public String getSelectWork() {
		return selectWork;
	}
	public void setSelectWork(String selectWork) {
		this.selectWork = selectWork;
	}
}
