package com.sp.app.faq;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("faq.faqController")
@RequestMapping("/faq/*")
public class FaqController {
	
	/*
	@Autowired
	private FaqService service;
	*/
	
	@RequestMapping(value = "list")
	public String list(Model model) throws Exception {
		return ".faq.list";
	}
	
}
