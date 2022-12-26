package com.sp.app.admin.qna;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;

import com.sp.app.common.dao.CommonDAO;

public class QnaManageServiceImpl implements QnaManageService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Qna> listQna(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
