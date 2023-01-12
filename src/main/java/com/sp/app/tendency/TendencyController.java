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
	
	@RequestMapping(value="testStep5", method = RequestMethod.POST)
	public String testStep5(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep5";
	}
	
	@RequestMapping(value="testStep6", method = RequestMethod.POST)
	public String testStep6(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep6";
	}
	
	@RequestMapping(value="testStep7", method = RequestMethod.POST)
	public String testStep7(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep7";
	}
	
	@RequestMapping(value="testStep8", method = RequestMethod.POST)
	public String testStep8(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep8";
	}
	
	@RequestMapping(value="testStep9", method = RequestMethod.POST)
	public String testStep9(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep9";
	}
	
	@RequestMapping(value="testStep10", method = RequestMethod.POST)
	public String testStep10(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep10";
	}
	
	@RequestMapping(value="result", method = RequestMethod.POST)
	public String testResult(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.result";
	}
}
