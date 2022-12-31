package com.sp.app.commercial;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "sg_sales")
public class Sg_sales {
	private long yCode;
	private long qCode;
	private String sgGBCode;
	private String sgGBName;
	private String sgCode;
	private String sgCodeName;
	
	private String wCode;
	private String wName;
	private long salesCost_quarter;
	private long salesSu_quarter;
	private double salesPer_weekdays;
	private double salesPer_weekend;
	private double salesPer_Mon;
	private double salesPer_Tue;
	private double salesPer_Wed;
	private double salesPer_Thu;
	private double salesPer_Fri;
	private double salesPer_Sat;
	private double salesPer_Sun;
	private double salesPer_0006;
	private double salesPer_0611;
	private double salesPer_1114;
	private double salesPer_1417;
	private double salesPer_1721;
	private double salesPer_2124;
	private double salesPer_male;
	private double salesPer_female;
	private double salesPer_10;
	private double salesPer_20;
	private double salesPer_30;
	private double salesPer_40;
	private double salesPer_50;
	private double salesPer_60;
	private long salesCost_weekdays;
	private long salesCost_weekend;
	private long salesCost_Mon;
	private long salesCost_Tue;
	private long salesCost_Wed;
	private long salesCost_Thu;
	private long salesCost_Fri;
	private long salesCost_Sat;
	private long salesCost_Sun;
	private long salesCost_0006;
	private long salesCost_0611;
	private long salesCost_1114;
	private long salesCost_1417;
	private long salesCost_1721;
	private long salesCost_2124;
	private long salesCost_male;
	private long salesCost_female;
	private long salesCost_10;
	private long salesCost_20;
	private long salesCost_30;
	private long salesCost_40;
	private long salesCost_50;
	private long salesCost_60;
	private long salesSu_weekdays;
	private long salesSu_weekend;
	private long salesSu_Mon;
	private long salesSu_Tue;
	private long salesSu_Wed;
	private long salesSu_Thu;
	private long salesSu_Fri;
	private long salesSu_Sat;
	private long salesSu_Sun;
	private long salesSu_0006;
	private long salesSu_0611;
	private long salesSu_1114;
	private long salesSu_1417;
	private long salesSu_1721;
	private long salesSu_2124;
	private long salesSu_male;
	private long salesSu_female;
	private long salesSu_10;
	private long salesSu_20;
	private long salesSu_30;
	private long salesSu_40;
	private long salesSu_50;
	private long salesSu_60;
	private long storeSu;
	
	private String siguNum;
	private long dongNum;
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
	public long getSalesCost_quarter() {
		return salesCost_quarter;
	}
	public void setSalesCost_quarter(long salesCost_quarter) {
		this.salesCost_quarter = salesCost_quarter;
	}
	public long getSalesSu_quarter() {
		return salesSu_quarter;
	}
	public void setSalesSu_quarter(long salesSu_quarter) {
		this.salesSu_quarter = salesSu_quarter;
	}
	public double getSalesPer_weekdays() {
		return salesPer_weekdays;
	}
	public void setSalesPer_weekdays(double salesPer_weekdays) {
		this.salesPer_weekdays = salesPer_weekdays;
	}
	public double getSalesPer_weekend() {
		return salesPer_weekend;
	}
	public void setSalesPer_weekend(double salesPer_weekend) {
		this.salesPer_weekend = salesPer_weekend;
	}
	public double getSalesPer_Mon() {
		return salesPer_Mon;
	}
	public void setSalesPer_Mon(double salesPer_Mon) {
		this.salesPer_Mon = salesPer_Mon;
	}
	public double getSalesPer_Tue() {
		return salesPer_Tue;
	}
	public void setSalesPer_Tue(double salesPer_Tue) {
		this.salesPer_Tue = salesPer_Tue;
	}
	public double getSalesPer_Wed() {
		return salesPer_Wed;
	}
	public void setSalesPer_Wed(double salesPer_Wed) {
		this.salesPer_Wed = salesPer_Wed;
	}
	public double getSalesPer_Thu() {
		return salesPer_Thu;
	}
	public void setSalesPer_Thu(double salesPer_Thu) {
		this.salesPer_Thu = salesPer_Thu;
	}
	public double getSalesPer_Fri() {
		return salesPer_Fri;
	}
	public void setSalesPer_Fri(double salesPer_Fri) {
		this.salesPer_Fri = salesPer_Fri;
	}
	public double getSalesPer_Sat() {
		return salesPer_Sat;
	}
	public void setSalesPer_Sat(double salesPer_Sat) {
		this.salesPer_Sat = salesPer_Sat;
	}
	public double getSalesPer_Sun() {
		return salesPer_Sun;
	}
	public void setSalesPer_Sun(double salesPer_Sun) {
		this.salesPer_Sun = salesPer_Sun;
	}
	public double getSalesPer_0006() {
		return salesPer_0006;
	}
	public void setSalesPer_0006(double salesPer_0006) {
		this.salesPer_0006 = salesPer_0006;
	}
	public double getSalesPer_0611() {
		return salesPer_0611;
	}
	public void setSalesPer_0611(double salesPer_0611) {
		this.salesPer_0611 = salesPer_0611;
	}
	public double getSalesPer_1114() {
		return salesPer_1114;
	}
	public void setSalesPer_1114(double salesPer_1114) {
		this.salesPer_1114 = salesPer_1114;
	}
	public double getSalesPer_1417() {
		return salesPer_1417;
	}
	public void setSalesPer_1417(double salesPer_1417) {
		this.salesPer_1417 = salesPer_1417;
	}
	public double getSalesPer_1721() {
		return salesPer_1721;
	}
	public void setSalesPer_1721(double salesPer_1721) {
		this.salesPer_1721 = salesPer_1721;
	}
	public double getSalesPer_2124() {
		return salesPer_2124;
	}
	public void setSalesPer_2124(double salesPer_2124) {
		this.salesPer_2124 = salesPer_2124;
	}
	public double getSalesPer_male() {
		return salesPer_male;
	}
	public void setSalesPer_male(double salesPer_male) {
		this.salesPer_male = salesPer_male;
	}
	public double getSalesPer_female() {
		return salesPer_female;
	}
	public void setSalesPer_female(double salesPer_female) {
		this.salesPer_female = salesPer_female;
	}
	public double getSalesPer_10() {
		return salesPer_10;
	}
	public void setSalesPer_10(double salesPer_10) {
		this.salesPer_10 = salesPer_10;
	}
	public double getSalesPer_20() {
		return salesPer_20;
	}
	public void setSalesPer_20(double salesPer_20) {
		this.salesPer_20 = salesPer_20;
	}
	public double getSalesPer_30() {
		return salesPer_30;
	}
	public void setSalesPer_30(double salesPer_30) {
		this.salesPer_30 = salesPer_30;
	}
	public double getSalesPer_40() {
		return salesPer_40;
	}
	public void setSalesPer_40(double salesPer_40) {
		this.salesPer_40 = salesPer_40;
	}
	public double getSalesPer_50() {
		return salesPer_50;
	}
	public void setSalesPer_50(double salesPer_50) {
		this.salesPer_50 = salesPer_50;
	}
	public double getSalesPer_60() {
		return salesPer_60;
	}
	public void setSalesPer_60(double salesPer_60) {
		this.salesPer_60 = salesPer_60;
	}
	public long getSalesCost_weekdays() {
		return salesCost_weekdays;
	}
	public void setSalesCost_weekdays(long salesCost_weekdays) {
		this.salesCost_weekdays = salesCost_weekdays;
	}
	public long getSalesCost_weekend() {
		return salesCost_weekend;
	}
	public void setSalesCost_weekend(long salesCost_weekend) {
		this.salesCost_weekend = salesCost_weekend;
	}
	public long getSalesCost_Mon() {
		return salesCost_Mon;
	}
	public void setSalesCost_Mon(long salesCost_Mon) {
		this.salesCost_Mon = salesCost_Mon;
	}
	public long getSalesCost_Tue() {
		return salesCost_Tue;
	}
	public void setSalesCost_Tue(long salesCost_Tue) {
		this.salesCost_Tue = salesCost_Tue;
	}
	public long getSalesCost_Wed() {
		return salesCost_Wed;
	}
	public void setSalesCost_Wed(long salesCost_Wed) {
		this.salesCost_Wed = salesCost_Wed;
	}
	public long getSalesCost_Thu() {
		return salesCost_Thu;
	}
	public void setSalesCost_Thu(long salesCost_Thu) {
		this.salesCost_Thu = salesCost_Thu;
	}
	public long getSalesCost_Fri() {
		return salesCost_Fri;
	}
	public void setSalesCost_Fri(long salesCost_Fri) {
		this.salesCost_Fri = salesCost_Fri;
	}
	public long getSalesCost_Sat() {
		return salesCost_Sat;
	}
	public void setSalesCost_Sat(long salesCost_Sat) {
		this.salesCost_Sat = salesCost_Sat;
	}
	public long getSalesCost_Sun() {
		return salesCost_Sun;
	}
	public void setSalesCost_Sun(long salesCost_Sun) {
		this.salesCost_Sun = salesCost_Sun;
	}
	public long getSalesCost_0006() {
		return salesCost_0006;
	}
	public void setSalesCost_0006(long salesCost_0006) {
		this.salesCost_0006 = salesCost_0006;
	}
	public long getSalesCost_0611() {
		return salesCost_0611;
	}
	public void setSalesCost_0611(long salesCost_0611) {
		this.salesCost_0611 = salesCost_0611;
	}
	public long getSalesCost_1114() {
		return salesCost_1114;
	}
	public void setSalesCost_1114(long salesCost_1114) {
		this.salesCost_1114 = salesCost_1114;
	}
	public long getSalesCost_1417() {
		return salesCost_1417;
	}
	public void setSalesCost_1417(long salesCost_1417) {
		this.salesCost_1417 = salesCost_1417;
	}
	public long getSalesCost_1721() {
		return salesCost_1721;
	}
	public void setSalesCost_1721(long salesCost_1721) {
		this.salesCost_1721 = salesCost_1721;
	}
	public long getSalesCost_2124() {
		return salesCost_2124;
	}
	public void setSalesCost_2124(long salesCost_2124) {
		this.salesCost_2124 = salesCost_2124;
	}
	public long getSalesCost_male() {
		return salesCost_male;
	}
	public void setSalesCost_male(long salesCost_male) {
		this.salesCost_male = salesCost_male;
	}
	public long getSalesCost_female() {
		return salesCost_female;
	}
	public void setSalesCost_female(long salesCost_female) {
		this.salesCost_female = salesCost_female;
	}
	public long getSalesCost_10() {
		return salesCost_10;
	}
	public void setSalesCost_10(long salesCost_10) {
		this.salesCost_10 = salesCost_10;
	}
	public long getSalesCost_20() {
		return salesCost_20;
	}
	public void setSalesCost_20(long salesCost_20) {
		this.salesCost_20 = salesCost_20;
	}
	public long getSalesCost_30() {
		return salesCost_30;
	}
	public void setSalesCost_30(long salesCost_30) {
		this.salesCost_30 = salesCost_30;
	}
	public long getSalesCost_40() {
		return salesCost_40;
	}
	public void setSalesCost_40(long salesCost_40) {
		this.salesCost_40 = salesCost_40;
	}
	public long getSalesCost_50() {
		return salesCost_50;
	}
	public void setSalesCost_50(long salesCost_50) {
		this.salesCost_50 = salesCost_50;
	}
	public long getSalesCost_60() {
		return salesCost_60;
	}
	public void setSalesCost_60(long salesCost_60) {
		this.salesCost_60 = salesCost_60;
	}
	public long getSalesSu_weekdays() {
		return salesSu_weekdays;
	}
	public void setSalesSu_weekdays(long salesSu_weekdays) {
		this.salesSu_weekdays = salesSu_weekdays;
	}
	public long getSalesSu_weekend() {
		return salesSu_weekend;
	}
	public void setSalesSu_weekend(long salesSu_weekend) {
		this.salesSu_weekend = salesSu_weekend;
	}
	public long getSalesSu_Mon() {
		return salesSu_Mon;
	}
	public void setSalesSu_Mon(long salesSu_Mon) {
		this.salesSu_Mon = salesSu_Mon;
	}
	public long getSalesSu_Tue() {
		return salesSu_Tue;
	}
	public void setSalesSu_Tue(long salesSu_Tue) {
		this.salesSu_Tue = salesSu_Tue;
	}
	public long getSalesSu_Wed() {
		return salesSu_Wed;
	}
	public void setSalesSu_Wed(long salesSu_Wed) {
		this.salesSu_Wed = salesSu_Wed;
	}
	public long getSalesSu_Thu() {
		return salesSu_Thu;
	}
	public void setSalesSu_Thu(long salesSu_Thu) {
		this.salesSu_Thu = salesSu_Thu;
	}
	public long getSalesSu_Fri() {
		return salesSu_Fri;
	}
	public void setSalesSu_Fri(long salesSu_Fri) {
		this.salesSu_Fri = salesSu_Fri;
	}
	public long getSalesSu_Sat() {
		return salesSu_Sat;
	}
	public void setSalesSu_Sat(long salesSu_Sat) {
		this.salesSu_Sat = salesSu_Sat;
	}
	public long getSalesSu_Sun() {
		return salesSu_Sun;
	}
	public void setSalesSu_Sun(long salesSu_Sun) {
		this.salesSu_Sun = salesSu_Sun;
	}
	public long getSalesSu_0006() {
		return salesSu_0006;
	}
	public void setSalesSu_0006(long salesSu_0006) {
		this.salesSu_0006 = salesSu_0006;
	}
	public long getSalesSu_0611() {
		return salesSu_0611;
	}
	public void setSalesSu_0611(long salesSu_0611) {
		this.salesSu_0611 = salesSu_0611;
	}
	public long getSalesSu_1114() {
		return salesSu_1114;
	}
	public void setSalesSu_1114(long salesSu_1114) {
		this.salesSu_1114 = salesSu_1114;
	}
	public long getSalesSu_1417() {
		return salesSu_1417;
	}
	public void setSalesSu_1417(long salesSu_1417) {
		this.salesSu_1417 = salesSu_1417;
	}
	public long getSalesSu_1721() {
		return salesSu_1721;
	}
	public void setSalesSu_1721(long salesSu_1721) {
		this.salesSu_1721 = salesSu_1721;
	}
	public long getSalesSu_2124() {
		return salesSu_2124;
	}
	public void setSalesSu_2124(long salesSu_2124) {
		this.salesSu_2124 = salesSu_2124;
	}
	public long getSalesSu_male() {
		return salesSu_male;
	}
	public void setSalesSu_male(long salesSu_male) {
		this.salesSu_male = salesSu_male;
	}
	public long getSalesSu_female() {
		return salesSu_female;
	}
	public void setSalesSu_female(long salesSu_female) {
		this.salesSu_female = salesSu_female;
	}
	public long getSalesSu_10() {
		return salesSu_10;
	}
	public void setSalesSu_10(long salesSu_10) {
		this.salesSu_10 = salesSu_10;
	}
	public long getSalesSu_20() {
		return salesSu_20;
	}
	public void setSalesSu_20(long salesSu_20) {
		this.salesSu_20 = salesSu_20;
	}
	public long getSalesSu_30() {
		return salesSu_30;
	}
	public void setSalesSu_30(long salesSu_30) {
		this.salesSu_30 = salesSu_30;
	}
	public long getSalesSu_40() {
		return salesSu_40;
	}
	public void setSalesSu_40(long salesSu_40) {
		this.salesSu_40 = salesSu_40;
	}
	public long getSalesSu_50() {
		return salesSu_50;
	}
	public void setSalesSu_50(long salesSu_50) {
		this.salesSu_50 = salesSu_50;
	}
	public long getSalesSu_60() {
		return salesSu_60;
	}
	public void setSalesSu_60(long salesSu_60) {
		this.salesSu_60 = salesSu_60;
	}
	public long getStoreSu() {
		return storeSu;
	}
	public void setStoreSu(long storeSu) {
		this.storeSu = storeSu;
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
