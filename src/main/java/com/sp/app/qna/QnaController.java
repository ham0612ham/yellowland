package com.sp.app.qna;

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

@Controller("qna.qnaController")
@RequestMapping(value = "/qna/*")
public class QnaController {
	@Autowired
	private QnaService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,		
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page;
		int dataCount;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size); 
		
		List<Qna> list = service.listQna(map);
		
		String query = "";
		String listUrl = cp + "/qna/list";
		String articleUrl = cp + "/qna/article?page=" + current_page;
	
		if (query.length() != 0) {
			listUrl = cp + "/qna/list?" + query;
			articleUrl = cp + "/qna/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
	
		return ".qna.list";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model) throws Exception {
		
		model.addAttribute("mode", "write");
		return ".qna.write";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(Qna dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertQna(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/qna/list";
	}
	
	
	@RequestMapping(value = "article")
	public String artilce(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if (info == null) {
			return "redirect:/member/login";			
		}
		
		String query = "page=" + page;

		Qna qnaDto = service.readQna(num);
		if (qnaDto == null) {
			return "redirect:/qna/list?" + query;
		}
		if(! qnaDto.getUserId().equals(info.getUserId())) {
			return "redirect:/qna/list?" + query;
		}
		
		Qna qnaDto2 = service.readAnswer(num);
	
		qnaDto.setContent(qnaDto.getContent().replaceAll("\n", "<br>"));
		
		model.addAttribute("dto", qnaDto);
		model.addAttribute("dto2",qnaDto2);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".qna.article";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Qna dto = service.readQna(num);
		if (dto == null) {
			return "redirect:/qna/list?page=" + page;
		}

		if (!info.getUserId().equals(dto.getUserId())) {
			return "redirect:/qna/list?page=" + page;
		}

		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		
		return ".qna.write";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(Qna dto,
			@RequestParam String page,
			HttpSession session) throws Exception {
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			dto.setUserId(info.getUserId());
			service.updateQna(dto);
		} catch (Exception e) {
		}
		
		
		return "retirect:/qna/list" ;
	}
	
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam long num,
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Qna dto = service.readQna(num);
		
		if (dto != null) {
			if (info.getUserId().equals(dto.getUserId())) {
				try {
					service.deleteQna(num);
				} catch (Exception e) {
				}
			}
		}
		
		
		return "redirect:/qna/list?page="+page;
	}
}
