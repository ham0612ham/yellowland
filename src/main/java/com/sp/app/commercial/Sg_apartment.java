package com.sp.app.commercial;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "sg_apartment")
public class Sg_apartment {
	private long yCode;
	private long qCode;
	private String sgGBCode;
	private String sgGBName;
	private long sgCode;
	private String sgCodeName;
	private long apartCompSu;
	private long apartAreaAve;
	private long apartCostAve;
	private long siguNum;
	private long dongNum;
	public long getyCode() {
		return yCode;
	}
	public void setyCode(long yCode) {
		this.yCode = yCode;
	}
	public long getqCode() {
		return qCode;
	}
	public void setqCode(long qCode) {
		this.qCode = qCode;
	}
	public String getSgGBCode() {
		return sgGBCode;
	}
	public void setSgGBCode(String sgGBCode) {
		this.sgGBCode = sgGBCode;
	}
	public String getSgGBName() {
		return sgGBName;
	}
	public void setSgGBName(String sgGBName) {
		this.sgGBName = sgGBName;
	}
	public long getSgCode() {
		return sgCode;
	}
	public void setSgCode(long sgCode) {
		this.sgCode = sgCode;
	}
	public String getSgCodeName() {
		return sgCodeName;
	}
	public void setSgCodeName(String sgCodeName) {
		this.sgCodeName = sgCodeName;
	}
	public long getApartCompSu() {
		return apartCompSu;
	}
	public void setApartCompSu(long apartCompSu) {
		this.apartCompSu = apartCompSu;
	}
	public long getApartAreaAve() {
		return apartAreaAve;
	}
	public void setApartAreaAve(long apartAreaAve) {
		this.apartAreaAve = apartAreaAve;
	}
	public long getApartCostAve() {
		return apartCostAve;
	}
	public void setApartCostAve(long apartCostAve) {
		this.apartCostAve = apartCostAve;
	}
	public long getSiguNum() {
		return siguNum;
	}
	public void setSiguNum(long siguNum) {
		this.siguNum = siguNum;
	}
	public long getDongNum() {
		return dongNum;
	}
	public void setDongNum(long dongNum) {
		this.dongNum = dongNum;
	}
}
