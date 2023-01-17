package com.sp.app.admin.board;

import java.util.List;
import java.util.Map;



public interface BoardService {
	public int dataCount(Map<String, Object>map);
	public List<Board> listBoard(Map<String, Object>map);
	public Board readBoard(long num);
	public void updateHitCount (long num)throws Exception;
	public Board preReadBoard(Map<String, Object>map);
	public Board nextReadBoard(Map<String, Object>map);
	public void deleteBoard(long num)throws Exception;
	//public Board readAnswer(long num);
	
	public void insertBoardLike(Map<String , Object>map)throws Exception;
	public void deleteBoardLike(Map<String , Object>map)throws Exception;
	public int BoardLikeCount(long num);
	public boolean userBoardLiked(Map<String, Object>map);
	
	public void insertReply(Reply dto)throws Exception;
	public List<Reply>listReply(Map<String, Object>map);
	public int replyCount(Map<String, Object>map);
	public void deleteReply(Map<String, Object>map)throws Exception;
	
	public List<Board>listSigu ()throws Exception;
	public List<Board>listDong (long siguNum)throws Exception;
	
	public List<Board>listFile(long num);
	public Board readFile(long fileNum);
}
