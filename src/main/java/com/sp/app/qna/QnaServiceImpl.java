package com.sp.app.qna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("qna.qnaService")
public class QnaServiceImpl implements QnaService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertQna(Qna dto) throws Exception {
		try {
			dao.insertData("qna.insertQna", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Qna> listQna(Map<String, Object> map) {
		List<Qna> list = null;
		
		try {
			list = dao.selectList("qna.listQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("qna.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Qna readQna(long num) {
		Qna dto = null;
		
		try {
			dto = dao.selectOne("qna.readQuestion", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}


	@Override
	public void updateQna(Qna dto) throws Exception {
		try {
			dao.updateData("qna.updateQna", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteQna(long num) throws Exception {
		try {
			dao.deleteData("qna.deleteQna", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		Qna dto = null; 
		
		try {
			dto = dao.selectOne("qna.readAnswer", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}



		
}
