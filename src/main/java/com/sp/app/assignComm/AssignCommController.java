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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		List<Community> list = service.listComm();
		
		long count = service.listCommCount();
		
		model.addAttribute("daumKey", daumKey);
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		
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
	
	// ajax - html
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String asDetail(@RequestParam long num, Model model) throws Exception {
		
		Community dto = null;
		List<Community> imgList = null;
		
		try {
			
			dto = service.readComm(num);
			
			imgList = service.readCommImg(num);
			
			
			model.addAttribute("dto", dto);
			model.addAttribute("imgList", imgList);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "assignComm/detail";
	}
	
	@GetMapping("myList")
	public String myList(@RequestParam String userId) {
		
		
		return "assignComm/myList";
	}
	
	
	
}
