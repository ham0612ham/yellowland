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
	public List<Faq> ListFap(Map<String, Object> map) {
		List<Faq> list = null;
		
		try {
			list = dao.selectList("faq.listFaq", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
