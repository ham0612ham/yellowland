package com.sp.app.myType;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("myType.myTypeService")
public class MyTypeServiceImpl implements MyTypeService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired 
	private FileManager fileManager;
	@Override
	public void insertMYType(MyType dto, String pathname) throws Exception {
		try {
			long seq = dao.selectOne("typeComm.seq");
			dto.setNum(seq);
			
			dao.insertData("myType.insertMYType", dto);
			
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
					dao.insertData("myType.insertFile", dto);

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
			result = dao.selectOne("myType.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public MyType readMYType(long num) {
		MyType dto=null;
		try {
			dto = dao.selectOne("myType.readMYType", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			dao.updateData("myType.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public MyType preReadMYType(Map<String, Object> map) {
		MyType dto=null;
		try {
			dto = dao.selectOne("myType.preReadMYType", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public MyType nextReadMYType(Map<String, Object> map) {
		MyType dto=null;
		try {
			dto = dao.selectOne("myType.nextReadMYType", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateMYType(MyType dto, String pathname) throws Exception {
		try {
			dao.updateData("myType.updateMYType", dto);
			
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
					dao.insertData("myType.insertFile", dto);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteMYType(long num, String pathname) throws Exception {
		try {
		List<MyType>listFile=listFile(num);
		if (listFile != null) {
			for (MyType dto : listFile) {
				fileManager.doFileDelete(dto.getSaveFilename(), pathname);
			}
		}
		
		// 파일 테이블의 내용 지우기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("field", "num");
		map.put("num", num);
		deleteFile(map);
		
		dao.deleteData("myType.deleteMYType", num);
	} catch (Exception e) {
		e.printStackTrace();
		throw e;
	}
}

	@Override
	public List<MyType> listTypeComm(Map<String, Object> map) {
		List<MyType>list=null;
		try {
			list = dao.selectList("myType.listMYType", map);	// 여기 !! 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void insertTypeCommLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("myType.insertTypeCommLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteTypeCommLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("myType.deleteTypeCommLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int typeCommLikeCount(long num) {
		int result = 0;
		
		try {
			result = dao.selectOne("myType.typeCommLikeCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public boolean userTypeCommLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			MyType dto = dao.selectOne("myType.userTypeCommLiked", map);
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
			dao.insertData("myType.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply>list=null;
		try {
			list = dao.selectList("myType.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("myType.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("myType.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertFile(MyType dto) throws Exception {
		try {
			dao.insertData("myType.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<MyType> listFile(long num) {
		List<MyType>listFile=null;
		try {
			listFile = dao.selectList("myType.listFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
 		return listFile;
	}

	@Override
	public MyType readFile(long fileNum) {
		MyType dto=null;
		try {
			dto = dao.selectOne("myType.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("myType.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<MyType> listCategory() throws Exception {
		List<MyType>listCategory=null;
		try {
			listCategory = dao.selectList("myType.listCategory");	// 여기 !! 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listCategory;
	}

	@Override
	public List<MyType> listJob(String catejobNum) throws Exception {
		List<MyType>listJob=null;
		try {
			listJob = dao.selectList("myType.listJob", catejobNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listJob;
	}

}
