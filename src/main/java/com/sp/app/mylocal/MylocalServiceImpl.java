package com.sp.app.mylocal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("mylocal.mylocalService")
public class MylocalServiceImpl implements MylocalService{

	@Autowired
	private CommonDAO dao;
	
	@Autowired 
	private FileManager fileManager;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("mylocal.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public List<Mylocal> listMylocal(Map<String, Object> map) throws Exception {
		List<Mylocal>list=null;
		try {
			list = dao.selectList("mylocal.listMylocal", map);	// 여기 !! 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Mylocal readMylocal(long num) {
		Mylocal dto=null;
		try {
			dto = dao.selectOne("mylocal.readMylocal", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			dao.updateData("mylocal.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Mylocal preReadMylocal(Map<String, Object> map) {
		Mylocal dto=null;
		try {
			dto = dao.selectOne("mylocal.preReadMylocal", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Mylocal nextReadMylocal(Map<String, Object> map) {
		Mylocal dto=null;
		try {
			dto = dao.selectOne("mylocal.nextReadMylocal", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateMylocal(Mylocal dto, String pathname) throws Exception {
		try {
		dao.updateData("mylocal.updateMylocal", dto);
		
		if(! dto.getSelectFile().isEmpty()) {
			for (MultipartFile mf : dto.getSelectFile()) {
				String saveFilename = fileManager.doFileUpload(mf, pathname);
				if(saveFilename == null) {
					continue;
				}
				
				String originalFilename = mf.getOriginalFilename();
				long fileSize = mf.getSize();
				
				dto.setOriginalFilename(originalFilename);
				dto.setSaveFilename(saveFilename);
				dto.setFileSize(fileSize);
				
				// insertFile(dto); 
				dao.insertData("mylocal.insertFile", dto);
			}
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		throw e;
		}
		
	}

	@Override
	public void deleteMylocal(long num, String pathname) throws Exception {
		try {
			List<Mylocal>listFile=listFile(num);
			if (listFile != null) {
				for(Mylocal dto:listFile) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "num");
			map.put("num", num);
			deleteFile(map);
			dao.deleteData("mylocal.deleteMylocal",num);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	

	@Override
	public void insertMylocalLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("mylocal.insertMylocalLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteMylocalLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("mylocal.deleteMylocalLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int MylocalLikeCount(long num) {
		int result = 0;		
		try {
			result = dao.selectOne("mylocal.MylocalLikeCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public boolean userMylocalLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			Mylocal dto=dao.selectOne("mylocal.userMylocalLiked", map);
			if(dto != null) {
				result = true; 
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("mylocal.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply>list=null;
		try {
			list = dao.selectList("mylocal.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("mylocal.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("mylocal.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertFile(Mylocal dto) throws Exception {
		try {
			dao.insertData("mylocal.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Mylocal> listFile(long num) {
		List<Mylocal>listFile=null;
		try {
			listFile=dao.selectList("mylocal.listFile",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listFile;
	}

	@Override
	public Mylocal readFile(long fileNum) {
		Mylocal dto=null;
		try {
			dto=dao.selectOne("mylocal.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("mylocal.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
/*
	@Override
	public Mylocal readReply(long num) {
		Mylocal dto=null;
		try {
			dto=dao.selectOne("mylocal.readReply", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}*/

	@Override
	public List<Mylocal> listsigu() throws Exception {
		List<Mylocal>listSigu=null;
		try {
			listSigu = dao.selectList("mylocal.listSigu");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listSigu;
	}

	@Override
	public List<Mylocal> listDong(long siguNum) throws Exception {
		List<Mylocal>listDong=null;
		try {
			listDong=dao.selectList("mylocal.listDong",siguNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listDong;
	}

	@Override
	public void insertMylocal(Mylocal dto, String pathname) throws Exception {
		try {
			long seq=dao.selectOne("localComm.seq");
			dto.setNum(seq);
			dao.insertData("mylocal.insertMylocal", dto);
			
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
					dto.setFileSize(fileSize);
					
					// 파일 인서트 insertFile(dto);
					dao.insertData("mylocal.insertFile", dto);
						}
					}
				} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	

}
