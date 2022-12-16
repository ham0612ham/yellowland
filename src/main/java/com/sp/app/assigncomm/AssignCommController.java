package com.sp.app.assigncomm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller(value = "assignCommController")
@RequestMapping(value = "/assigncomm/*")
public class AssignCommController {
	
	@Autowired
	AssignCommService service;
	
	@GetMapping(value = "main")
	public String main() {
		
		
		return ".assignComm.main";
	}
	
}
