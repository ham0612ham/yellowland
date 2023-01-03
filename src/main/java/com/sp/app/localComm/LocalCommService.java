package com.sp.app.localComm;

import java.util.List;
import java.util.Map;

public interface LocalCommService {
	public void insertLocalComm(LocalComm dto, String pathname) throws Exception;
	public List<LocalComm> listComm(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public LocalComm readLocalComm(long num);
	public void updateHitCount(long num) throws Exception;
	public LocalComm preReadLocalComm(Map<String, Object> map);
	public LocalComm nextReaLocalComm(Map<String, Object> map);
	public void updateLocalComm(LocalComm dto, String pathname) throws Exception;
	public void deleteLocalComm(long num, String pathname, String userId) throws Exception;
	
	public List<LocalComm> ListLocalCommunity(Map<String, Object> map);
	
	public void insertLocalCommLike(Map<String, Object> map) throws Exception;
	public void deleteLocalCommLike(Map<String, Object> map) throws Exception;
	public int LocalCommLikeCount(long num);
	public boolean userLocalCommLiked(Map<String, Object> map);
	
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public List<LocalComm> listSigu () throws Exception;
	public List<LocalComm> listDong (long siguNum) throws Exception;

}