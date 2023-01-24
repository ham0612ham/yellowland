package com.sp.app.matching;

public class Matching {

	private long matchingNum; //매칭번호 
	private String userId; //아이디
	private String name; //이름
	private String catejobNum; //업종카테
	private String jobNum; //업종번호
	private String catejobName;//업종카테이름
	private String jobName; //업종이름
	private String budget;      //임대료예산 
	private String size; //희망면적 
	private String targetgender; //성
	private String targetage; //연령층 
	
	public String getCatejobNum() {
		return catejobNum;
	}
	public void setCatejobNum(String catejobNum) {
		this.catejobNum = catejobNum;
	}
	public String getJobNum() {
		return jobNum;
	}
	public void setJobNum(String jobNum) {
		this.jobNum = jobNum;
	}
	public String getCatejobName() {
		return catejobName;
	}
	public void setCatejobName(String catejobName) {
		this.catejobName = catejobName;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getTargetgender() {
		return targetgender;
	}
	public void setTargetgender(String targetgender) {
		this.targetgender = targetgender;
	}
	public String getTargetage() {
		return targetage;
	}
	public void setTargetage(String targetage) {
		this.targetage = targetage;
	}
	private String mDate; //분석날짜
	
	private long siguNum; // 자치구
	private long dongNum; // 행정동 
	
	private String siguName; // 자치구 
	private String dongName; // 행정동 
	
	
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
	public String getSiguName() {
		return siguName;
	}
	public void setSiguName(String siguName) {
		this.siguName = siguName;
	}
	public String getDongName() {
		return dongName;
	}
	public void setDongName(String dongName) {
		this.dongName = dongName;
	}
	
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
