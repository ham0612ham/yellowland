package com.sp.app.commEchart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("commEchart.commEchartService")
public class CommEchartServiceImpl implements CommEchartService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private CommEchartMongoOperations commEchartMongo;

	@Override
	public List<Long> zumposu(long dongNum) {
		List<Long> list = null;
		
		try {
			list = commEchartMongo.zumposu(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Long> geupsu(long dongNum) {
		List<Long> list = null;
		
		try {
			list = commEchartMongo.geupsu(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Long> pyeupsu(long dongNum) {
		List<Long> list = null;
		
		try {
			list = commEchartMongo.pyeupsu(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
