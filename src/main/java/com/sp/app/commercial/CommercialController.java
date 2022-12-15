package com.sp.app.commercial;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("commercial.commercialController")
@RequestMapping("/commercial/*")
public class CommercialController {
	
	@RequestMapping(value="map")
	public String main() throws Exception {
		return ".commercial.map";
	}
}
