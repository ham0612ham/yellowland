
package com.sp.app.admin.faq;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("faq.faqmanageController")
@RequestMapping("/admin/faqManage/*")
public class FaqManageController {
	
	
	@RequestMapping(value="list")
	public String list(Model model)throws Exception{
		return ".admin.faq.list";
	}
	
	@RequestMapping(value="article")
	public String article (Model model)throws Exception{
		return ".admin.faq.article";
	}
	
	@RequestMapping(value="write")
	public String write (Model model)throws Exception{
		return ".admin.faq.write";
	}
}
