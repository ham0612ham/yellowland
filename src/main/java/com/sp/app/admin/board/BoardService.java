package com.sp.app.admin.board;

import java.util.List;
import java.util.Map;



public interface BoardService {
	public int dataCount(Map<String, Object>map);
	public List<Board> listBoard(Map<String, Object>map);
	public Board readBoard(long num)throws Exception;
	public Board preReadBoard(Map<String, Object>map);
	public Board nextReadBoard(Map<String, Object>map);
}
