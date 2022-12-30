package com.sp.app.commercial;

import java.util.Collections;
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
	
	@RequestMapping(value="listStore")
	public void listStore() throws Exception {
		List<Sg_store> list = null;
		try {
			list = service.list_sg_store();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
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
				for (int i = 1; i < list.size(); i++) {
					for (int j = 0; j < list.size() - i; j++) {
						if (list.get(j).getChai() < list.get(j + 1).getChai()) {
							Collections.swap(list, j, j + 1);
						}
					}
				}
				pos = service.getSiguLatLong(siguNum);
			}
			if(list.size() > 10) {
				list = list.subList(0, 10);
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
}
