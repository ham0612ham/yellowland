package com.sp.app.matching;

public class Matching {

	private long matchingNum; //매칭번호 
	private String userId; //아이디
	private String name; //이름
	private String region;    //지역 
	private String category;  //업종
	private String budget;      //임대료예산 
	private String size; //희망면적 
	private String mDate; //분석날짜
	
	public long getMatchingNum() {
		return matchingNum;
	}
	public void setMatchingNum(long matchingNum) {
		this.matchingNum = matchingNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBudget() {
		return budget;
	}
	public void setBudget(String budget) {
		this.budget = budget;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getmDate() {
		return mDate;
	}
	public void setmDate(String mDate) {
		this.mDate = mDate;
	}
	
}
