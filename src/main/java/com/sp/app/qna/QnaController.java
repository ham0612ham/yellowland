package com.sp.app.qna;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("qna.qnaController")
@RequestMapping(value = "/qna/*")
public class QnaController {
	/* 
	@Autowired
	private QnaService service;
	*/
	
	@RequestMapping(value = "list")
	public String list(Model model) throws Exception {
		return ".qna.list";
	}
	
	@RequestMapping(value = "write")
	public String writeForm(Model model) throws Exception {
		return ".qna.write";
	}
	
	@RequestMapping(value = "article")
	public String artilce(Model model) throws Exception {
		return ".qna.article";
	}
}
