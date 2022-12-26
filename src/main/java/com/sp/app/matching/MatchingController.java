package com.sp.app.matching;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("matching.matchingController")
@RequestMapping(value = "/matching/*")
public class MatchingController {
	@Autowired
	private MatchingService service;
	
	@GetMapping(value="write")
	public String writeForm(Model model) {
		model.addAttribute("mode", "write");
		return ".matching.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Matching dto,
			HttpSession session,
			Model model) {
		try {
			service.insertMatching(dto);
		} catch (Exception e) {
			
		}
		return "redirect:/matching/main";
	}
	
	@GetMapping(value ="main")
	public String main() {
		return ".matching.main";

	}
	
	

}
