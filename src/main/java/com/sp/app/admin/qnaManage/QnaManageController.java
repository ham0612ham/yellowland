package com.sp.app.admin.qnaManage;

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


@Controller("qna.qnaManageController")
@RequestMapping(value="/admin/qnaManage/*")

public class QnaManageController {
	@Autowired
	private QnaManageService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
			
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		
		int size = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("userId",info.getUserId());
		map.put("membership", info.getMembership());
		
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
		
		List<Qna>list=service.listQna(map);		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/admin/qnaManage/list";
		String articleUrl = cp + "/admin/qnaManage/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}


		
		if (query.length() != 0) {
			listUrl = cp + "/admin/qnaManage/list?" + query;
			articleUrl = cp + "/admin/qnaManage/article?page=" + current_page + "&" + query;
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
		
		
		return ".admin.qnaManage.list";
	}
	
	@RequestMapping(value = "article")
	public String artilce(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String reply,
			HttpSession session,
			Model model) throws Exception {	
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		Qna dto = service.readQna(num);
		Qna replydto =service.readAnswer(num);
		if (dto == null) {
			return "redirect:/admin/qnaManage/list?" + query;
		}
	
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("replydto",replydto);
		return ".admin.qnaManage.article";
	}
	
	@RequestMapping(value = "reply", method = RequestMethod.POST)
	public String replySubmit(Qna replydto, 
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		if (info.getMembership() > 50) {
			try {
				replydto.setUserId(info.getUserId());
				service.answerQna(replydto);
			} catch (Exception e) {
			}
		}

		return "redirect:/admin/qnaManage/list?" + query;
	}
	
	@RequestMapping(value = "deleteAnswer")
	public String deleteAnswer(@RequestParam long num,
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
		
		Qna dto = service.readAnswer(num);
		if (dto != null) {
			if (info.getMembership() > 50) {
				try {
					service.deleteAnswer(num);
				} catch (Exception e) {
				}
			}
		}
		return "redirect:/admin/qnaManage/list?" + query;
	}
	
	@RequestMapping(value="delete")
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

		Qna dto=service.readQna(num);
		if(dto != null) {
			if(info.getUserId().equals(dto.getUserId())|| info.getMembership()>50) {
				try {
					service.deleteQna(num);
				} catch (Exception e) {
				}
			}
		}
		
		return "redirect:/admin/qnaManage/list?" + query;
	}
}
