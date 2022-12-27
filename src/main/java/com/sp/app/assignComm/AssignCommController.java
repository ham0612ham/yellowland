package com.sp.app.assignComm;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sp.app.member.SessionInfo;
import com.sp.app.prop.PropReader;

@Controller(value = "assignComm.assignCommController")
@RequestMapping(value = "/assignComm/*")
public class AssignCommController {
	
	@Autowired
	private AssignCommService service;
	
	
	
	@GetMapping(value = "main")
	public String main(Model model) throws Exception {
		
		PropReader propReader = new PropReader();
		
		String daumKey = propReader.readDaumKey();
		
		model.addAttribute("daumKey", daumKey);
		
		List<Community> list = service.listComm();
		
		model.addAttribute("list", list);
		
		return ".assignComm.main";
	}
	
	@PostMapping(value = "submit")
	public String formSubmit(Community dto, HttpServletRequest req) throws Exception {
		
		try {
			
			HttpSession session = req.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			dto.setUserId(info.getUserId());
			
			String root = session.getServletContext().getRealPath("/");
			String path = root + "uploads" + File.separator + "image";
			
			service.insertAllComm(dto, path);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/assignComm/main";
	}
	
	
	
}
