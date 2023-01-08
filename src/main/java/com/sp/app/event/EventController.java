package com.sp.app.event;

import java.io.File;
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

@Controller("event.eventController")
@RequestMapping("/event/*")
public class EventController {
	@Autowired
	private EventService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="list", method = RequestMethod.GET)
	public String eventList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 6;
		int total_page;
		int dataCount;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		dataCount = service.dataCount();
		total_page = myUtil.pageCount(dataCount, size);
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Event> list = service.listEvent(map) ;
		
		String listUrl = cp + "/event/list";
		String articleUrl = cp + "/event/article?page="+current_page;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		
		return ".event.list";
	}
	
	@RequestMapping(value="enlist", method = RequestMethod.GET)
	public String eventEnList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 6;
		int total_page;
		int dataCount;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		dataCount = service.dataCount();
		total_page = myUtil.pageCount(dataCount, size);
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Event> list = service.listEvent(map) ;
		
		String listUrl = cp + "/event/list";
		String articleUrl = cp + "/event/article?page="+current_page;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		
		return ".event.lists";
	}
	
	@RequestMapping(value="dislist", method = RequestMethod.GET)
	public String eventDislist(@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 6;
		int total_page;
		int dataCount;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		dataCount = service.disDataCount();
		total_page = myUtil.pageCount(dataCount, size);
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Event> list = service.disListEvent(map) ;
		
		String listUrl = cp + "/event/list";
		String articleUrl = cp + "/event/disarticle?page="+current_page;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		
		return "/event/lists";
	}
	
	@RequestMapping("write")
	public String eventwrite(Model model) throws Exception {
		
		model.addAttribute("mode", "write");

		return ".event.write";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(Event dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertEvent(dto, path);
			
		} catch (Exception e) {
		}

		return "redirect:/event/list";
	}
	
	@RequestMapping(value="article", method=RequestMethod.GET)
	public String article(@RequestParam long num,
			@RequestParam(value = "page", defaultValue = "1") String page, Model model) throws Exception {
		
		Event dto = service.readEvent(num);
		if(dto == null) {
			return "redirect:/event/list";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		
		Event preReadDto = service.preReadEvent(map);
		Event nextReadDto = service.nextReadEvent(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		model.addAttribute("page", page);
		
		return ".event.article";
	}
	
	@RequestMapping(value="disarticle", method=RequestMethod.GET)
	public String disarticle(@RequestParam long num,
			@RequestParam(value = "page", defaultValue = "1") String page, Model model) throws Exception {
		
		Event dto = service.readEvent(num);
		if(dto == null) {
			return "redirect:/event/list";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		
		Event preReadDto = service.disPreReadEvent(map);
		Event nextReadDto = service.disNextReadEvent(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		model.addAttribute("page", page);
		
		return ".event.article";
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateEvent(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		
		Event dto = service.readEvent(num);
		if(dto == null) {
			return "redirect:/event/list?page="+page;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");
		
		return ".event.write";
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
		
		return "redirect:/event/article?num=" + dto.getNum() + "&page=" + page;
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
		
		return "redirect:/event/list?page="+page;
	}
	
}