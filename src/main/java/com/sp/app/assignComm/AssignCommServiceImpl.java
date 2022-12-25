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
	public void updateComm(Community dto) throws Exception {
		try {
			
			dao.updateData("assignComm.updateComm", dto);
			
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
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return dto;
	}

	@Override
	public List<Community> listComm() {
		List<Community> list = null;
		
		try {
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}

}
