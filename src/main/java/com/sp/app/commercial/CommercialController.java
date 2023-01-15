package com.sp.app.commercial;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.prop.PropReader;

@Controller("commercial.commercialController")
@RequestMapping("/commercial/*")
public class CommercialController {
	@Autowired
	private CommercialService service;
	
	@RequestMapping(value="map")
	public String main(Model model) throws Exception {
		
		PropReader propReader = new PropReader();
		
		String daumKey = propReader.readDaumKey();
		
		model.addAttribute("daumKey", daumKey);
		
		return ".commercial.map";
	}
	
	@RequestMapping(value="sg_store_top10")
	@ResponseBody
	public Map<String, Object> sg_store_top10(@RequestParam String siguNum){
		Sg_store_top10 sg = new Sg_store_top10();
		sg.setSiguNum(siguNum);
		List<Sg_store_top10> list = null;
		Position pos = new Position();
		try {
			list = service.list_sg_store_top10(sg);
			
			if( !siguNum.equals("all") ) {
				pos = service.getSiguLatLong(siguNum);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		if(! siguNum.equals("all")) {
			map.put("level", 6);
			map.put("lat1", pos.getLatitude());
			map.put("long1", pos.getLongitude());
		}
		
		return map;
	}
	
	@RequestMapping(value="sg_sales_top10")
	@ResponseBody
	public Map<String, Object> sg_sales_top10(@RequestParam String siguNum){
		Sg_sales_top10 sg = new Sg_sales_top10();
		sg.setSiguNum(siguNum);
		List<Sg_sales_top10> list = null;
		Position pos = new Position();
		try {
			list = service.list_sg_sales_top10(sg);
			
			if( !siguNum.equals("all") ) {
				pos = service.getSiguLatLong(siguNum);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		if(! siguNum.equals("all")) {
			map.put("level", 6);
			map.put("lat1", pos.getLatitude());
			map.put("long1", pos.getLongitude());
		}
		
		return map;
	}
	
	@RequestMapping(value="sg_float_top10")
	@ResponseBody
	public Map<String, Object> sg_float_top10(@RequestParam String siguNum){
		Sg_float_top10 sg = new Sg_float_top10();
		sg.setSiguNum(siguNum);
		List<Sg_float_top10> list = null;
		Position pos = new Position();
		try {
			list = service.list_sg_float_top10(sg);
			
			if( !siguNum.equals("all") ) {
				pos = service.getSiguLatLong(siguNum);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		if(! siguNum.equals("all")) {
			map.put("level", 6);
			map.put("lat1", pos.getLatitude());
			map.put("long1", pos.getLongitude());
		}
		
		return map;
	}
	
	@RequestMapping(value="sg_citizen_top10")
	@ResponseBody
	public Map<String, Object> sg_citizen_top10(@RequestParam String siguNum){
		Sg_citizen_top10 sg = new Sg_citizen_top10();
		sg.setSiguNum(siguNum);
		List<Sg_citizen_top10> list = null;
		Position pos = new Position();
		try {
			list = service.list_sg_citizen_top10(sg);
			
			if( !siguNum.equals("all") ) {
				pos = service.getSiguLatLong(siguNum);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		if(! siguNum.equals("all")) {
			map.put("level", 6);
			map.put("lat1", pos.getLatitude());
			map.put("long1", pos.getLongitude());
		}
		
		return map;
	}
	
	@RequestMapping(value="getStoCouRankLists")
	@ResponseBody
	public Map<String, Object> getStoCouRankLists(Form form){
		List<Sg_store_top10> list = new ArrayList<Sg_store_top10>();
		String siguNum = form.getSiguNum();
		Position pos = new Position();
		try {
			list = service.list_sg_store_top10(form);
			
			if( !siguNum.equals("all") ) {
				pos = service.getSiguLatLong(siguNum);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		if(! siguNum.equals("all")) {
			map.put("level", 6);
			map.put("lat1", pos.getLatitude());
			map.put("long1", pos.getLongitude());
		}
		
		return map;
	}
	
	@RequestMapping(value="getSalesRankLists")
	@ResponseBody
	public Map<String, Object> getSalesRankLists(Form form){
		List<Sg_sales_top10> list = new ArrayList<Sg_sales_top10>();
		String siguNum = form.getSiguNum();
		Position pos = new Position();
		try {
			list = service.list_sg_sales_top10(form);
			
			if( !siguNum.equals("all") ) {
				pos = service.getSiguLatLong(siguNum);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		if(! siguNum.equals("all")) {
			map.put("level", 6);
			map.put("lat1", pos.getLatitude());
			map.put("long1", pos.getLongitude());
		}
		
		return map;
	}
	
	@RequestMapping(value="getMPopRankLists")
	@ResponseBody
	public Map<String, Object> getMPopRankLists(Form form){
		List<Sg_float_top10> list = new ArrayList<Sg_float_top10>();
		String siguNum = form.getSiguNum();
		Position pos = new Position();
		try {
			list = service.list_sg_float_top10(form);
			
			if( !siguNum.equals("all") ) {
				pos = service.getSiguLatLong(siguNum);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		if(! siguNum.equals("all")) {
			map.put("level", 6);
			map.put("lat1", pos.getLatitude());
			map.put("long1", pos.getLongitude());
		}
		
		return map;
	}
	
	@RequestMapping(value="getHPopRankLists")
	@ResponseBody
	public Map<String, Object> getHPopRankLists(Form form) throws Exception {
		List<Sg_citizen_top10> list = new ArrayList<Sg_citizen_top10>();
		String siguNum = form.getSiguNum();
		Position pos = new Position();
		try {
			list = service.list_sg_citizen_top10(form);
			
			if( !siguNum.equals("all") ) {
				pos = service.getSiguLatLong(siguNum);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		if(! siguNum.equals("all")) {
			map.put("level", 6);
			map.put("lat1", pos.getLatitude());
			map.put("long1", pos.getLongitude());
		}
		
		return map;
	}
	
	@RequestMapping(value="getRentRankList")
	@ResponseBody
	public Map<String, Object> getRentRankList(@RequestParam String siguNum) throws Exception {
		List<Sg_rent_dong_top10> list = new ArrayList<Sg_rent_dong_top10>();
		Position pos = new Position();
		
		try {
			list = service.list_sg_rent_dong_top10(siguNum);
			
			pos = service.getSiguLatLong(siguNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		if(! siguNum.equals("all")) {
			map.put("level", 6);
			map.put("lat1", pos.getLatitude());
			map.put("long1", pos.getLongitude());
		}
		
		return map;
	}
}
