package com.sp.app.localComm;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.member.SessionInfo;

@Controller("localComm.localCommController")
@RequestMapping("/localComm/*")
public class LocalCommController {
	@Autowired
	private LocalCommService service;
	
	@RequestMapping(value = "list")
	public String list(Model model) throws Exception {
		return ".localComm.list";
	}

	@GetMapping(value = "write")
	public String writeForm(Model model) throws Exception {
		// 시군구 목록 가져오기
				
		Map<String, Object> map = new HashMap<String, Object>();
		
		/*
		LocalComm readSiguNumdto = service.readSiguNum(map);
		
		model.addAttribute("readSiguNumdto", readSiguNumdto);
		*/
		model.addAttribute("mode", "write");
		
	
		
		return ".localComm.write";
	}
	
	@PostMapping(value = "write")
	public String writeSubmit(LocalComm dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "bbs";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertLocalComm(dto, pathname);
		} catch (Exception e) {
		}
		
		
		return "redirect:/bbs/list";
	}
	
	@RequestMapping(value = "article")
	public String article(Model model) throws Exception {
		return ".localComm.article";
	}
}
