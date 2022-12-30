package com.sp.app.commercial;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("commercial.commercialService")
public class CommercialServiceImpl implements CommercialService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private CommercialMongoOperations commercialMongo;
	
	@Override
	public List<Sg_citizen_top10> list_sg_citizen_top10(Sg_citizen_top10 sg) {
		List<Sg_citizen_top10> list = null;
		try {
			if(sg.getSiguNum().equals("all")) {
				list = commercialMongo.list_sg_citizen_top10();
			} else {
				List<Long> dongList = dao.selectList("commercial.dong", sg.getSiguNum());
				list = commercialMongo.list_sg_citizen_top10(dongList);
			}
			
			for(int i=0; i<list.size(); i++) {
				Position pos = dao.selectOne("commercial.getLongLat_dong", list.get(i).getDongNum());
				if(pos != null) {
					list.get(i).setLatitude(pos.getLatitude());
					list.get(i).setLongitude(pos.getLongitude());
					list.get(i).setDongName(pos.getDongName());
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Sg_store> list_sg_store() {
		List<Sg_store> list = null;
		try {
			list = commercialMongo.list_sg_store();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Position getSiguLatLong(String siguNum) {
		Position pos = null;
		
		try {
			pos = dao.selectOne("commercial.getSiguLatLong", siguNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pos;
	}

}
