package com.sp.app.commercialArea;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("commercialArea.commercialAreaController")
@RequestMapping("/commercialArea/*")
public class CommercialAreaController {
	
	@RequestMapping(value="map")
	public String main() throws Exception {
		return ".commercialArea.map";
	}
}
