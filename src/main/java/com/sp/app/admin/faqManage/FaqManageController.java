package com.sp.app.admin.faqManage;



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

@Controller("admin.faqManage.faqmanageController")
@RequestMapping("/admin/faqManage/*")
public class FaqManageController {
	@Autowired
	private FaqManageService service;
	@Autowired
	private MyUtil myUtil;
		
	@RequestMapping(value="list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model)throws Exception{
		
		int size = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		List<Faq>list=service.listFaq(map);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/admin/faqManage/list";
		String articleUrl = cp + "/admin/faqManage/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/admin/faqManage/list?" + query;
			articleUrl = cp + "/admin/faqManage/article?page=" + current_page + "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		return ".admin.faqManage.list";
	}

	@RequestMapping(value="article")
	public String article (@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			Model model)throws Exception{
		
		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		Faq dto=service.readFaq(num);
		if (dto == null) {
			return "redirect:/admin/faqManage/list?" + query;
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("num", num);
		
		Faq preReadDto = service.preReadFaq(map);
		Faq nextReadDto = service.nextReadFaq(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		return ".admin.faqManage.article";
	}

	@RequestMapping(value="write", method=RequestMethod.GET)
	public String writeForm (Model model, HttpSession session)throws Exception{
		
		SessionInfo info =(SessionInfo) session.getAttribute("member");
		if (info.getMembership() < 51) {
			return "redirect:/admin/faqManage/list";
		}

		model.addAttribute("mode", "write");	
		
		return ".admin.faqManage.write";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSubmit(Faq dto, HttpSession session)throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info.getMembership() <51) {
			return "redirect:/admin/faqManage/list";
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "faq";

			dto.setUserId(info.getUserId());
			service.insertFaq(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return"redirect:/admin/faqManage/list";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Faq dto=service.readFaq(num);
		if (dto == null || ! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/admin/faqManage/list?page=" + page;
		}
		
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		
		return ".admin.faqManage.write";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(Faq dto,
			@RequestParam String page,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info.getMembership() < 51) {
			return "redirect:/admin/faqManage/list?page=" + page;
		}
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "faq";

			dto.setUserId(info.getUserId());
			service.updateFaq(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		return "redirect:/admin/faqManage/list?page=" + page;
	}
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		if (info.getMembership() < 51) {
			return "redirect:/admin/faqManage/list?" + query;
		}

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "faq";
			service.deleteFaq(num, pathname);
		} catch (Exception e) {
		}

		return "redirect:/admin/faqManage/list?" + query;
	}
}