package com.sp.app.localComm;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		List<LocalComm> listSigu = service.listSigu();
		
		model.addAttribute("mode", "write");
		model.addAttribute("listSigu", listSigu);
		
		return ".localComm.write";
	}


	@PostMapping(value = "write")
	public String writeSubmit(LocalComm dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "notice";

			dto.setUserId(info.getUserId());
			service.insertLocalComm(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/localComm/list";
	}
	
	
	@GetMapping(value = "listDong")
	@ResponseBody
	public Map<String, Object> listDong(@RequestParam long siguNum) throws Exception {

		// 시군구의 동 목록 가져오기
		List<LocalComm> listDong = service.listDong(siguNum);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listDong", listDong);
		
		return model;
	}
	
	@RequestMapping(value = "article")
	public String article(Model model) throws Exception {
		return ".localComm.article";
	}
}
