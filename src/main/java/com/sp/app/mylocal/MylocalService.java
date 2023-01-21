package com.sp.app.mylocal;

import java.util.List;
import java.util.Map;


public interface MylocalService {
	public void insertMylocal(Mylocal dto, String pathname)throws Exception;
	public int dataCount(Map<String, Object>map);
	public Mylocal readMylocal(long num);
	public void updateHitCount(long num)throws Exception;
	public Mylocal preReadMylocal(Map<String, Object>map);
	public Mylocal nextReadMylocal(Map<String, Object>map);
	public void updateMylocal(Mylocal dto, String pathname)throws Exception;
	public void deleteMylocal (long num, String pathname)throws Exception;
	
	public List<Mylocal>listMylocal(Map<String , Object>map)throws Exception;
	
	public void insertMylocalLike(Map<String, Object> map) throws Exception;
	public void deleteMylocalLike(Map<String, Object> map) throws Exception;
	
	public int MylocalLikeCount(long num);
	public boolean userMylocalLiked(Map<String, Object> map);
	
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public void insertFile(Mylocal dto)throws Exception;
	public List<Mylocal>listFile(long num);
	public Mylocal readFile(long fileNum);
	public void deleteFile(Map<String , Object>map)throws Exception;
	
	public List<Mylocal>listsigu()throws Exception;
	public List<Mylocal>listDong(long siguNum)throws Exception;
	
}
