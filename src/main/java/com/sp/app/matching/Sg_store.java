package com.sp.app.matching;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "sg_store")
public class Sg_store {
	private String yCode;
	private String qCode;
	private String sgGBCode;
	private String sgGBName;
	private String sgCode;
	private String sgCodeName;
	private String wCode;
	private String wName;
	private long storeSu;
	private long uStoreSu;
	private long openPer;
	private long openCount;
	private long closePer;
	private long closeSu;
	private long franSu;
	private String siguNum;
	private String dongNum;
	private long tot;
	private String cateJobNum;
	
	public String getyCode() {
		return yCode;
	}
	public void setyCode(String yCode) {
		this.yCode = yCode;
	}
	public String getqCode() {
		return qCode;
	}
	public void setqCode(String qCode) {
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
	public String getSgCode() {
		return sgCode;
	}
	public void setSgCode(String sgCode) {
		this.sgCode = sgCode;
	}
	public String getSgCodeName() {
		return sgCodeName;
	}
	public void setSgCodeName(String sgCodeName) {
		this.sgCodeName = sgCodeName;
	}
	public String getwCode() {
		return wCode;
	}
	public void setwCode(String wCode) {
		this.wCode = wCode;
	}
	public String getwName() {
		return wName;
	}
	public void setwName(String wName) {
		this.wName = wName;
	}
	public long getStoreSu() {
		return storeSu;
	}
	public void setStoreSu(long storeSu) {
		this.storeSu = storeSu;
	}
	public long getuStoreSu() {
		return uStoreSu;
	}
	public void setuStoreSu(long uStoreSu) {
		this.uStoreSu = uStoreSu;
	}
	public long getOpenPer() {
		return openPer;
	}
	public void setOpenPer(long openPer) {
		this.openPer = openPer;
	}
	public long getOpenCount() {
		return openCount;
	}
	public void setOpenCount(long openCount) {
		this.openCount = openCount;
	}
	public long getClosePer() {
		return closePer;
	}
	public void setClosePer(long closePer) {
		this.closePer = closePer;
	}
	public long getCloseSu() {
		return closeSu;
	}
	public void setCloseSu(long closeSu) {
		this.closeSu = closeSu;
	}
	public long getFranSu() {
		return franSu;
	}
	public void setFranSu(long franSu) {
		this.franSu = franSu;
	}
	public String getSiguNum() {
		return siguNum;
	}
	public void setSiguNum(String siguNum) {
		this.siguNum = siguNum;
	}
	public String getDongNum() {
		return dongNum;
	}
	public void setDongNum(String dongNum) {
		this.dongNum = dongNum;
	}
	public long getTot() {
		return tot;
	}
	public void setTot(long tot) {
		this.tot = tot;
	}
	public String getCateJobNum() {
		return cateJobNum;
	}
	public void setCateJobNum(String cateJobNum) {
		this.cateJobNum = cateJobNum;
	}
}
