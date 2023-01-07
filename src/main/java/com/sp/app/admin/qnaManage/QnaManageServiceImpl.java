package com.sp.app.admin.qnaManage;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("admin.qnaManage.qnaManageService")
public class QnaManageServiceImpl implements QnaManageService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Qna> listQna(Map<String, Object> map) {
		List<Qna>list=null;
		
		try {
			list=dao.selectList("qnaManage.listQna",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result =0;
		
		try {
			result=dao.selectOne("qnaManage.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Qna preReadQna(Map<String, Object> map) {
		Qna dto=null;
		try {
			dto=dao.selectOne("qnaManage.preReadQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Qna nextReadQna(Map<String, Object> map) {
		Qna dto=null;
		try {
			dto=dao.selectOne("qnaManage.nextReadQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void deleteQna(long num) throws Exception {
		try {
			dao.deleteData("qnaManage.deleteQna",num);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Qna readQna(long num) {
		Qna dto=null;
		try {
			dto=dao.selectOne("qnaManage.readQna", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateQna(Qna dto, String pathname) {
		try {
			dao.updateData("qnaManage.updateQna", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void answerQna(Qna dto) throws Exception {
		try {
			dao.insertData("qnaManage.answerQna",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteAnswer(long num) throws Exception {
		try {
			dao.deleteData("qnaManage.deleteAnswer",num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Qna readAnswer(long num) {
		Qna dto= null;
		try {
			dto=dao.selectOne("qnaManage.readAnswer", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}


	
}
