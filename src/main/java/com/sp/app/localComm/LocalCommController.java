package com.sp.app.localComm;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
			@RequestParam(defaultValue = "") String siguNum, 
			@RequestParam(defaultValue = "") String dongNum, 
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
		map.put("siguNum", siguNum);
		map.put("dongNum", dongNum);
		
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
		
		if(siguNum.length() != 0) {
			if(query.length() == 0) {
				query = "siguNum="+siguNum;
			} else {
				query += "&siguNum="+siguNum;
			}
		}
		if(dongNum.length() != 0) {
			if(query.length() == 0) {
				query = "dongNum="+dongNum;
			} else {
				query += "&dongNum="+dongNum;
			}
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

		model.addAttribute("siguNum", siguNum);
		model.addAttribute("dongNum", dongNum);
		
		
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
			String pathname = root + "uploads" + File.separator + "localComm";

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
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		if (info == null) {
			return "redirect:/member/login";			
		}
		
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		service.updateHitCount(num);
		
		LocalComm dto = service.readLocalComm(num);
		if(dto == null) {
			return "redirect:/localComm/list?" + query;
		}
		
		int likeCount = service.localCommLikeCount(num);
		
		int replyCount = service.localCommReplyCount(num);
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("num", num);
		
		LocalComm preReadDto = service.preReadLocalComm(map);
		LocalComm nextReadDto = service.nextReadLocalComm(map);
		
		// 파일
		List<LocalComm> listFile = service.listFile(num);
		
		// 게시글 좋아요 여부
		map.put("userId", info.getUserId());
		boolean userLocalCommLiked = service.userLocalCommLiked(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		model.addAttribute("listFile", listFile);
		
		model.addAttribute("userLocalCommLiked", userLocalCommLiked);
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("replyCount", replyCount);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".localComm.article";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		LocalComm dto = service.readLocalComm(num);
		if (dto == null || ! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/localComm/list?page=" + page;
		}

		List<LocalComm> listFile = service.listFile(num);
		List<LocalComm> listSigu = service.listSigu();
		
		model.addAttribute("listSigu", listSigu);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);

		return ".localComm.write";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(LocalComm dto,
			@RequestParam String page,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "localComm";

			dto.setUserId(info.getUserId());
			service.updateLocalComm(dto, pathname);
		} catch (Exception e) {
		}

		return "redirect:/localComm/list?page=" + page;
	}
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {
		// SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page="+page;
		
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "localComm";
			service.deleteLocalComm(num, pathname);
		} catch (Exception e) {
		}

		return "redirect:/localComm/list?" + query;
	}
	

	@RequestMapping(value = "download")
	public void download(@RequestParam long fileNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "localComm";

		boolean b = false;

		LocalComm dto = service.readFile(fileNum);
		if (dto != null) {
			String saveFilename = dto.getSaveFilename();
			String originalFilename = dto.getOriginalFilename();

			b = FileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}

		if (! b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}

	@RequestMapping(value = "zipdownload")
	public void zipdownload(@RequestParam long num,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "localComm";

		boolean b = false;

		List<LocalComm> listFile = service.listFile(num);
		if (listFile.size() > 0) {
			String[] sources = new String[listFile.size()];
			String[] originals = new String[listFile.size()];
			String zipFilename = num + ".zip";

			for (int idx = 0; idx < listFile.size(); idx++) {
				sources[idx] = pathname + File.separator + listFile.get(idx).getSaveFilename();
				originals[idx] = File.separator + listFile.get(idx).getOriginalFilename();
			}

			b = FileManager.doZipFileDownload(sources, originals, zipFilename, resp);
		}

		if (! b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}

	@RequestMapping(value = "deleteFile", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long fileNum, HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "localComm";

		LocalComm dto = service.readFile(fileNum);
		if (dto != null) {
			FileManager.doFileDelete(dto.getSaveFilename(), pathname);
		}

		String state = "false";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "fileNum");
			map.put("num", fileNum);
			service.deleteFile(map);
			state = "true";
		} catch (Exception e) {
		}

		// 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	// 댓글 리스트 : AJAX-TEXT
		@RequestMapping(value = "listReply")
		public String listReply(@RequestParam long num,
				@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
				Model model) throws Exception {

			int size = 5;
			int total_page = 0;
			int dataCount = 0;

			Map<String, Object> map = new HashMap<>();
			map.put("num", num);

			dataCount = service.replyCount(map);
			total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}
			
			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);
			
			List<Reply> listReply = service.listReply(map);

			for (Reply dto : listReply) {
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			}

			// AJAX 용 페이징
			String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

			// 포워딩할 jsp로 넘길 데이터
			model.addAttribute("listReply", listReply);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("replyCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);

			return "localComm/listReply";
		}

		// 댓글 등록 : AJAX-JSON
		@RequestMapping(value = "insertReply", method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> insertReply(Reply dto, HttpSession session) {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			String state = "true";

			try {
				dto.setUserId(info.getUserId());
				service.insertReply(dto);
			} catch (Exception e) {
				state = "false";
			}

			Map<String, Object> model = new HashMap<>();
			model.put("state", state);
			return model;
		}

		// 댓글 삭제 : AJAX-JSON
		@RequestMapping(value = "deleteReply", method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> deleteReply(@RequestParam Map<String, Object> paramMap) {

			String state = "true";
			try {
				service.deleteReply(paramMap);
			} catch (Exception e) {
				state = "false";
			}

			Map<String, Object> map = new HashMap<>();
			map.put("state", state);
			return map;
		}
		
		// 게시글 좋아요 추가/삭제 
		@PostMapping("insertLocalCommLike")
		@ResponseBody
		public Map<String, Object> insertLocalCommLike(@RequestParam long num,
				@RequestParam boolean like,
				HttpSession session) {
			String state = "true";
			int localCommLikeCount = 0;
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("num", num);
			paramMap.put("userId", info.getUserId());
			
			try {
				if(like) {
					service.deleteLocalCommLike(paramMap);
				} else {
					service.insertLocalCommLike(paramMap);
				}
			} catch (DuplicateKeyException e) {
				state = "liked";
			} catch (Exception e) {
				state = "false";
			}
			
			localCommLikeCount = service.localCommLikeCount(num);
			
			Map<String, Object> model = new HashMap<>();
			model.put("state", state);
			model.put("localCommLikeCount", localCommLikeCount);
			
			return model;
		}
		
}
