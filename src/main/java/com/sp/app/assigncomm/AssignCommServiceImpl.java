package com.sp.app.assigncomm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service(value = "assigncomm.assignCommService")
public class AssignCommServiceImpl implements AssignCommService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertComm(Community dto) throws Exception {
		
		try {
			
			dao.insertData("assigncomm.insertComm", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateComm(Community dto) throws Exception {
		try {
			
			dao.updateData("assigncomm.updateComm", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteComm(long num) throws Exception {
		try {
			
			dao.deleteData("assigncomm.deleteComm", num);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Community readComm(long num) {
		Community dto = null;
		
		try {
			
			dto = dao.selectOne("assigncomm.readComm", num);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return dto;
	}

	@Override
	public List<Community> listComm(String dongNum) {
		List<Community> list = null;
		
		try {
			
			list = dao.selectList("assigncomm.listComm", dongNum);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}

}
