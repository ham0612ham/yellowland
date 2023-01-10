package com.sp.app.admin.eventManage;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

@Controller("admin.eventManage.eventManageController")
@RequestMapping("/admin/eventManage/*")
public class EventManageController {
	@Autowired
	private EventManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page;
		int dataCount;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Event> list = service.listEvent(map);
		
		String query = "";
		String listUrl = cp + "/admin/eventManage/list";
		String articleUrl = cp + "/admin/eventManage/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/admin/eventManage/list?" + query;
			articleUrl = cp + "/admin/eventManage/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".admin.eventManage.list";
	}
	
	@RequestMapping(value="article", method=RequestMethod.GET)
	public String article(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			Model model) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page="+page;
		if(keyword.length()!=0) {
			query += "&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		int likeCount = service.eventLikeCount(num);
		Event dto = service.readEvent(num);
		if(dto == null) {
			return "redirect:/admin/eventManage/list"+query;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("num", num);
		
		Event preReadDto = service.preReadEvent(map);
		Event nextReadDto = service.nextReadEvent(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("likeCount", likeCount);
		
		return ".admin.eventManage.article";
	}
	
	@RequestMapping("write")
	public String eventwrite(Model model) throws Exception {
		
		model.addAttribute("mode", "write");
		
		return ".admin.eventManage.write";
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String writeSubmit(Event dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertEvent(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/eventManage/list";
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateEvent(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		
		Event dto = service.readEvent(num);
		if(dto == null) {
			return "redirect:/admin/eventManage/list"+page;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");
		
		return ".admin.eventManage.write";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updateSubmit(Event dto,
			@RequestParam(value = "page", defaultValue = "1") String page, 
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "photo";
		
		try {
			service.updateEvent(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/eventManage/list?page="+page;
	}
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(@RequestParam long num,
			@RequestParam(value = "page", defaultValue = "1") String page,
			@RequestParam String imageFilename,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "photo" + File.separator + imageFilename;
		
		try {
			service.deleteEvent(num, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/eventManage/list?page="+page;
	}
}
