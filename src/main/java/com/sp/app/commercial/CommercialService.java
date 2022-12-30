package com.sp.app.commercial;

import java.util.List;

public interface CommercialService {
	// 서울시 전체 TOP10 : 점포수, 매출, 유동인구, 주거인구 모두 전체
	public List<Sg_citizen_top10> list_sg_citizen_top10(Sg_citizen_top10 sg);
	
	public List<Sg_store> list_sg_store();
	
	public Position getSiguLatLong(String siguNum);
}
