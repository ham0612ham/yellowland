package com.sp.app.assignComm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service(value = "assignComm.assignCommService")
public class AssignCommServiceImpl implements AssignCommService {

	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertAllComm(Community dto, String pathname) throws Exception {
		
		try {
			
			String thumbnail = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			dto.setThumbnail(thumbnail);
			
			String pNum = dto.getpNum1() + "-" + dto.getpNum2() + "-" + dto.getpNum3();
			dto.setpNum(pNum);
			
			dao.insertData("assignComm.insertComm", dto);
			dao.insertData("assignComm.insertCommDetail", dto);
			
			// 추가 이미지가 있으면
			if(! dto.getImgFiles().isEmpty()) {
				for(MultipartFile file : dto.getImgFiles()) {
					String imgName = fileManager.doFileUpload(file, pathname);
					
					if(imgName == null) {
						continue;
					}
					
					dto.setImgName(imgName);
					dao.insertData("assignComm.insertCommImg", dto);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateComm(Community dto, String pathname) throws Exception {
		
		try {
			
			String pNum = dto.getpNum1() + "-" + dto.getpNum2() + "-" + dto.getpNum3();
			dto.setpNum(pNum);
			
			String thumbnail = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			dto.setThumbnail(thumbnail);
			
			dao.updateData("assignComm.updateComm", dto);
			dao.updateData("assignComm.updateCommDetail", dto);
			
			// 추가 이미지가 있으면
			if(dto.getImgFiles().size() != 0) {
				
				for( MultipartFile img : dto.getImgFiles() ) {
					
					String imgName = fileManager.doFileUpload(img, pathname);
					
					if(imgName == null) {
						continue;
					}
					
					dto.setImgName(imgName);
					
					dao.insertData("assignComm.insertCommImg", dto);
				}
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteComm(long num) throws Exception {
		try {
			
			dao.deleteData("assignComm.deleteComm", num);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Community readComm(long num) {
		Community dto = null;
		
		try {
			
			dto = dao.selectOne("assignComm.readComm", num);
			
			dto.setpNum1(dto.getpNum().substring(0, 3));
			dto.setpNum2(dto.getpNum().substring(4, 8));
			dto.setpNum3(dto.getpNum().substring(9));
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return dto;
	}
	
	@Override
	public List<Community> readCommImg(long num) {
		
		List<Community> list = null;
		
		try {
			
			list = dao.selectList("assignComm.readCommImg", num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Community> listComm() {
		
		List<Community> list = null;
		
		try {
			
			list = dao.selectList("assignComm.listComm");
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}

	@Override
	public long listCommCount() {
		
		long count = 0;
		
		try {
			
			count = dao.selectOne("assignComm.listCommCount");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public List<Community> listComm(String userId) {
		
		List<Community> list = null;
		
		try {
			
			list = dao.selectList("assignComm.listCommMyList", userId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public long listCommCount(String userId) {
		
		long count = 0;
		
		try {
			
			count = dao.selectOne("assignComm.listCommCountMyList", userId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return count;
	}
	
	@Override
	public void insertNote(Note note) throws Exception {
		
		try {
			
			dao.insertData("assignComm.insertNote", note);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
