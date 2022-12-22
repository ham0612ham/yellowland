package com.sp.app.typeCommunity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("typeCommunity.typeCommunityController")
@RequestMapping("/typeCommunity/*")
public class TypeCommunityController {
	/*
	@Autowired
	private TypeCommunityService service;
	*/
	
	@RequestMapping(value = "list")
	public String list(Model model) throws Exception {
		return ".typeCommunity.list";
	}
	
	@RequestMapping(value = "write")
	public String writeForm(Model model) throws Exception {
		return ".typeCommunity.write";
	}
	
	@RequestMapping(value = "article")
	public String article(Model model) throws Exception {
		return ".typeCommunity.article";
	}
}
