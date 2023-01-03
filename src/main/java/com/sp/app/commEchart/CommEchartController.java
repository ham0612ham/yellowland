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
			list = service.pyeupsu(dongNum);
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
	
	@RequestMapping(value="upzongbunpo")
	@ResponseBody
	public Map<String, Object> upzongbunpo(@RequestParam long dongNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Map<String, Object>> data = new ArrayList<>();
		List<Long> list = new ArrayList<Long>();
		Map<String, Object> map = null;
		String up = "";
		String most = "";
		String[] name = {"외식업","서비스업","소매업"};
		try {
			list = service.upzongbunpo(dongNum);
			List<String> list2 = service.upzongbunpo_up(list);
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
	
	@RequestMapping(value="mechulak")
	@ResponseBody
	public Map<String, Object> mechulak(@RequestParam long dongNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Long> list = null;
		try {
			list = service.mechulak(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("dong", list.subList(0, 5));
		model.put("sigu", list.subList(5, 10));
		model.put("seoul", list.subList(6, 15));
		model.put("ave", list.get(4)/10000);
		model.put("yChai", (list.get(4)-list.get(9))/10000);
		model.put("qChai", (list.get(4)-list.get(3))/10000);
		
		return model;
	}
	
	@RequestMapping(value="mechulgunsu")
	@ResponseBody
	public Map<String, Object> mechulgunsu(@RequestParam long dongNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Long> list = null;
		try {
			list = service.mechulgunsu(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("dong", list.subList(0, 5));
		model.put("sigu", list.subList(5, 10));
		model.put("seoul", list.subList(6, 15));
		model.put("ave", list.get(4));
		model.put("yChai", (list.get(4)-list.get(9)));
		model.put("qChai", (list.get(4)-list.get(3)));
		
		return model;
	}

	@RequestMapping(value="yoilbyulMuchul")
	@ResponseBody
	public Map<String, Object> yoilbyulMuchul(@RequestParam long dongNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Double> list = null;
		try {
			list = service.yoilbyulMuchul(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Object> series = new ArrayList<>();
		Map<String, Object> map;
		Map<String, Object> colorMap;
		String color = "";
		
		List<Map<String, Object>> data = new ArrayList<>();

		int max = 0;
		for(int j=0; j<list.size()-1; j++) {
			max = list.get(max) > list.get(j+1) ? max : j+1;
		}
		
		for(int i=0; i<list.size(); i++) {
			map = new HashMap<>();
			map.put("value", list.get(i));
			
			colorMap = new HashMap<>();
			color = i == max ? "#36C88A" : "#A9A9A9";
			colorMap.put("color", color);
			
			map.put("itemStyle", colorMap);
			
			data.add(map);
		}
		map = new HashMap<>();
		map.put("data", data);
		
		map.put("type", "bar");
		series.add(map);
		model.put("series", series);
		model.put("yoil", max);
		
		return model;
	}
	
	@RequestMapping(value="sigandebuelMechul")
	@ResponseBody
	public Map<String, Object> sigandebuelMechul(@RequestParam long dongNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Double> list = null;
		try {
			list = service.sigandebuelMechul(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int max = 0;
		for(int j=0; j<list.size()-1; j++) {
			max = list.get(max) > list.get(j+1) ? max : j+1;
		}
		
		model.put("data", list);
		model.put("sigan", max);
		
		return model;
	}
	
	@RequestMapping(value="sungbuelMechul")
	@ResponseBody
	public Map<String, Object> sungbuelMechul(@RequestParam long dongNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Double> list = null;
		try {
			list = service.sungbuelMechul(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int max = 0;
		for(int j=0; j<list.size()-1; j++) {
			max = list.get(max) > list.get(j+1) ? max : j+1;
		}
		
		model.put("male", list.get(0));
		model.put("female", list.get(1));
		model.put("gender", max);
		model.put("percent", list.get(max));
		
		return model;
	}
	
	@RequestMapping(value="sungbuelMechulThree")
	@ResponseBody
	public Map<String, Object> sungbuelMechulThree(@RequestParam long dongNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Double> list = null;
		try {
			list = service.sungbuelMechulThree(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.put("maleFood", list.get(0));
		model.put("femaleFood", list.get(1));
		model.put("maleService", list.get(2));
		model.put("femaleService", list.get(3));
		model.put("maleRetail", list.get(4));
		model.put("femaleRetail", list.get(5));
		
		return model;
	}

	@RequestMapping(value="yoenryungbyulMechul")
	@ResponseBody
	public Map<String, Object> yoenryungbyulMechul(@RequestParam long dongNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Double> list = null;
		try {
			list = service.yoenryungbyulMechul(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Object> series;
		Map<String, Object> map;
		Map<String, Object> colorMap;
		String color = "";
		
		List<Map<String, Object>> data;
		
		// 전체 최대
		int max = 0;
		for(int j=0; j<list.size()-1; j++) {
			max = list.get(max) > list.get(j+1) ? max : j+1;
		}
		
		for(int n=1; n<=3; n++) {
			series = new ArrayList<>();
			data = new ArrayList<>();
			// 카테고리별 최대
			int maxi = 0;
			for(int j=6*(n-1); j<6*n-1; j++) {
				maxi = list.get(maxi) > list.get(j+1) ? maxi : j+1;
			}
			
			for(int i=6*(n-1); i<6*n; i++) {
				map = new HashMap<>();
				map.put("value", list.get(i));
				
				colorMap = new HashMap<>();
				color = i == maxi ? "#36C88A" : "#A9A9A9";
				colorMap.put("color", color);
				
				map.put("itemStyle", colorMap);
				
				data.add(map);
			}
			
			map = new HashMap<>();
			map.put("data", data);
			
			map.put("type", "bar");
			series.add(map);
			model.put("series"+n, series);
		}
		
		model.put("cate", max/6);
		model.put("age", max%6);
		model.put("percent", list.get(max));
		
		return model;
	}	
	
	@RequestMapping(value="sungbyulYoenryungbyulYudongingu")
	@ResponseBody
	public Map<String, Object> sungbyulYoenryungbyulYudongingu(@RequestParam long dongNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Double> list = null;
		try {
			list = service.sungbyulYoenryungbyulYudongingu(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int max = 0;
		for(int j=0; j<list.size()-1; j++) {
			max = list.get(max) > list.get(j+1) ? max : j+1;
		}
		
		model.put("male", list.subList(0, 6));
		model.put("female", list.subList(6, 12));
		model.put("gender", max/6);
		model.put("age", max%6);
		model.put("percent", list.get(max));
		
		return model;
	}
	
	@RequestMapping(value="gugeoinguSu")
	@ResponseBody
	public Map<String, Object> gugeoinguSu(@RequestParam long dongNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Long> list = null;
		try {
			list = service.gugeoinguSu(dongNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("dong", list.subList(0, 5));
		model.put("sigu", list.subList(5, 10));
		model.put("seoul", list.subList(6, 15));
		model.put("ingu", list.get(4));
		model.put("yChai", (list.get(4)-list.get(9))/10000);
		model.put("qChai", (list.get(4)-list.get(3))/10000);
		
		return model;
	}
	
	@RequestMapping(value="graph1Chart")
	@ResponseBody
	public Map<String, Object> graph1Chart(@RequestParam String siguNum,
			@RequestParam String cateJobNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Long> result = new ArrayList<Long>();
		
		try {
			result = service.graph1Chart(siguNum, cateJobNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("total1", result.get(0));
		model.put("normal", result.get(0)-result.get(1));
		model.put("fran", result.get(1));
		model.put("total2", result.get(2));
		model.put("total3", result.get(3));

		return model;
	}

	@RequestMapping(value="graph2Chart")
	@ResponseBody
	public Map<String, Object> graph2Chart(@RequestParam String siguNum,
			@RequestParam String cateJobNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Long> result = new ArrayList<Long>();
		
		try {
			result = service.graph2Chart(siguNum, cateJobNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("thisQ", result.get(0));
		model.put("quartB", result.get(1));
		model.put("yearB", result.get(2));
		
		return model;
	}
	
	@RequestMapping(value="graph3Chart")
	@ResponseBody
	public Map<String, Object> graph3Chart(@RequestParam String siguNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Object> result = new ArrayList<Object>();
		
		try {
			result = service.graph3Chart(siguNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("source", result);
		
		return model;
	}
}
