package com.sp.app.admin.type;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;
@Service("admin.type.typeService")
public class TypeServiceImpl implements TypeService{

	@Autowired 
	private CommonDAO dao;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("type.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<TypeComm> listType(Map<String, Object> map) {
		List<TypeComm>list=null;
		try {
			list=dao.selectList("type.listType", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public TypeComm readType(long num) throws Exception {
		TypeComm dto=null;
		try {
			dto=dao.selectOne("type.readType", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public TypeComm preReadType(Map<String, Object> map) {
		TypeComm dto=null;
		try {
			dto=dao.selectOne("type.preReadType", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public TypeComm nextReadType(Map<String, Object> map) {
		TypeComm dto=null;
		try {
			dto=dao.selectOne("type.nextReadType", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void deleteType(long num) throws Exception {
		try {
			dao.deleteData("type.deleteType", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
/*
	@Override
	public TypeComm readAnswer(long num) {
		TypeComm dto=null;
		try {
			dto=dao.selectOne("type.readAnswer", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
*/
	/*
	@Override
	public void insertTypeCommLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void deleteTypeCommLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}
*/
	@Override
	public int typeCommLikeCount(long num) {
		int result=0;
		try {
			result=dao.selectOne("type.typeCommLikeCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean userTypeCommLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			TypeComm dto=dao.selectOne("type.userTypeCommLiked", map);
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
			dao.insertData("type.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply>list=null;
		try {
			list=dao.selectList("type.listReply",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("type.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("type.deleteReply",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	

	@Override
	public List<TypeComm> listFile(long num) {
		List<TypeComm>listFile=null;
		try {
			listFile=dao.selectOne("type.readFile",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listFile;
	}

	@Override
	public TypeComm readFile(long fileNum) {
		TypeComm dto=null;
		try {
			dto=dao.selectOne("type.readFile",fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			dao.updateData("type.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertTypeCommLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("type.insertTypeCommLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteTypeCommLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("type.deleteTypeCommLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	

}
