package com.sp.app.localComm;

import java.util.List;
import java.util.Map;

public interface LocalCommService {
	public void insertLocalComm(LocalComm dto, String pathname) throws Exception;
	public int dataCount(Map<String, Object> map);
	public LocalComm readLocalComm(long num);
	public void updateHitCount(long num) throws Exception;
	public LocalComm preReadLocalComm(Map<String, Object> map);
	public LocalComm nextReadLocalComm(Map<String, Object> map);
	public void updateLocalComm(LocalComm dto, String pathname) throws Exception;
	public void deleteLocalComm(long num, String pathname) throws Exception;
	
	public List<LocalComm> ListLocalComm(Map<String, Object> map);
	
	public void insertLocalCommLike(Map<String, Object> map) throws Exception;
	public void deleteLocalCommLike(Map<String, Object> map) throws Exception;
	public int localCommLikeCount(long num);
	public boolean userLocalCommLiked(Map<String, Object> map);
	
	// 댓글
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	// 시군구
	public List<LocalComm> listSigu () throws Exception;
	public List<LocalComm> listDong (long siguNum) throws Exception;
	
	// 파일
	public void insertFile(LocalComm dto) throws Exception;
	public List<LocalComm> listFile(long num);
	public LocalComm readFile(long fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;
	
}
