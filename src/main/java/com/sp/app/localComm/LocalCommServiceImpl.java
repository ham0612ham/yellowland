package com.sp.app.localComm;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("localComm.localCommService")
public class LocalCommServiceImpl implements LocalCommService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<LocalComm> ListLocalCommunity(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void insertLocalComm(LocalComm dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}

			dao.insertData("localCommu.insertLocalCommu", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	/*
	@Override
	public void readSiguNum(long siguNum) throws Exception {
		LocalComm dto = null;
		
		try {
			dto = dao.selectOne("localCommu.readSiguNum", siguNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	*/
	
	

	@Override
	public List<LocalComm> listComm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public LocalComm readLocalComm(long num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public LocalComm preReadLocalComm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LocalComm nextReaLocalComm(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateLocalComm(LocalComm dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteLocalComm(long num, String pathname, String userId) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertLocalCommLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteLocalCommLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int LocalCommLikeCount(long num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean userLocalCommLiked(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public List<LocalComm> listSigu() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<LocalComm> listDong(long siguNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}





}
