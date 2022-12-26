package com.sp.app.admin.board;

public class Board {
	private long num;
	private String userId;
	private String subject;
	private String content;
	private String region;
	private String regdate;
	private String hitcount;	
	private String catejobnum;
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getHitcount() {
		return hitcount;
	}
	public void setHitcount(String hitcount) {
		this.hitcount = hitcount;
	}
	public String getCatejobnum() {
		return catejobnum;
	}
	public void setCatejobnum(String catejobnum) {
		this.catejobnum = catejobnum;
	}
	
}
