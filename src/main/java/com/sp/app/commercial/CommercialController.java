package com.sp.app.commercial;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.prop.PropReader;

@Controller("commercial.commercialController")
@RequestMapping("/commercial/*")
public class CommercialController {
	
	@RequestMapping(value="map")
	public String main(Model model) throws Exception {
		
		PropReader propReader = new PropReader();
		
		String daumKey = propReader.readDaumKey();
		
		model.addAttribute("daumKey", daumKey);
		
		return ".commercial.map";
	}
}
