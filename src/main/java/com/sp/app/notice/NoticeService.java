package com.sp.app.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {	
	// 글 리스트
	public List<Notice> listNotice(Map<String, Object> map);

	// 글의 갯수 세기
	public int dataCount(Map<String, Object> map);
	
	// 글 보기
	public Notice readNotice(long num);
	
	// 조회수
	public void updateHitCount(long num) throws Exception;
	
	// 이전글,다음글 보기
	public Notice preReadNotice(Map<String, Object> map);
	public Notice nextReadNotice(Map<String, Object> map);
	
	// 파일 리스트
	public List<Notice> listFile(long num);
	// 공지 파일 읽기
	public Notice readFile(long fileNum);
}
