package com.sp.app.admin.faqManage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service(".admin.faqManage.faqManageService")
public class FaqManageServiceImpl implements FaqManageService{
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertFaq(Faq dto, String pathname) throws Exception {
		try {
			long seq=dao.selectOne("faqManage.seq");
			dto.setNum(seq);
			dao.insertData("faqManage.insertFaq",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result =dao.selectOne("faqManage.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	return result;
	}

	@Override
	public List<Faq> listFaq(Map<String, Object> map) {
		List<Faq>list=null;
		
		try {
			list=dao.selectList("faqManage.listFaq",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Faq readFaq(long num) throws Exception {
		Faq dto=null;
		try {
			dto=dao.selectOne("faqManage.readFaq",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Faq preReadFaq(Map<String, Object> map) {
		Faq dto=null;
		try {
			dto = dao.selectOne("faqManage.preReadFaq", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Faq nextReadFaq(Map<String, Object> map) {
		Faq dto=null;
		try {
			dto = dao.selectOne("faqManage.nextReadFaq", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateFaq(Faq dto, String pathname) throws Exception {
		try {
			dao.updateData("faqManage.updateFaq",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
	}

	@Override
	public void deleteFaq(long num, String pathname) throws Exception {
		try {
			dao.deleteData("faqManage.deleteFaq", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	

}
