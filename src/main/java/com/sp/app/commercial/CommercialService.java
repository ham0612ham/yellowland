package com.sp.app.commercial;

import java.util.List;

public interface CommercialService {
	// 서울시 전체 TOP10 : 점포수, 매출, 유동인구, 주거인구 모두 전체
	public List<Sg_store_top10> list_sg_store_top10(Form form);
	public List<Sg_sales_top10> list_sg_sales_top10(Form form);
	public List<Sg_float_top10> list_sg_float_top10(Form form);
	public List<Sg_citizen_top10> list_sg_citizen_top10(Form form);
	public List<Sg_store_top10> list_sg_store_top10(Sg_store_top10 sg);
	public List<Sg_sales_top10> list_sg_sales_top10(Sg_sales_top10 sg);
	public List<Sg_float_top10> list_sg_float_top10(Sg_float_top10 sg);
	public List<Sg_citizen_top10> list_sg_citizen_top10(Sg_citizen_top10 sg);
	public List<Sg_rent_dong_top10> list_sg_rent_dong_top10(String siguNum);
	public Position getSiguLatLong(String siguNum);
}
