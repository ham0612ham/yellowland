package com.sp.app.admin.faqManage;

import java.util.List;
import java.util.Map;

public interface FaqManageService {
	public void insertFaq(Faq dto, String pathname)throws Exception;
	
	public int dataCount(Map<String, Object>map);
	public List<Faq> listFaq(Map<String, Object>map);
	
	public Faq readFaq(long num)throws Exception;
	public Faq preReadFaq(Map<String, Object>map);
	public Faq nextReadFaq(Map<String, Object>map);
	
	public void updateFaq(Faq dto,String pathname)throws Exception;
	public void deleteFaq(long num, String pathname)throws Exception;
}
