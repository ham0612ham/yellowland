package com.sp.app.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {	
	
	public List<Notice> listNotice(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Notice readNotice(long num);
	
	public void updateHitCount(long num) throws Exception;
	
	public Notice preReadNotice(Map<String, Object> map);
	public Notice nextReadNotice(Map<String, Object> map);
	
	// 파일 
	public List<Notice> listFile(long num);
	public Notice readFile(long fileNum);
}
