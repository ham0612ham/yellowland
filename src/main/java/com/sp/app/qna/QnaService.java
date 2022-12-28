package com.sp.app.qna;

import java.util.List;
import java.util.Map;

public interface QnaService {
	public void insertQna(Qna dto) throws Exception; // 회원이 Qna 작성
	public List<Qna> listQna(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Qna readQna(long num);
	public void updateQna(Qna dto) throws Exception;
	public void deleteQna(long num) throws Exception;
	
	public List<Reply> listReply(Map<String, Object> map);
	

	
	

	
}
