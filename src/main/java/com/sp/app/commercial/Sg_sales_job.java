package com.sp.app.commercial;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "sg_sales_job")
public class Sg_sales_job {
	private long yCode;
	private long qCode;
	private String cateJobNum;
	private long tot;
	
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
	public String getCateJobNum() {
		return cateJobNum;
	}
	public void setCateJobNum(String cateJobNum) {
		this.cateJobNum = cateJobNum;
	}
	public long getTot() {
		return tot;
	}
	public void setTot(long tot) {
		this.tot = tot;
	}
}
