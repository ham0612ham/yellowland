package com.sp.app.echart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("echart.chartController")
@RequestMapping("/echart/*")
public class ChartController {
	@RequestMapping(value="main")
	public String main() throws Exception {
		return "echart/main";
	}
	
	@RequestMapping(value="population")
	@ResponseBody
	public Map<String, Object> population() throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> map;
		map = new HashMap<>();
		map.put("type", "line");
		map.put("data", new double[]{-0.9,1.0,6.3,13.3,18.9,23.6,25.8,26.3,22.4,15.5,8.9,1.6});

		list.add(map);
		
		model.put("series", list); // 차트를 작성할 연속된 값(시어리즈 값)
		
		return model;
	}
	
	@RequestMapping(value="line1")
	@ResponseBody
	public Map<String, Object> line1() throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> map;
		map = new HashMap<>();
		map.put("type", "line");
		map.put("data", new double[]{-0.9,1.0,6.3,13.3,18.9,23.6,25.8,26.3,22.4,15.5,8.9,1.6});
		
		list.add(map);
		
		model.put("series", list); // 차트를 작성할 연속된 값(시어리즈 값)
		
		return model;
	}
	
	@RequestMapping(value="line2")
	@ResponseBody
	public Map<String, Object> line2() throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> map;
		
		map = new HashMap<>();
		map.put("name", "서울");
		map.put("type", "line");
		map.put("data", new double[]{-0.9,1.0,6.3,13.3,18.9,23.6,25.8,26.3,22.4,15.5,8.9,1.6});
		list.add(map);

		map = new HashMap<>();
		map.put("name", "부산");
		map.put("type", "line");
		map.put("data", new double[]{4.7,5.4,9.5,13.9,18.8,21.0,23.9,26.1,22.1,18.1,13.6,7.9});
		list.add(map);
		
		map = new HashMap<>();
		map.put("name", "제주");
		map.put("type", "line");
		map.put("data", new double[]{7.4,7.3,10.4,15.1,18.8,22.0,25.6,26.4,23.2,19.2,15.2,10.0});
		list.add(map);

		map = new HashMap<>();
		map.put("name", "철원");
		map.put("type", "line");
		map.put("data", new double[]{-4.0,-1.3,4.0,11.3,17.6,21.6,23.8,24.1,18.9,12.3,6.6,-1.2});
		list.add(map);
		
		model.put("year", "2015");
		model.put("legend", new String[] {"서울","부산","제주","철원"});
		model.put("series", list);
		
		return model;
	}

	@RequestMapping(value="bar")
	@ResponseBody
	public Map<String, Object> bar() throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> map;
		
		map = new HashMap<>();
		map.put("name", "서울");
		map.put("type", "bar");
		map.put("data", new double[]{-0.9,1.0,6.3,13.3,18.9,23.6,25.8,26.3,22.4,15.5,8.9,1.6});
		list.add(map);

		map = new HashMap<>();
		map.put("name", "부산");
		map.put("type", "bar");
		map.put("data", new double[]{4.7,5.4,9.5,13.9,18.8,21.0,23.9,26.1,22.1,18.1,13.6,7.9});
		list.add(map);
		
		map = new HashMap<>();
		map.put("name", "제주");
		map.put("type", "bar");
		map.put("data", new double[]{7.4,7.3,10.4,15.1,18.8,22.0,25.6,26.4,23.2,19.2,15.2,10.0});
		list.add(map);

		map = new HashMap<>();
		map.put("name", "철원");
		map.put("type", "bar");
		map.put("data", new double[]{-4.0,-1.3,4.0,11.3,17.6,21.6,23.8,24.1,18.9,12.3,6.6,-1.2});
		list.add(map);
		
		model.put("year", "2015");
		model.put("legend", new String[] {"서울","부산","제주","철원"});
		model.put("series", list);
		
		return model;
	}

	// produces : response의 Content-Type
	@RequestMapping(value="pie", produces="application/json; charset=utf-8")
	@ResponseBody
	public String pie() throws Exception {
		JSONArray jarr = new JSONArray();
		
		JSONObject job;
		
		job = new JSONObject();
		job.put("name", "07-10시");
		job.put("value", 10);
		jarr.put(job);
		
		job = new JSONObject();
		job.put("name", "10-13시");
		job.put("value", 30);
		jarr.put(job);

		job = new JSONObject();
		job.put("name", "13-16시");
		job.put("value", 33);
		jarr.put(job);

		job = new JSONObject();
		job.put("name", "16-19시");
		job.put("value", 20);
		jarr.put(job);

		job = new JSONObject();
		job.put("name", "기타");
		job.put("value", 10);
		jarr.put(job);

		return jarr.toString();
	}
}
