package com.sp.app.commercial;

import java.util.Collections;
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
	public List<Sg_store_top10> list_sg_store_top10(Sg_store_top10 sg) {
		List<Sg_store_top10> list = null;
		String siguNum = sg.getSiguNum();
		try {
			if(siguNum.equals("all")) {
				list = commercialMongo.list_sg_store_top10();
			} else {
				List<Long> dongList = dao.selectList("commercial.dong", siguNum);
				list = commercialMongo.list_sg_store_top10(dongList);
			}
			
			for(int i=0; i<list.size(); i++) {
				Position po = dao.selectOne("commercial.getLongLat_dong", list.get(i).getDongNum());
				if(po != null) {
					list.get(i).setLatitude(po.getLatitude());
					list.get(i).setLongitude(po.getLongitude());
					list.get(i).setDongName(po.getDongName());
				}
			}
			
			if (!siguNum.equals("all")) {
				for (int i = 1; i < list.size(); i++) {
					for (int j = 0; j < list.size() - i; j++) {
						if (list.get(j).getRatio() < list.get(j + 1).getRatio()) {
							Collections.swap(list, j, j + 1);
						}
					}
				}
			}
			if (list.size() > 10) {
				list = list.subList(0, 10);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Sg_sales_top10> list_sg_sales_top10(Sg_sales_top10 sg) {
		List<Sg_sales_top10> list = null;
		String siguNum = sg.getSiguNum();
		try {
			if(siguNum.equals("all")) {
				list = commercialMongo.list_sg_sales_top10();
			} else {
				List<Long> dongList = dao.selectList("commercial.dong", siguNum);
				list = commercialMongo.list_sg_sales_top10(dongList);
			}
			
			for(int i=0; i<list.size(); i++) {
				long chai = list.get(i).getChai();
				if(chai > 0) {
					chai = chai / 100000000 == 0 ? 1 : chai / 100000000;
				} else {
					chai = chai / 100000000 == 0 ? -1 : chai / 100000000;
				}
				list.get(i).setChai(chai);
				Position po = dao.selectOne("commercial.getLongLat_dong", list.get(i).getDongNum());
				if(po != null) {
					list.get(i).setLatitude(po.getLatitude());
					list.get(i).setLongitude(po.getLongitude());
					list.get(i).setDongName(po.getDongName());
				}
			}
			
			if (!siguNum.equals("all")) {
				for (int i = 1; i < list.size(); i++) {
					for (int j = 0; j < list.size() - i; j++) {
						if (list.get(j).getRatio() < list.get(j + 1).getRatio()) {
							Collections.swap(list, j, j + 1);
						}
					}
				}
			}
			if (list.size() > 10) {
				list = list.subList(0, 10);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Sg_float_top10> list_sg_float_top10(Sg_float_top10 sg) {
		List<Sg_float_top10> list = null;
		String siguNum = sg.getSiguNum();
		try {
			if(siguNum.equals("all")) {
				list = commercialMongo.list_sg_float_top10();
			} else {
				List<Long> dongList = dao.selectList("commercial.dong", siguNum);
				list = commercialMongo.list_sg_float_top10(dongList);
			}
			
			for(int i=0; i<list.size(); i++) {
				Position po = dao.selectOne("commercial.getLongLat_dong", list.get(i).getDongNum());
				if(po != null) {
					list.get(i).setLatitude(po.getLatitude());
					list.get(i).setLongitude(po.getLongitude());
					list.get(i).setDongName(po.getDongName());
				}
			}
			
			if (!siguNum.equals("all")) {
				for (int i = 1; i < list.size(); i++) {
					for (int j = 0; j < list.size() - i; j++) {
						if (list.get(j).getRatio() < list.get(j + 1).getRatio()) {
							Collections.swap(list, j, j + 1);
						}
					}
				}
			}
			if (list.size() > 10) {
				list = list.subList(0, 10);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Sg_citizen_top10> list_sg_citizen_top10(Sg_citizen_top10 sg) {
		List<Sg_citizen_top10> list = null;
		String siguNum = sg.getSiguNum();
		try {
			if(siguNum.equals("all")) {
				list = commercialMongo.list_sg_citizen_top10();
			} else {
				List<Long> dongList = dao.selectList("commercial.dong", siguNum);
				list = commercialMongo.list_sg_citizen_top10(dongList);
			}
			
			for(int i=0; i<list.size(); i++) {
				Position po = dao.selectOne("commercial.getLongLat_dong", list.get(i).getDongNum());
				if(po != null) {
					list.get(i).setLatitude(po.getLatitude());
					list.get(i).setLongitude(po.getLongitude());
					list.get(i).setDongName(po.getDongName());
				}
			}
			
			// siguNum이 "all"이 아니면, 정렬해서 줌
			if (!siguNum.equals("all")) {
				for (int i = 1; i < list.size(); i++) {
					for (int j = 0; j < list.size() - i; j++) {
						if (list.get(j).getChai() < list.get(j + 1).getChai()) {
							Collections.swap(list, j, j + 1);
						}
					}
				}
			}
			if (list.size() > 10) {
				list = list.subList(0, 10);
			}
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

	@Override
	public List<Sg_store_top10> list_sg_store_top10(Form form) {
		List<Sg_store_top10> list = null;
		String siguNum = form.getSiguNum();
		try {
			if(siguNum.equals("all")) {
				list = commercialMongo.list_sg_store_top10();
			} else {
				List<Long> dongList = dao.selectList("commercial.dong", siguNum);
				list = commercialMongo.list_sg_store_top10(form, dongList);
			}
			for(int i=0; i<list.size(); i++) {
				Position po = dao.selectOne("commercial.getLongLat_dong", list.get(i).getDongNum());
				if(po != null) {
					list.get(i).setLatitude(po.getLatitude());
					list.get(i).setLongitude(po.getLongitude());
					list.get(i).setDongName(po.getDongName());
				}
			}
			
			if (!siguNum.equals("all")) {
				for (int i = 1; i < list.size(); i++) {
					for (int j = 0; j < list.size() - i; j++) {
						if (list.get(j).getRatio() < list.get(j + 1).getRatio()) {
							Collections.swap(list, j, j + 1);
						}
					}
				}
			}
			if (list.size() > 10) {
				list = list.subList(0, 10);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Sg_sales_top10> list_sg_sales_top10(Form form) {
		List<Sg_sales_top10> list = null;
		String siguNum = form.getSiguNum();
		try {
			if(siguNum.equals("all")) {
				list = commercialMongo.list_sg_sales_top10();
			} else {
				List<Long> dongList = dao.selectList("commercial.dong", siguNum);
				list = commercialMongo.list_sg_sales_top10(form, dongList);
			}
			
			for(int i=0; i<list.size(); i++) {
				long chai = list.get(i).getChai();
				if(chai > 0) {
					chai = chai / 100000000 == 0 ? 1 : chai / 100000000;
				} else {
					chai = chai / 100000000 == 0 ? -1 : chai / 100000000;
				}
				list.get(i).setChai(chai);
				Position po = dao.selectOne("commercial.getLongLat_dong", list.get(i).getDongNum());
				if(po != null) {
					list.get(i).setLatitude(po.getLatitude());
					list.get(i).setLongitude(po.getLongitude());
					list.get(i).setDongName(po.getDongName());
				}
			}
			
			if (!siguNum.equals("all")) {
				for (int i = 1; i < list.size(); i++) {
					for (int j = 0; j < list.size() - i; j++) {
						if (list.get(j).getRatio() < list.get(j + 1).getRatio()) {
							Collections.swap(list, j, j + 1);
						}
					}
				}
			}
			if (list.size() > 10) {
				list = list.subList(0, 10);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Sg_float_top10> list_sg_float_top10(Form form) {

		List<Sg_float_top10> list = null;
		String siguNum = form.getSiguNum();
		try {
			if(siguNum.equals("all")) {
				list = commercialMongo.list_sg_float_top10();
			} else {
				List<Long> dongList = dao.selectList("commercial.dong", siguNum);
				list = commercialMongo.list_sg_float_top10(form, dongList);
			}
			
			for(int i=0; i<list.size(); i++) {
				Position po = dao.selectOne("commercial.getLongLat_dong", list.get(i).getDongNum());
				if(po != null) {
					list.get(i).setLatitude(po.getLatitude());
					list.get(i).setLongitude(po.getLongitude());
					list.get(i).setDongName(po.getDongName());
				}
			}
			
			if (!siguNum.equals("all")) {
				for (int i = 1; i < list.size(); i++) {
					for (int j = 0; j < list.size() - i; j++) {
						if (list.get(j).getRatio() < list.get(j + 1).getRatio()) {
							Collections.swap(list, j, j + 1);
						}
					}
				}
			}
			
			if (list.size() > 10) {
				list = list.subList(0, 10);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Sg_citizen_top10> list_sg_citizen_top10(Form form) {
		List<Sg_citizen_top10> list = null;
		String siguNum = form.getSiguNum();
		try {
			if(siguNum.equals("all")) {
				list = commercialMongo.list_sg_citizen_top10();
			} else {
				List<Long> dongList = dao.selectList("commercial.dong", siguNum);
				list = commercialMongo.list_sg_citizen_top10(form, dongList);
			}
			
			for(int i=0; i<list.size(); i++) {
				Position po = dao.selectOne("commercial.getLongLat_dong", list.get(i).getDongNum());
				if(po != null) {
					list.get(i).setLatitude(po.getLatitude());
					list.get(i).setLongitude(po.getLongitude());
					list.get(i).setDongName(po.getDongName());
				}
			}
			
			if (!siguNum.equals("all")) {
				for (int i = 1; i < list.size(); i++) {
					for (int j = 0; j < list.size() - i; j++) {
						if (list.get(j).getChai() < list.get(j + 1).getChai()) {
							Collections.swap(list, j, j + 1);
						}
					}
				}
			}
			if (list.size() > 10) {
				list = list.subList(0, 10);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Sg_rent_dong_top10> list_sg_rent_dong_top10(String siguNum) {
		List<Sg_rent_dong_top10> list = null;
		
		try {
			if(siguNum.equals("all")) {
				list = commercialMongo.list_sg_rent_dong_top10(siguNum);
			}  else {
				List<Long> dongList = dao.selectList("commercial.dong", siguNum);
				list = commercialMongo.list_sg_rent_dong_top10(dongList);
			}
			
			for(int i=0; i<list.size(); i++) {
				Position po = dao.selectOne("commercial.getLongLat_dong", list.get(i).getDongNum());
				if(po != null) {
					list.get(i).setLatitude(po.getLatitude());
					list.get(i).setLongitude(po.getLongitude());
					list.get(i).setDongName(po.getDongName());
				}
			}
			
			for (int i = 1; i < list.size(); i++) {
				for (int j = 0; j < list.size() - i; j++) {
					if (list.get(j).getQ20223() > list.get(j + 1).getQ20223()) {
						Collections.swap(list, j, j + 1);
					}
				}
			}
			
			if (list.size() > 10) {
				list = list.subList(0, 10);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
