package com.sp.app.notice;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("notice.noticeController")
@RequestMapping("/notice/*")
public class NoticeController {
	
	// @Autowired
	// private NoticeService service;
	
	@RequestMapping(value = "list")
	public String list(Model model) throws Exception{
		return ".notice.list";	
	}
	
	@RequestMapping(value = "article")
	public String arricle(Model model) throws Exception{
		return ".notice.article";
	}
	
}
