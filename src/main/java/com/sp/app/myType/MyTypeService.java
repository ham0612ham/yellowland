package com.sp.app.myType;

import java.util.List;
import java.util.Map;



public interface MyTypeService {
	public void insertMYType(MyType dto, String pathname) throws Exception;
	public int dataCount(Map<String, Object> map);
	public MyType readMYType(long num);
	public void updateHitCount(long num) throws Exception;
	public MyType preReadMYType(Map<String, Object> map);
	public MyType nextReadMYType(Map<String, Object> map);
	public void updateMYType(MyType dto, String pathname) throws Exception;
	public void deleteMYType(long num, String pathname) throws Exception;
	
	public List<MyType> listTypeComm(Map<String, Object> map);
	
	public void insertTypeCommLike(Map<String, Object> map) throws Exception;
	public void deleteTypeCommLike(Map<String, Object> map) throws Exception;
	public int typeCommLikeCount(long num);
	public boolean userTypeCommLiked(Map<String, Object> map);
	
	//업종 
	public List<MyType>listCategory()throws Exception;
	public List<MyType>listJob(String catejobNum) throws Exception;
	
	// 댓글
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	// 파일
	public void insertFile(MyType dto) throws Exception;
	public List<MyType> listFile(long num);
	public MyType readFile(long fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;
}
