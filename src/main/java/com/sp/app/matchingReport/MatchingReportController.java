package com.sp.app.matchingReport;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("matchingReport.matchingReportController")
@RequestMapping("/matchingReport/*")

public class MatchingReportController {
	
	@Autowired
	private MatchingReportService service;
	
	@RequestMapping(value="yongdoArea")
	@ResponseBody
	public Map<String, Object> yongdoArea(@RequestParam long siguNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Map<String,Object>> data = new ArrayList<>();
		List<Long> list = new ArrayList<Long>();
		Map<String, Object> map = null;
		String most = "";
		String [] name = {"주거지역","상업지역","녹지지역"};
		
		try {
			list = service.yongdoArea(siguNum);
			List<String> list2 = service.yongdoAreamost(list);
			most = list2.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(int i=0; i<3; i++) {
			map = new HashMap<>();
			map.put("value", list.get(i));
			map.put("name", name[i]);
			
			data.add(map);
		}
		model.put("data", data);
		model.put("most", most);
		
		return model;
	}
	
	@RequestMapping(value="milzipdo")
	@ResponseBody
	public Map<String, Object> milzipdo(@RequestParam long dongNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Map<String, Object>> data = new ArrayList<>();
		List<Long> list = new ArrayList<Long>();
		Map<String, Object> map = null;
		String up = "";
		String most = "";
		String[] name = {"외식업","서비스업","소매업"};
		try {
			list = service.milzipdo(dongNum);
			List<String> list2 = service.milzipdoup(list);
			up = list2.get(0);
			most = list2.get(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(int i=0; i<3; i++) {
			map = new HashMap<>();
			map.put("value", list.get(i));
			map.put("name", name[i]);
			
			data.add(map);
		}
		model.put("data", data);
		model.put("up", up);
		model.put("most", most);
		
		return model;
	}
	@RequestMapping(value="jumpo")
	@ResponseBody
	public Map<String, Object> jumpo(@RequestParam long dongNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Long> list = null;
		try {
			list = service.jumpo(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Object> series = new ArrayList<>();
		Map<String, Object> map;
		Map<String, Object> colorMap;
		String color = "";
		
		List<Map<String, Object>> data = new ArrayList<>();
		
		for(int i=0; i<list.size(); i++) {
			map = new HashMap<>();
			map.put("value", list.get(i));
			
			colorMap = new HashMap<>();
			color = i < 4 ?  "#A9A9A9" : "#36C88A";
			colorMap.put("color", color);
			
			map.put("itemStyle", colorMap);
			
			data.add(map);
		}
		map = new HashMap<>();
		map.put("data", data);
		
		map.put("type", "bar");
		series.add(map);
		
		model.put("series", series);
		model.put("su", list.get(4));
		model.put("quart", list.get(4)-list.get(3));
		model.put("year", list.get(4)-list.get(0));
		
		return model;
	}
	
}
