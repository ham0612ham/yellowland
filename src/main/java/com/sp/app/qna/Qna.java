package com.sp.app.qna;

public class Qna {
	// 1:1 게시글
	private long num;
	private String subject;
	private String content;
	private String regDate;
	private String userId;
	private String userName;
	private Integer parent;
	private int isReply;
	private int questionPrivate;
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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getParent() {
		return parent;
	}
	public void setParent(Integer parent) {
		this.parent = parent;
	}
	public int getIsReply() {
		return isReply;
	}
	public void setIsReply(int isReply) {
		this.isReply = isReply;
	}
	public int getQuestionPrivate() {
		return questionPrivate;
	}
	public void setQuestionPrivate(int questionPrivate) {
		this.questionPrivate = questionPrivate;
	}
}
