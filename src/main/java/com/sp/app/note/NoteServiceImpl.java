package com.sp.app.note;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("note.noteService")
public class NoteServiceImpl implements NoteService {
	@Autowired
	CommonDAO dao;

	@Override
	public List<Note> listFriend(Map<String, Object> map) {
		List<Note> list = null;

		try {
			list = dao.selectList("note.listFriend", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void insertNote(Note dto) throws Exception {
		try {
			for (String receiver : dto.getReceivers()) {
				dto.setReceiverId(receiver);
				dao.insertData("note.insertNote", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCountReceive(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("note.dataCountReceive", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Note> listReceive(Map<String, Object> map) {
		List<Note> list = null;

		try {
			list = dao.selectList("note.listReceive", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCountSend(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("note.dataCountSend", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Note> listSend(Map<String, Object> map) {
		List<Note> list = null;

		try {
			list = dao.selectList("note.listSend", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Note readReceive(long num) {
		Note dto = null;

		try {
			dto = dao.selectOne("note.readReceive", num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Note preReadReceive(Map<String, Object> map) {
		Note dto = null;

		try {
			dto = dao.selectOne("note.preReadReceive", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Note nextReadReceive(Map<String, Object> map) {
		Note dto = null;

		try {
			dto = dao.selectOne("note.nextReadReceive", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Note readSend(long num) {
		Note dto = null;

		try {
			dto = dao.selectOne("note.readSend", num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Note preReadSend(Map<String, Object> map) {
		Note dto = null;

		try {
			dto = dao.selectOne("note.preReadSend", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Note nextReadSend(Map<String, Object> map) {
		Note dto = null;

		try {
			dto = dao.selectOne("note.nextReadSend", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateIdentifyDay(long num) throws Exception {
		try {
			dao.updateData("note.updateIdentifyDay", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteNote(Map<String, Object> map) throws Exception {
		try {
			// 삭제(삭제상태로 된경우에는 글을 삭제)
			dao.deleteData("note.deleteNote", map);

			// 삭제 상태가 아닌 경우는 삭제 상태로 수정
			dao.updateData("note.updateDeleteState", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void deleteOneNote(Map<String, Object> map) throws Exception {
		try {
			// 삭제(삭제상태로 된경우에는 글을 삭제)
			dao.deleteData("note.deleteOneNote", map);
			
			// 삭제 상태가 아닌 경우는 삭제 상태로 수정
			dao.updateData("note.updateDeleteOneState", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int newNoteCount(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("note.newNoteCount", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public int countUnreadMessage(String userId) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("note.countMessage", userId);
		} catch (Exception e) {
		}
		return result;
	}

}
