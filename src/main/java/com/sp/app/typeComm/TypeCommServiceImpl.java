package com.sp.app.typeComm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("typeComm.TypeCommService")
public class TypeCommServiceImpl implements TypeCommService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertTypeComm(TypeComm dto, String pathname) throws Exception {
		try {
			long seq = dao.selectOne("typeComm.seq");
			dto.setNum(seq);
			
			dao.insertData("typeComm.insertTypeComm", dto);
			
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
					dao.insertData("typeComm.insertFile", dto);

				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
	int result = 0;
		
		try {
			result = dao.selectOne("typeComm.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public TypeComm readTypeComm(long num) {
		TypeComm dto = null;
		
		try {
			dto = dao.selectOne("typeComm.readTypeComm", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			dao.updateData("typeComm.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public TypeComm preReadTypeComm(Map<String, Object> map) {
		TypeComm dto = null;
		
		try {
			dto = dao.selectOne("typeComm.preReadTypeComm", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public TypeComm nextReadTypeComm(Map<String, Object> map) {
		TypeComm dto = null;
		
		try {
			dto = dao.selectOne("typeComm.nextReadTypeComm", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateTypeComm(TypeComm dto, String pathname) throws Exception {
		try {
			dao.updateData("typeComm.updateTypeComm", dto);
			
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
					dao.insertData("typeComm.insertFile", dto);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteTypeComm(long num, String pathname) throws Exception {
		try {
			// 파일 지우기
			List<TypeComm> listFile = listFile(num);
			if (listFile != null) {
				for (TypeComm dto : listFile) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			
			// 파일 테이블의 내용 지우기
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "num");
			map.put("num", num);
			deleteFile(map);
			
			dao.deleteData("typeComm.deleteTypeComm", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<TypeComm> ListTypeComm(Map<String, Object> map) {
		List<TypeComm> list = null;

		try {
			list = dao.selectList("typeComm.listTypeComm", map);	// 여기 !! 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void insertTypeCommLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("typeComm.insertTypeCommLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteTypeCommLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("typeComm.deleteTypeCommLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int typeCommLikeCount(long num) {
		int result = 0;
		
		try {
			result = dao.selectOne("typeComm.typeCommLikeCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public boolean userTypeCommLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			TypeComm dto = dao.selectOne("typeComm.userTypeCommLiked", map);
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
			dao.insertData("typeComm.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list = null;

		try {
			list = dao.selectList("typeComm.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("typeComm.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("typeComm.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertFile(TypeComm dto) throws Exception {
		try {
			dao.insertData("typeComm.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<TypeComm> listFile(long num) {
		List<TypeComm> listFile = null;
		
		try {
			listFile = dao.selectList("typeComm.listFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
 		return listFile;
	}

	@Override
	public TypeComm readFile(long fileNum) {
		TypeComm dto = null;
		
		try {
			dto = dao.selectOne("typeComm.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("typeComm.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<TypeComm> listCategory() throws Exception {
		List<TypeComm> listCategory = null;
		
		try {
			listCategory = dao.selectList("typeComm.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return listCategory;
	}

	@Override
	public List<TypeComm> listJob(String catejobNum) throws Exception {
	List<TypeComm> listJob = null;
		
		try {
			listJob = dao.selectList("typeComm.listJob", catejobNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listJob;
	}
	
}	
