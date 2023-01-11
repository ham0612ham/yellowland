package com.sp.app.tendency;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.prop.PropReader;

@Controller("tendency.tendencyController")
@RequestMapping("/tendency/*")
public class TendencyController {
	
	@RequestMapping("main")
	public String tendencyMain(Model model) {
		
		PropReader propReader = new PropReader();
		
		String daumKey = propReader.readDaumKey();
		
		model.addAttribute("daumKey", daumKey);
		
		return ".tendency.main";
	}
	
	@RequestMapping("testStep1")
	public String testSpte1() {
		
		return ".tendency.testStep1";
	}
}
