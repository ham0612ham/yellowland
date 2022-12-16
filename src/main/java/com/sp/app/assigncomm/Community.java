package com.sp.app.assigncomm;

public class Community {
	private long assignCommNum; // 상가양도 번호 
	private String subject;     // 제목
	private String content;     // 내용
	private String id;          // 작성자 아이디
	private String dongNum;     // 행정동 코드
	private String categoryNum; // 업종 번호
	private String storeNum;    // 점포 번호 
	private String regDate;     // 등록 일자
	private String upDate;      // 수정 일자
	
	private String thumnail;    // 대표 이미지
	private String imgName;     // 추가 이미지
	
	
	public long getAssignCommNum() {
		return assignCommNum;
	}
	public void setAssignCommNum(long assignCommNum) {
		this.assignCommNum = assignCommNum;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDongNum() {
		return dongNum;
	}
	public void setDongNum(String dongNum) {
		this.dongNum = dongNum;
	}
	public String getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(String categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getStoreNum() {
		return storeNum;
	}
	public void setStoreNum(String storeNum) {
		this.storeNum = storeNum;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUpDate() {
		return upDate;
	}
	public void setUpDate(String upDate) {
		this.upDate = upDate;
	}
	public String getThumnail() {
		return thumnail;
	}
	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	
	
	
}
