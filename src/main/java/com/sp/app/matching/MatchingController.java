package com.sp.app.matching;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("matching.matchingController")
@RequestMapping(value = "/matching/*")
public class MatchingController {
	@Autowired
	private MatchingService service;
	
	@RequestMapping (value = "list")
	public String list(Model model) throws Exception{
		return ".matching.list";
		
	}
	@GetMapping(value="write")
	public String writeForm(Model model) throws Exception {
		//시군구 목록 
		List<Matching> listSigu = service.listSigu();
	
		
		model.addAttribute("mode", "write");
		model.addAttribute("listSigu", listSigu);
		
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
	
	@GetMapping(value = "listDong")
	@ResponseBody
	public Map<String, Object> listDong(@RequestParam long siguNum) throws Exception {

		// 시군구의 동 목록 가져오기
		List<Matching> listDong = service.listDong(siguNum);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listDong", listDong);
		
		return model;
	}
	
	@GetMapping(value ="main")
	public String main() {
		return ".matching.main";

	}
	
	

}
