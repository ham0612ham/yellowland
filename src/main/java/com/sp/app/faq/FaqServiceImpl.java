package com.sp.app.faq;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("faq.faqService")
public class FaqServiceImpl implements FaqService{
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public List<Faq> ListFaq(Map<String, Object> map) {
		List<Faq> list = null;
		
		try {
			list = dao.selectList("faq.listFaq", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("faq.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return result;
	}
	
	@Override
	public Faq readFaq(long num) {
		Faq dto = null;
		
		try {
			dto = dao.selectOne("faq.readFaq", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	

}
