package com.sp.app.matchingReport;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("matchingReport.matchingReportService")
public class MatchingReportServiceImpl implements MatchingReportService {
	@Autowired 
	private CommonDAO dao;
	
	@Autowired
	private MatchingReportMongoOperations matchingReportMongo;

	@Override
	public List<Long> yongdoArea(long siguNum) {
		List<Long> list = null;
		try {
			list = matchingReportMongo.yongdoArea(siguNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return list;
	}

	@Override
	public List<Long> milzipdo(long dongNum) {
		List<Long> list = null;
		try {
			list = matchingReportMongo.milzipdo(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<String> milzipdoup(List<Long> list) {
		List<String> list2 = new ArrayList<String>();
		String up = "";
		String most = "";
		if(list.size() == 6) {
			long cs1 = list.get(0) - list.get(3);
			long cs2 = list.get(1) - list.get(4);
			long cs3 = list.get(2) - list.get(5);
			
			if(cs1 > cs2 && cs1 > cs3) up = "외식업";
			else if(cs2 > cs1 && cs2 > cs3) up = "서비스업";
			else up = "소매업";
			list2.add(up);
			
			if(list.get(0) > list.get(1) && list.get(0) > list.get(2)) most = "외식업";
			else if(list.get(1) > list.get(0) && list.get(1) > list.get(2)) most = "서비스업";
			else most = "소매업";
			list2.add(most);
		}
		return list2;
}

	@Override
	public List<Long> jumpo(long dongNum) {
		List<Long> list = null;
		
		try {
			list = matchingReportMongo.jumpo(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}			

	@Override
	public List<String> yongdoAreamost(List<Long> list) {
		List<String> list2 = new ArrayList<String>();
		String most = "";
		if(list.size() == 3) {
			if(list.get(0) > list.get(1) && list.get(0) > list.get(2)) most = "주거지역";
			else if(list.get(1) > list.get(0) && list.get(1) > list.get(2)) most = "상업지역";
			else most = "녹지지역";
			list2.add(most);
		}
		return list2;
}


}