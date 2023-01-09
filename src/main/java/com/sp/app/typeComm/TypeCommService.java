package com.sp.app.typeComm;

import java.util.List;
import java.util.Map;

public interface TypeCommService {
	public void insertTypeComm(TypeComm dto, String pathname) throws Exception;
	public int dataCount(Map<String, Object> map);
	public TypeComm readTypeComm(long num);
	public void updateHitCount(long num) throws Exception;
	public TypeComm preReadTypeComm(Map<String, Object> map);
	public TypeComm nextReadTypeComm(Map<String, Object> map);
	public void updateTypeComm(TypeComm dto, String pathname) throws Exception;
	public void deleteTypeComm(long num, String pathname) throws Exception;
	
	public List<TypeComm> ListTypeComm(Map<String, Object> map);
	
	public void insertTypeCommLike(Map<String, Object> map) throws Exception;
	public void deleteTypeCommLike(Map<String, Object> map) throws Exception;
	public int typeCommLikeCount(long num);
	public boolean userTypeCommLiked(Map<String, Object> map);
	
	// 댓글
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	// 파일
	public void insertFile(TypeComm dto) throws Exception;
	public List<TypeComm> listFile(long num);
	public TypeComm readFile(long fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;
}
