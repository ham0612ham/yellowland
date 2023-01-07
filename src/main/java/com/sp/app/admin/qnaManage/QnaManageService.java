package com.sp.app.admin.qnaManage;
import java.util.List;
import java.util.Map;

public interface QnaManageService {
	public List<Qna>listQna(Map<String , Object>map);
	public int dataCount(Map<String, Object>map);
	public Qna preReadQna(Map<String, Object>map);
	public Qna nextReadQna(Map<String, Object>map);
	public Qna readQna(long num);
	public Qna readAnswer(long num);
	public void answerQna(Qna dto)throws Exception;
	public void deleteAnswer(long num)throws Exception;
	public void updateQna(Qna dto,String pathname);
	public void deleteQna(long num)throws Exception; 
}
