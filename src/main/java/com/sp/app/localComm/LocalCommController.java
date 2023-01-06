package com.sp.app.localComm;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.FileManager;
import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;

@Controller("localComm.localCommController")
@RequestMapping("/localComm/*")
public class LocalCommController {
	@Autowired
	private LocalCommService service;
	@Autowired 
	private MyUtil myUtil;
	@Autowired
	private FileManager FileManager;
	
	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			// @RequestParam long siguNum,
			Model model) throws Exception {
		
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
		
		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}

		// 전체 페이지수에 변화 있을 경우
		if (total_page < current_page) {
			current_page = total_page;
		}

		// 리스트에 출력할 데이터 불러오기
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		// 글 리스트
		List<LocalComm> list = service.ListLocalComm(map);
		// 시군구 리스트
		List<LocalComm> listSigu = service.listSigu();
		// (시군구)동 리스트
		//List<LocalComm> listDong = service.listDong(siguNum);
		
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/localComm/list";
		String articleUrl = cp + "/localComm/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/localComm/list?" + query;
			articleUrl = cp + "/localComm/article?page=" + current_page + "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);
				
		model.addAttribute("list", list);
		model.addAttribute("listSigu", listSigu);
		//model.addAttribute("listDong", listDong);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		
		return ".localComm.list";
	}

	@GetMapping(value = "write")
	public String writeForm(Model model) throws Exception {

		// 시군구 목록 가져오기
		List<LocalComm> listSigu = service.listSigu();
		
		model.addAttribute("mode", "write");
		model.addAttribute("listSigu", listSigu);
		
		return ".localComm.write";
	}


	@PostMapping(value = "write")
	public String writeSubmit(LocalComm dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "notice";

			dto.setUserId(info.getUserId());
			service.insertLocalComm(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/localComm/list";
	}
	
	
	@GetMapping(value = "listDong")
	@ResponseBody
	public Map<String, Object> listDong(@RequestParam long siguNum) throws Exception {

		// 시군구의 동 목록 가져오기
		List<LocalComm> listDong = service.listDong(siguNum);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listDong", listDong);
		
		return model;
	}
	
	@RequestMapping(value = "article")
	public String article(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			Model model) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		service.updateHitCount(num);
		
		LocalComm dto = service.readLocalComm(num);
		if(dto == null) {
			return "redirect:/localComm/list?" + query;
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("num", num);
		
		LocalComm preReadDto = service.preReadLocalComm(map);
		LocalComm nextReaDto = service.nextReaLocalComm(map);
		
		// 파일
		List<LocalComm> listFile = service.listFile(num);
	
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReaDto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".localComm.article";
	}
}
