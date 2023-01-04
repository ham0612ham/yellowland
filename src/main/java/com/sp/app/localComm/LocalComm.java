package com.sp.app.localComm;

import org.springframework.web.multipart.MultipartFile;

public class LocalComm {
	private long num;
	private String userId;
	private String userName;
	private String subject;
	private String content;
	private String regDate;
	private	int hitCount;
	
	private long siguNum; // insert 할 때 필요함 
	private long dongNum; //  insert 할 때 필요함
	
	private String siguName; // select 할 때 필요함 
	private String dongName; // select 할 때 필요함
	
	private String saveFilename;
	private String originalFilename;
	private MultipartFile selectFile; // <input type='file' name='selectFile' ..
	
	private int replyCount;
	private int localCommLikeCount;
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
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
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getLocalCommLikeCount() {
		return localCommLikeCount;
	}
	public void setLocalCommLikeCount(int localCommLikeCount) {
		this.localCommLikeCount = localCommLikeCount;
	}
	
	
}
