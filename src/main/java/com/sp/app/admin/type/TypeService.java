package com.sp.app.admin.type;

import java.util.List;
import java.util.Map;

public interface TypeService {
	public int dataCount(Map<String, Object>map);
	public List<TypeComm> listType(Map<String, Object>map);
	public TypeComm readType(long num)throws Exception;
	public TypeComm preReadType(Map<String, Object>map);
	public TypeComm nextReadType(Map<String, Object>map);
	public void deleteType(long num)throws Exception;
	//public TypeComm readAnswer(long num);
	public void updateHitCount(long num)throws Exception;
	//public void insertTypeCommLike(Map<String, Object> map) throws Exception;
	//public void deleteTypeCommLike(Map<String, Object> map) throws Exception;
	public int typeCommLikeCount(long num);
	public boolean userTypeCommLiked(Map<String, Object> map);
	public void insertTypeCommLike(Map<String, Object> map) throws Exception;
	public void deleteTypeCommLike(Map<String, Object> map) throws Exception;
	
	// 댓글
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	// 파일
	//public void insertFile(TypeComm dto) throws Exception;
	public List<TypeComm> listFile(long num);
	public TypeComm readFile(long fileNum);
	//public void deleteFile(Map<String, Object> map) throws Exception;
}
