package com.sp.app.admin.eventManage;

import java.util.List;
import java.util.Map;

public interface EventManageService {
	public int dataCount(Map<String, Object> map);
	public List<Event> listEvent(Map<String, Object> map);
	public Event readEvent(long num);
	public Event preReadEvent(Map<String, Object> map);
	public Event nextReadEvent(Map<String, Object> map);
	
	public void insertEvent(Event dto, String pathname) throws Exception;
	public void updateEvent(Event dto, String pathname) throws Exception;
	public void deleteEvent(long num, String pathname) throws Exception;
	
	public int eventLikeCount(long num);
}
