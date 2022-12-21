package com.sp.app.note;

import java.util.List;
import java.util.Map;

public interface NoteService {
	public List<Note> listFriend(Map<String, Object> map);
	
	public void insertNode(Note dto) throws Exception;

	public int dataCountReceive(Map<String, Object> map);
	public List<Note> listReceive(Map<String, Object> map);
	
	public int dataCountSend(Map<String, Object> map);
	public List<Note> listSend(Map<String, Object> map);
	
	public Note readReceive(long num);
	public Note preReadReceive(Map<String, Object> map);
	public Note nextReadReceive(Map<String, Object> map);
	
	public Note readSend(long num);
	public Note preReadSend(Map<String, Object> map);
	public Note nextReadSend(Map<String, Object> map);
	
	public void updateIdentifyDay(long num) throws Exception;
	
	public void deleteNote(Map<String, Object> map) throws Exception;
	
	public int newNoteCount(String userId);
}
