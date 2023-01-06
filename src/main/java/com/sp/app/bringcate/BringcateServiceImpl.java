package com.sp.app.bringcate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service(value = "bringcate.bringcateService")
public class BringcateServiceImpl implements BringcateService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Bringcate> categoryJob() throws Exception {
		List<Bringcate> list = null;
		
		try {
			list = dao.selectList("bringcate.categoryJob");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Bringcate> job(String cateJobNum) throws Exception {
		List<Bringcate> list = null;
		
		try {
			if(cateJobNum.equals("all")) {
				list = dao.selectList("bringcate.allJob");
			} else {
				list = dao.selectList("bringcate.job", cateJobNum);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Bringcate> categoryGu() throws Exception {
		List<Bringcate> list = null;
		
		try {
			list = dao.selectList("bringcate.categoryGu");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Bringcate> dong(String siguNum) throws Exception {
		List<Bringcate> list = null;
		
		try {
			list = dao.selectList("bringcate.dong", siguNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
}
