package com.sp.app.assigncomm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.prop.PropReader;

@Controller(value = "assignCommController")
@RequestMapping(value = "/assigncomm/*")
public class AssignCommController {
	
	@Autowired
	AssignCommService service;
	
	@GetMapping(value = "main")
	public String main(Model model) {
		
		PropReader propReader = new PropReader();
		
		String daumKey = propReader.readDaumKey();
		
		model.addAttribute("daumKey", daumKey);
		
		return ".assignComm.main";
	}
	
}
