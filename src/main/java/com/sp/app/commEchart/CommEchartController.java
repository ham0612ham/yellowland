package com.sp.app.commEchart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("commEchart.commEchartController")
@RequestMapping("/commEchart/*")
public class CommEchartController {
	@Autowired
	private CommEchartService service;
	
	@RequestMapping(value="zumposu")
	@ResponseBody
	public Map<String, Object> zumposu(@RequestParam long dongNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Long> list = null;
		try {
			list = service.zumposu(dongNum);
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
		model.put("zumposu", list.get(4));
		return model;
	}
	
	@RequestMapping(value="geupsu")
	@ResponseBody
	public Map<String, Object> geupsu(@RequestParam long dongNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Long> list = null;
		try {
			list = service.geupsu(dongNum);
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
	
	@RequestMapping(value="pyeupsu")
	@ResponseBody
	public Map<String, Object> pyeupsu(@RequestParam long dongNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Long> list = null;
		try {
			list = service.geupsu(dongNum);
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
