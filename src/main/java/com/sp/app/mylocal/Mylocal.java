package com.sp.app.mylocal;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Mylocal {
	private long num;
	private String userId;
	private String userName;
	private String subject;
	private String content;
	private String regDate;
	private	int hitCount;
	
	private int replyCount;
	private long fileNum;
	private String originalFilename;
	private String saveFilename;
	private long fileSize;
	private int fileCount;
	private int localCommLikeCount;
	private int likeCount;

	private long siguNum; // insert 할 때 필요함 
	private long dongNum; //  insert 할 때 필요함
	
	private String siguName; // select 할 때 필요함 
	private String dongName; // select 할 때 필요함
	// 스프링에서 파일 받기
	private List<MultipartFile> selectFile;
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

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
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

	public long getFileNum() {
		return fileNum;
	}

	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public String getSaveFilename() {
		return saveFilename;
	}

	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public int getFileCount() {
		return fileCount;
	}

	public void setFileCount(int fileCount) {
		this.fileCount = fileCount;
	}

	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}


	
	// 파일
	
}
