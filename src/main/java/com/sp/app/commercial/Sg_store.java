package com.sp.app.commercial;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "sg_store")
public class Sg_store {
	private long yCode;
	private long qCode;
	private String sgGBCode;
	private String sgGBName;
	private long sgCode;
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
