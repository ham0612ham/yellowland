package com.sp.app.event;

import java.util.List;
import java.util.Map;

public interface EventService {
	public int dataCount();
	public void insertEvent(Event dto, String pathname) throws Exception;
	public List<Event> listEvent(Map<String, Object> map);
	public Event readEvent(long num);
	public Event preReadEvent(Map<String, Object> map);
	public Event nextReadEvent(Map<String, Object> map);
	public void updateEvent(Event dto, String pathname) throws Exception;
	public void deleteEvent(long num, String pathname) throws Exception;
}
