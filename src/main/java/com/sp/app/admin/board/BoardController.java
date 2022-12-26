package com.sp.app.admin.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("board.boardController")
@RequestMapping("/admin/board/*")
public class BoardController {
	
	@RequestMapping(value="list")
	public String list(Model model)throws Exception{
		return".admin.board.list";
	}
}
