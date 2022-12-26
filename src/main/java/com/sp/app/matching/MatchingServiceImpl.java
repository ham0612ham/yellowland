package com.sp.app.matching;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service(value= "matching.matchingService")
public class MatchingServiceImpl implements MatchingService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertMatching(Matching dto) throws Exception {
	
		try {
			dao.insertData("matching.insertMatching", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMatching(Matching dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMatching(long num) throws Exception {
		try {
			dao.deleteData("matching,deleteMatching",num);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	
	}

	@Override
	public Matching readMatching(long num) {
		Matching dto = null;
		try {
			dto = dao.selectOne("matching,readMatching", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Matching> listMatching(String num) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
