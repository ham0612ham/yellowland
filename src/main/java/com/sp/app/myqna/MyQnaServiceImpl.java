package com.sp.app.myqna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;
@Service("myqna.myqnaService")
public class MyQnaServiceImpl implements MyQnaService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertMyQna(MyQna dto) throws Exception {
		try {
			dao.insertData("myqna.insertMyQna",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public List<MyQna> listMyQna(Map<String, Object> map) {
		List<MyQna>list=null;
		try {
			list=dao.selectList("myqna.listMyQna",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("myqna.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public MyQna readMyQna(long num) {
		MyQna dto=null;
		try {
			dto=dao.selectOne("myqna.readMyQna", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateMyQna(MyQna dto) throws Exception {
		try {
			dao.updateData("myqna.updateMyQna",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteMyQna(long num) throws Exception {
		try {
			dao.deleteData("myqna.deleteMyQna", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public MyQna readAnswer(long num) {
		MyQna dto=null;
		
		try {
			dto=dao.selectOne("myqna.readAnswer", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public MyQna preReadMyQna(Map<String, Object> map) {
		MyQna dto=null;
		try {
			dto=dao.selectOne("myqna.preReadMyQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public MyQna nextReadMyQna(Map<String, Object> map) {
		MyQna dto=null;
		try {
			dto=dao.selectOne("myqna.nextReadMyQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	

	

}
