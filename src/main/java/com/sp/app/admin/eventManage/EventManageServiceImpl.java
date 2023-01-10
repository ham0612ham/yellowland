package com.sp.app.admin.eventManage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service(".admin.eventManage.eventManageService")
public class EventManageServiceImpl implements EventManageService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;


	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("eventManage.dataCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Event> listEvent(Map<String, Object> map) {
		List<Event> list = null;
		String todayfm = new SimpleDateFormat("yyyy.MM.dd").format(new Date(System.currentTimeMillis()));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		
		try {
			list = dao.selectList("eventManage.listEvent", map);
			Event dto = null;
			
			Date today = new Date(sdf.parse(todayfm).getTime());
			Date date1 = null;
			Date date2 = null;
			int compare1 = 0;
			int compare2 = 0;
			for(int i=0; i<list.size(); i++) {
				dto = list.get(i);
				date1 = new Date(sdf.parse(dto.getStaDate()).getTime());
				date2 = new Date(sdf.parse(dto.getEndDate()).getTime());
				compare1 = date1.compareTo(today);
				compare2 = date2.compareTo(today);
				
				if(dto.getEnable() == 1 && compare1 <= 0 && compare2 >= 0) {
					dto.setExpired(0);
				} else {
					dto.setExpired(1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Event readEvent(long num) {
		Event dto = null;
		
		try {
			dto = dao.selectOne("eventManage.readEvent", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Event preReadEvent(Map<String, Object> map) {
		Event dto = null;
		try {
			dto = dao.selectOne("eventManage.preReadEvent", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Event nextReadEvent(Map<String, Object> map) {
		Event dto = null;
		
		try {
			dto = dao.selectOne("eventManage.nextReadEvent", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertEvent(Event dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if(saveFilename != null) {
				dto.setImageFilename(saveFilename);
				dao.insertData("eventManage.insertEvent", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
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
			dao.updateData("eventManage.updateEvent", dto);
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
			dao.deleteData("eventManage.deleteEvent", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int eventLikeCount(long num) {
		int result = 0;
		
		try {
			result = dao.selectOne("eventManage.eventLikeCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
