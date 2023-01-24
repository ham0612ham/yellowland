package com.sp.app.matching;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "sg_yongdo")
public class Sg_yongdo {
	private String siguNum;
	private String siguName;
	private long jooguArea;
	private long sangupArea;
	private long nokjiArea;
	
	
	public long getJooguArea() {
		return jooguArea;
	}
	public void setJooguArea(long jooguArea) {
		this.jooguArea = jooguArea;
	}
	public long getSangupArea() {
		return sangupArea;
	}
	public void setSangupArea(long sangupArea) {
		this.sangupArea = sangupArea;
	}
	public long getNokjiArea() {
		return nokjiArea;
	}
	public void setNokjiArea(long nokjiArea) {
		this.nokjiArea = nokjiArea;
	}
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
	public long getTot() {
		// TODO Auto-generated method stub
		return 0;
	}

}
