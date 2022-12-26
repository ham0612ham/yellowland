package com.sp.app.admin.qna;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("qna.qnaManageController")
@RequestMapping(value="/admin/qnaManage/*")

public class QnaManageController {
	@RequestMapping(value = "list")
	public String list(Model model) throws Exception {
		return ".admin.qna.list";
	}

}
