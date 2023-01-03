package com.sp.app.commEchart;

import java.util.ArrayList;
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

	@Override
	public List<Long> upzongbunpo(long dongNum) {
		List<Long> list = null;
		try {
			list = commEchartMongo.upzongbunpo(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<String> upzongbunpo_up(List<Long> list) {
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
	public List<Long> mechulak(long dongNum) {
		List<Long> list = null;
		try {
			list = commEchartMongo.mechulak(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Long> mechulgunsu(long dongNum) {
		List<Long> list = null;
		try {
			list = commEchartMongo.mechulgunsu(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Double> yoilbyulMuchul(long dongNum) {
		List<Double> list = null;
		
		try {
			list = commEchartMongo.yoilbyulMuchul(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Double> sigandebuelMechul(long dongNum) {
		List<Double> list = null;
		
		try {
			list = commEchartMongo.sigandebuelMechul(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Double> sungbuelMechul(long dongNum) {
		List<Double> list = null;
		
		try {
			list = commEchartMongo.sungbuelMechul(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Double> sungbuelMechulThree(long dongNum) {
		List<Double> list = null;
		
		try {
			list = commEchartMongo.sungbuelMechulThree(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Double> yoenryungbyulMechul(long dongNum) {
		List<Double> list = null;
		
		try {
			list = commEchartMongo.yoenryungbyulMechul(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Double> sungbyulYoenryungbyulYudongingu(long dongNum) {
		List<Double> list = null;
		
		try {
			list = commEchartMongo.sungbyulYoenryungbyulYudongingu(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Long> gugeoinguSu(long dongNum) {
		List<Long> list = null;
		
		try {
			list = commEchartMongo.gugeoinguSu(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
