package com.sp.app.localComm;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("localComm.localCommService")
public class LocalCommServiceImpl implements LocalCommService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertLocalComm(LocalComm dto, String pathname) throws Exception {
		
		try {
			long seq = dao.selectOne("notice.seq");
			dto.setNum(seq);
			
			dao.insertData("localComm.insertLocalComm", dto);
			
			// 파일 업로드 하기
			if(! dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) {
						continue;
					}

					String originalFilename = mf.getOriginalFilename();
					long fileSize = mf.getSize();

					dto.setOriginalFilename(originalFilename);
					dto.setSaveFilename(saveFilename);
					
					// 파일 인서트 
					dao.insertData("localComm.insertFile", dto);

				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	@Override
	public List<LocalComm> ListLocalComm(Map<String, Object> map) {
		List<LocalComm> list = null;

		try {
			list = dao.selectList("localComm.ListLocalComm", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	

	@Override
	public List<LocalComm> listDong(long siguNum) throws Exception {

		List<LocalComm> listDong = null;

		try {
			listDong = dao.selectList("localComm.listDong", siguNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listDong;
	}
	

	@Override
	public List<LocalComm> listSigu() throws Exception {
		List<LocalComm> listSigu = null;

		try {
			listSigu = dao.selectList("localComm.listSigu");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listSigu;
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


}
