package com.sp.app.admin.noticeManage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("notice.noticeManageController")
@RequestMapping("/admin/noticeManage/*")
public class NoticeManageController {
	@RequestMapping(value="list")
	public String list (Model model)throws Exception{
		return ".admin.notice.list";
	}
	
	@RequestMapping(value="article")
	public String article (Model model)throws Exception{
		return ".admin.notice.article";
	}
	
	@RequestMapping(value="write")
	public String write (Model model)throws Exception{
		return ".admin.notice.write";
	}

}
