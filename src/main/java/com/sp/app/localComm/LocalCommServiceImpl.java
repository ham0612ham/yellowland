package com.sp.app.localComm;

import java.util.HashMap;
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
			long seq = dao.selectOne("localComm.seq");
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
					dto.setFileSize(fileSize);
					
					// 파일 인서트 insertFile(dto);
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
			list = dao.selectList("localComm.listLocalComm", map);	// 여기 !! 
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
		int result = 0;
		
		try {
			result = dao.selectOne("localComm.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public LocalComm readLocalComm(long num) {
		LocalComm dto = null;
		
		try {
			dto = dao.selectOne("localComm.readLocalComm", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			dao.updateData("localComm.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public LocalComm preReadLocalComm(Map<String, Object> map) {
		LocalComm dto = null;
		
		try {
			dto = dao.selectOne("localComm.preReadLocalComm", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public LocalComm nextReadLocalComm(Map<String, Object> map) {
		LocalComm dto = null;
		
		try {
			dto = dao.selectOne("localComm.nextReadLocalComm", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateLocalComm(LocalComm dto, String pathname) throws Exception {
		try {
			dao.updateData("localComm.updateLocalComm", dto);
			
			if( ! dto.getSelectFile().isEmpty()) {
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
					dao.insertData("localComm.insertFile", dto);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteLocalComm(long num, String pathname) throws Exception {
		try {
			// 파일 지우기
			List<LocalComm> listFile = listFile(num);
			if (listFile != null) {
				for (LocalComm dto : listFile) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			
			// 파일 테이블의 내용 지우기
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "num");
			map.put("num", num);
			deleteFile(map);
			
			dao.deleteData("localComm.deleteLocalComm", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertLocalCommLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("localComm.insertLocalCommLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteLocalCommLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("localComm.deleteLocalCommLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int localCommLikeCount(long num) {
		int result = 0;
		
		try {
			result = dao.selectOne("localComm.localCommLikeCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public boolean userLocalCommLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			LocalComm dto = dao.selectOne("localComm.userLocalCommLiked", map);
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
			dao.insertData("localComm.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list = null;

		try {
			list = dao.selectList("localComm.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
	int result = 0;
		
		try {
			result = dao.selectOne("localComm.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("localComm.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public void insertFile(LocalComm dto) throws Exception {
		try {
			dao.insertData("localComm.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	@Override
	public List<LocalComm> listFile(long num) {
		List<LocalComm> listFile = null;
		
		try {
			listFile = dao.selectList("localComm.listFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
 		return listFile;
	}


	@Override
	public LocalComm readFile(long fileNum) {
		LocalComm dto = null;
		
		try {
			dto = dao.selectOne("localComm.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}


	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("localComm.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	@Override
	public int localCommReplyCount(long num) {
		int result = 0;

		try {
			result = dao.selectOne("localComm.replyCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}


}
