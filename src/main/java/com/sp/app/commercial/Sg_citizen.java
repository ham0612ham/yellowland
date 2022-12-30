package com.sp.app.commercial;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "sg_citizen")
public class Sg_citizen {
	private long yCode;
	private long qCode;
	private String sgGBCode;
	private String sgGBName;
	private String sgCode;
	private long citizenSu;
	private long maleCitizenSu;
	private long femaleCitizenSu;
	private String sgCodeName;
	private String siguNum;
	private long dongNum;
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
	public long getCitizenSu() {
		return citizenSu;
	}
	public void setCitizenSu(long citizenSu) {
		this.citizenSu = citizenSu;
	}
	public long getMaleCitizenSu() {
		return maleCitizenSu;
	}
	public void setMaleCitizenSu(long maleCitizenSu) {
		this.maleCitizenSu = maleCitizenSu;
	}
	public long getFemaleCitizenSu() {
		return femaleCitizenSu;
	}
	public void setFemaleCitizenSu(long femaleCitizenSu) {
		this.femaleCitizenSu = femaleCitizenSu;
	}
	public String getSgCodeName() {
		return sgCodeName;
	}
	public void setSgCodeName(String sgCodeName) {
		this.sgCodeName = sgCodeName;
	}
	public String getSiguNum() {
		return siguNum;
	}
	public void setSiguNum(String siguNum) {
		this.siguNum = siguNum;
	}
	public long getDongNum() {
		return dongNum;
	}
	public void setDongNum(long dongNum) {
		this.dongNum = dongNum;
	}
	public long getTot() {
		return tot;
	}
	public void setTot(long tot) {
		this.tot = tot;
	}
}
