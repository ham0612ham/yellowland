package com.sp.app.myqna;

import java.util.List;
import java.util.Map;

public interface MyQnaService {
	public void insertMyQna(MyQna dto) throws Exception;
	public List<MyQna> listMyQna(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public MyQna readMyQna(long num);
	public void updateMyQna(MyQna dto) throws Exception;
	public void deleteMyQna(long num) throws Exception;
	public MyQna readAnswer(long num);
	public MyQna preReadMyQna(Map<String, Object>map);
	public MyQna nextReadMyQna(Map<String, Object>map);

}
