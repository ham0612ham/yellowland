package com.sp.app.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.MyUtil;

@Controller("faq.faqController")
@RequestMapping("/faq/*")
public class FaqController {
	@Autowired
	private FaqService service;

	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(@RequestParam(value="page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			Model model) throws Exception {
		
		
		int size = 6;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<String, Object>();
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Faq> list = service.ListFaq(map);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/faq/list";
		
		
		if (query.length() != 0) {
			listUrl = cp + "/faq/list?" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		
		
		return ".faq.list";
	}
	
}
