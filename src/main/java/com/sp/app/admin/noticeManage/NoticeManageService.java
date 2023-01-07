package com.sp.app.admin.noticeManage;

import java.util.List;
import java.util.Map;

public interface NoticeManageService {
	public void insertNotice(Notice dto, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object>map);
	public List<Notice> listNotice(Map<String, Object>map);
	
	
	public void updateHitCount(long num) throws Exception;
	public Notice readNotice(long num);
	public Notice preReadNotice(Map<String, Object> map);
	public Notice nextReadNotice(Map<String, Object> map);
	
	public void updateNotice(Notice dto, String pathname) throws Exception;
	public void deleteNotice(long num, String pathname) throws Exception;

	public void insertFile(Notice dto) throws Exception;
	public List<Notice> listFile(long num);
	public Notice readFile(long fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;
}
