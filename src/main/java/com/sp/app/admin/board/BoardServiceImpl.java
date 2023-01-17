package com.sp.app.admin.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;
import com.sp.app.localComm.LocalComm;
@Service("admin.board.boardService")
public class BoardServiceImpl  implements BoardService{

	@Autowired 
	private CommonDAO dao;
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("board.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		List<Board>list=null;
		
		try {
			list=dao.selectList("board.listBoard",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Board readBoard(long num) {
		Board dto=null;
		try {
			dto=dao.selectOne("board.readBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Board preReadBoard(Map<String, Object> map) {
		Board dto=null;
		try {
			dto=dao.selectOne("board.preReadBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Board nextReadBoard(Map<String, Object> map) {
		Board dto=null;
		try {
			dto=dao.selectOne("board.nextReadBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void deleteBoard(long num) throws Exception {
		try {
			dao.deleteData("board.deleteBoard",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
/*
	@Override
	public Board readAnswer(long num) {
		Board dto=null;
		try {
			dto=dao.selectOne("board.readAnswer", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
*/
	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			dao.updateData("board.updateHitCount",num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int BoardLikeCount(long num) {
		int result=0;
		try {
			result=dao.selectOne("board.BoardLikeCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply>list =null;
		try {
			list=dao.selectList("board.listReply",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("board.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("board.deleteReply",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Board> listSigu() throws Exception {
		List<Board>listSigu=null;
		try {
			listSigu=dao.selectList("board.listSigu");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listSigu;
	}

	@Override
	public List<Board> listDong(long siguNum) throws Exception {
		List<Board> listDong =null;
		try {
			listDong=dao.selectList("board.listDong",siguNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listDong;
	}

	@Override
	public List<Board> listFile(long num) {
		List<Board>listFile=null;
		
		try {
			listFile=dao.selectList("board.listFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listFile;
	}

	@Override
	public Board readFile(long fileNum) {
		Board dto=null;
		try {
			dto=dao.selectOne("board.readFile",fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("board.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertBoardLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("board.insertBoardLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteBoardLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("board.deleteBoardLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public boolean userBoardLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			LocalComm dto = dao.selectOne("board.userBoardLiked", map);
			if(dto != null) {
				result = true; 
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}