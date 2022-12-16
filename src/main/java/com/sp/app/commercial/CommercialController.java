package com.sp.app.commercial;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.prop.PropReader;

@Controller("commercial.commercialController")
@RequestMapping("/commercial/*")
public class CommercialController {
	
	@RequestMapping(value="map")
	public String main() throws Exception {
		
		PropReader propReader = new PropReader();
		
		String daumKey = propReader.readDaumKey();
		
		System.out.println(daumKey);
		
		return ".commercial.map";
	}
}
