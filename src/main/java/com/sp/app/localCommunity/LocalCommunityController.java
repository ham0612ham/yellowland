package com.sp.app.localCommunity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("localCommunity.localCommunityController")
@RequestMapping("/localCommunity/*")
public class LocalCommunityController {
	@Autowired
	private LocalCommunityService service;
	
	@RequestMapping(value = "list")
	public String list(Model model) throws Exception {
		return ".localCommunity.list";
	}

	@RequestMapping(value = "write")
	public String writeForm(Model model) throws Exception {
		return ".localCommunity.write";
	}
	
	@RequestMapping(value = "article")
	public String article(Model model) throws Exception {
		return ".localCommunity.article";
	}
}
