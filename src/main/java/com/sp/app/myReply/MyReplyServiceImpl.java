package com.sp.app.myReply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("myReply.myReplyService")
public class MyReplyServiceImpl implements MyReplyService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<MyReply> listMyReply(Map<String, Object> map) {
		List<MyReply>list=null;
		try {
			list=dao.selectList("myReply.listMyReply",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("myReply.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public MyReply readMyReply(long num) {
		MyReply dto=null;
		try {
			dto=dao.selectOne("myReply.readMyReply", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
