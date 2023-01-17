package com.sp.app.myTypeReply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("myTypeReply.myReplyService")
public class MyReplyServiceImpl implements MyReplyService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<MyTypeReply>listMyReply(Map<String, Object> map) {
		List<MyTypeReply>list=null;
		try {
			list=dao.selectList("myTypeReply.listMyReply",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("myTypeReply.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public MyTypeReply readMyReply(long num) {
		MyTypeReply dto=null;
		try {
			dto=dao.selectOne("myTypeReply.readMyReply", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
