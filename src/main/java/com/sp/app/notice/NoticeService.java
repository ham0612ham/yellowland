package com.sp.app.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	// 글 등록, 수정, 삭제, 글 보기, 글 리스트 
	public void insertNotice() throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Notice> listNotice(Map<String, Object> map);
	
	
	
	
}
