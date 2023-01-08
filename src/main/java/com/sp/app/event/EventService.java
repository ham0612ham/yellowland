package com.sp.app.event;

import java.util.List;
import java.util.Map;

public interface EventService {
	public int dataCount();
	public List<Event> listEvent(Map<String, Object> map);
	public Event readEvent(long num);
	public Event preReadEvent(Map<String, Object> map);
	public Event nextReadEvent(Map<String, Object> map);
	
	public void insertEvent(Event dto, String pathname) throws Exception;
	public void updateEvent(Event dto, String pathname) throws Exception;
	public void deleteEvent(long num, String pathname) throws Exception;
	
	public int disDataCount();
	public List<Event> disListEvent(Map<String, Object> map);
	public Event disPreReadEvent(Map<String, Object> map);
	public Event disNextReadEvent(Map<String, Object> map);
	
	public int eventLikeCount(long num);
	public void insertEventLike(Map<String, Object> map) throws Exception;
	public void deleteEventLike(Map<String, Object> map) throws Exception;
	public boolean userEventLiked(Map<String, Object> map);
}
