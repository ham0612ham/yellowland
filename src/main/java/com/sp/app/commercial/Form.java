package com.sp.app.commercial;

public class Form {
	private String selectedMenu; // 점포수|매출|유동인구|주거인구
	private String siguNum; // 자치구 번호
	
	private String selectMenu1; // 업종
	private String selectWork;
	
	private String gender;
	private String week;
	private String age;
	
	public String getSelectedMenu() {
		return selectedMenu;
	}
	public void setSelectedMenu(String selectedMenu) {
		this.selectedMenu = selectedMenu;
	}
	public String getSiguNum() {
		return siguNum;
	}
	public void setSiguNum(String siguNum) {
		this.siguNum = siguNum;
	}
	public String getSelectMenu1() {
		return selectMenu1;
	}
	public void setSelectMenu1(String selectMenu1) {
		this.selectMenu1 = selectMenu1;
	}
	public String getSelectWork() {
		return selectWork;
	}
	public void setSelectWork(String selectWork) {
		this.selectWork = selectWork;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
}
