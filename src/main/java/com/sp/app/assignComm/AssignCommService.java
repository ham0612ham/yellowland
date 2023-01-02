package com.sp.app.assignComm;

import java.util.List;

public interface AssignCommService {
	public void insertAllComm(Community dto, String path) throws Exception; // 입력 폼 내용 입력
	public void updateComm(Community dto, String path) throws Exception; // 게시물 업데이트
	public void deleteComm(long num) throws Exception; // 게시물 삭제
	
	public Community readComm(long num); // 상세 페이지
	public List<Community> readCommImg(long num); // 상세 페이지(추가 이미지)
	public List<Community> listComm(); // 전체 리스트
	public long listCommCount(); // 전체 리스트 갯수

	public List<Community> listComm(String userId); // 내 게시물 리스트
	public long listCommCount(String userId); // 내 게시물 갯수
	
	public void insertNote(Note note) throws Exception;
}
