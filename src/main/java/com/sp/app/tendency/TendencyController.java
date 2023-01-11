package com.sp.app.tendency;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value="testStep2")
	public String testSpte2(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep2";
	}
	
	@RequestMapping(value="testStep3", method = RequestMethod.POST)
	public String testSpte3(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep3";
	}
	
	@RequestMapping(value="testStep4", method = RequestMethod.POST)
	public String testSpte4(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep4";
	}
}
