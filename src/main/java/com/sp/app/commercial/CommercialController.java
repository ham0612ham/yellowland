package com.sp.app.commercial;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public List<Sg_citizen_top10> sg_citizen_top10(){
		List<Sg_citizen_top10> list = null;
		try {
			list = service.list_sg_citizen_top10();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
