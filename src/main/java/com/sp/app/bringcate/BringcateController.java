package com.sp.app.bringcate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("bringcate.bringcateController")
@RequestMapping(value = "/bringcate/*")
public class BringcateController {
	@Autowired
	BringcateService service;
	
	@PostMapping("categoryJob")
	@ResponseBody
	public Map<String, Object> categoryJobList() {
		Map<String, Object> model = new HashMap<>();
		List<Bringcate> list = null;
		
		try {
			list = service.categoryJob();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("categoryJobList", list);
		return model;
	}
	
	@PostMapping("job")
	@ResponseBody
	public Map<String, Object> jobList(@RequestParam String cateJobNum) {
		Map<String, Object> model = new HashMap<>();
		List<Bringcate> list = null;
		
		try {
			list = service.job(cateJobNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("jobList", list);
		return model;
	}
	
	@PostMapping("categoryGu")
	@ResponseBody
	public Map<String, Object> categoryGuList() {
		Map<String, Object> model = new HashMap<>();
		List<Bringcate> list = null;
		
		try {
			list = service.categoryGu();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("siguList", list);
		return model;
	}
	
	@PostMapping("dong")
	@ResponseBody
	public Map<String, Object> dongList(@RequestParam String categoryGu) {
		Map<String, Object> model = new HashMap<>();
		List<Bringcate> list = null;
		
		try {
			list = service.dong(categoryGu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("dongList", list);
		
		return model;
	}
}
