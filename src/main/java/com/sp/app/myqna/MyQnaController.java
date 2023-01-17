package com.sp.app.myqna;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;


@Controller("myqna.qnaController")
@RequestMapping(value="/myqna/*")
public class MyQnaController {
	@Autowired
	private MyQnaService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			//@RequestParam String userId,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,	
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info =(SessionInfo)session.getAttribute("member");
		String cp = req.getContextPath();
		int size = 10;
		int total_page=0;
		int dataCount=0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("userId", info.getUserId());
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size); 
		map.put("userId",info.getUserId());
		List<MyQna>list=service.listMyQna(map);
		//MyQna dto=service.readMyQna(userId);
		String query = "";
		String listUrl = cp + "/myqna/list";
		String articleUrl = cp + "/myqna/article?page=" + current_page;
	
		if (query.length() != 0) {
			listUrl = cp + "/myqna/list?" + query;
			articleUrl = cp + "/myqna/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".myqna.list";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model) throws Exception {
		
		model.addAttribute("mode", "write");
		return ".myqna.write";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(MyQna dto, HttpSession session) throws Exception {
		SessionInfo info =(SessionInfo)session.getAttribute("number");
		try {
			dto.setUserId(info.getUserId());
			service.insertMyQna(dto);
		} catch (Exception e) {
		}
		return "redirect:/myqna/list";
	}
	
	@RequestMapping(value = "article")
	public String artilce(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String query = "page=" + page;
		
		MyQna qnaDto=service.readMyQna(num);
		if (qnaDto == null) {
			return "redirect:/myqna/list?" + query;
		}
		if(! qnaDto.getUserId().equals(info.getUserId())) {
			return "redirect:/myqna/list?" + query;
		}
		
		MyQna qnaDto2=service.readAnswer(num);
		
		qnaDto.setContent(qnaDto.getContent().replaceAll("\n", "<br>"));
		Map<String, Object>map =new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("num", num);
		map.put("userId",info.getUserId());
		
		MyQna preReadDto=service.preReadMyQna(map);
		MyQna nextReadDto=service.nextReadMyQna(map);
		
		model.addAttribute("dto", qnaDto);
		model.addAttribute("dto2",qnaDto2);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		return ".myqna.article";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		MyQna dto=service.readMyQna(num);
		if (dto == null) {
			return "redirect:/myqna/list?page=" + page;
		}

		if (!info.getUserId().equals(dto.getUserId())) {
			return "redirect:/myqna/list?page=" + page;
		}

		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		return ".myqna.write";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(MyQna dto,@RequestParam String page,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {				
			dto.setUserId(info.getUserId());
			service.updateMyQna(dto);
		}catch (Exception e) {
		}
		
		return "retirect:/myqna/list?page="+page ;
	}
	

	@RequestMapping(value = "delete")
	public String delete(@RequestParam long num,
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		MyQna dto =service.readMyQna(num);
		
		if(dto!=  null) {
			if(info.getUserId().equals(dto.getUserId())) {
				try {
					service.deleteMyQna(num);
				} catch (Exception e) {
				}
			}
		}
		return "redirect:/myqna/list?page="+page;
	}
}