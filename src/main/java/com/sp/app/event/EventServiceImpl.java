package com.sp.app.event;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("event.eventService")
public class EventServiceImpl implements EventService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public int dataCount() {
		int result = 0;
		
		try {
			result = dao.selectOne("event.dataCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertEvent(Event dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				dto.setImageFilename(saveFilename);
				dao.insertData("event.insertEvent", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Event> listEvent(Map<String, Object> map) {
		List<Event> list = null;
		
		try {
			list = dao.selectList("event.listEvent", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Event readEvent(long num) {
		Event dto = null;
		try {
			dto = dao.selectOne("event.readEvent", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Event preReadEvent(Map<String, Object> map) {
		Event dto = null;
		
		try {
			dto = dao.selectOne("event.preReadEvent", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Event nextReadEvent(Map<String, Object> map) {
		Event dto = null;
		
		try {
			dto = dao.selectOne("event.nextReadEvent", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateEvent(Event dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			
			if(saveFilename != null) {
				if(dto.getImageFilename().length() != 0) {
					fileManager.doFileDelete(dto.getImageFilename(), pathname);
				}
				dto.setImageFilename(saveFilename);
			}
			dao.updateData("event.updateEvent", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteEvent(long num, String pathname) throws Exception {
		try {
			if(pathname != null) {
				fileManager.doFileDelete(pathname);
			}
			dao.deleteData("event.deleteEvent", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
