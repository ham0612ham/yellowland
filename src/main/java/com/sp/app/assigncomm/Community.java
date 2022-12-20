package com.sp.app.assigncomm;

public class Community {
	private long assignCommNum; // 상가양도 번호 
	private String subject;     // 제목
	private String content;     // 내용
	private String id;          // 작성자 아이디
	private String dongNum;     // 행정동 코드
	private String regDate;     // 등록 일자
	private String updateDate;      // 수정 일자
	
	private String zip;
	private String addr1;
	private String addr2;
	
	private String thumnail;    // 대표 이미지
	private String imgName;     // 추가 이미지
	
	
	
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
