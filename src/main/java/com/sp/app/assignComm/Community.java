package com.sp.app.assignComm;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Community {
	
	private long num; // 상가양도 번호 
	
	private String subject;     // 제목
	private String content;     // 내용
	private String userId;      // 작성자 아이디
	private String regDate;     // 등록 일자
	private String updateDate;  // 수정 일자
	
	private String pNum;		// 연락처 
	private String zip;			// 우편번호
	private String addr1;		// 기본 주소
	private String addr2;		// 상세 주소
	
	private String thumbnail; // 대표 이미지
	private MultipartFile thumbnailFile; 
	
	private String imgName;   // 추가 이미지
	private List<MultipartFile> imgFiles; 	
	
	private int deposit;   // 보증금
	private int monthly;   // 월세
	private int expense;   // 관리비
	private int area; 	   // 전용면적
	private int bFloor;    // 건물 층
	private int floor;     // 해당 층
	private int parking;   // 주차
	private int elevator;  // 엘리베이터
	private int transDate; // 양도 가능일
	
	
	
	
	
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}
	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public List<MultipartFile> getImgFiles() {
		return imgFiles;
	}
	public void setImgFiles(List<MultipartFile> imgFiles) {
		this.imgFiles = imgFiles;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getpNum() {
		return pNum;
	}
	public void setpNum(String pNum) {
		this.pNum = pNum;
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
	
	
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public int getMonthly() {
		return monthly;
	}
	public void setMonthly(int monthly) {
		this.monthly = monthly;
	}
	public int getExpense() {
		return expense;
	}
	public void setExpense(int expense) {
		this.expense = expense;
	}
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public int getbFloor() {
		return bFloor;
	}
	public void setbFloor(int bFloor) {
		this.bFloor = bFloor;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public int getParking() {
		return parking;
	}
	public void setParking(int parking) {
		this.parking = parking;
	}
	public int getElevator() {
		return elevator;
	}
	public void setElevator(int elevator) {
		this.elevator = elevator;
	}
	public int getTransDate() {
		return transDate;
	}
	public void setTransDate(int transDate) {
		this.transDate = transDate;
	}
	
	
	
	
	
	
	
}
