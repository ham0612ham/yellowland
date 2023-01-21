package com.sp.app.mylocal;

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

@Controller("mylocal.mylocalController")
@RequestMapping("/mylocal/*")
public class MylocalController {
	@Autowired
	private MylocalService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager FileManager;
	
	@RequestMapping(value="list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
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
		
		dataCount=service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size); 
		map.put("userId",info.getUserId());
		
		List<Mylocal>list=service.listMylocal(map);
		List<Mylocal>listSigu=service.listsigu();
		String query = "";
		String listUrl = cp + "/mylocal/list";
		String articleUrl = cp + "/mylocal/article?page=" + current_page;
	
		if (query.length() != 0) {
			listUrl = cp + "/mylocal/list?" + query;
			articleUrl = cp + "/mylocal/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		

		model.addAttribute("list", list);
		model.addAttribute("listSigu", listSigu);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".mylocal.list";
	}
	
	@GetMapping(value = "write")
	public String writeForm(Model model) throws Exception {
		List<Mylocal>listSigu=service.listsigu();
		model.addAttribute("mode", "write");
		model.addAttribute("listSigu", listSigu);
		return ".mylocal.write";
	}
	
	@RequestMapping(value = "write")
	public String writeSubmit(Mylocal dto,HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "mylocal";

			dto.setUserId(info.getUserId());
			service.insertMylocal(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/mylocal/list";
	}
	
	@GetMapping(value = "listDong")
	@ResponseBody
	public Map<String, Object>listDong(@RequestParam long siguNum) throws Exception {
		List<Mylocal>listDong=service.listDong(siguNum);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listDong", listDong);
		return model;
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
		service.updateHitCount(num);

		Mylocal dto=service.readMylocal(num);
		if (dto == null) {
			return "redirect:/mylocal/list?" + query;
		}
		if(! dto.getUserId().equals(info.getUserId())) {
			return "redirect:/mylocal/list?" + query;
		}
		
		int likeCount=service.MylocalLikeCount(num);
		//Mylocal dto2=service.readReply(num);
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		Map<String, Object>map =new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("num", num);
		map.put("userId",info.getUserId());
		
		Mylocal preReadDto=service.preReadMylocal(map);
		Mylocal nextReadDto=service.nextReadMylocal(map);
		
		List<Mylocal>listFile=service.listFile(num);
		
		boolean userMylocalLiked=service.userMylocalLiked(map);
		
		model.addAttribute("dto",dto);
		//model.addAttribute("dto2",dto2);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("userMylocalLiked", userMylocalLiked);
		
		return ".mylocal.article";
	}
	
	
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info =(SessionInfo)session.getAttribute("member");
		
		Mylocal dto=service.readMylocal(num);
		if (dto == null) {
			return "redirect:/mylocal/list?page=" + page;
		}

		if (!info.getUserId().equals(dto.getUserId())) {
			return "redirect:/mylocal/list?page"+page;
		}
		List<Mylocal>listFile=service.listFile(num);
		List<Mylocal>listSigu=service.listsigu();
		
		model.addAttribute("listSigu", listSigu);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		return ".mylocal.write";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(Mylocal dto,@RequestParam String page,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {	
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "mylocal";
			
			dto.setUserId(info.getUserId());
			service.updateMylocal(dto, pathname);
		} catch (Exception e) {
		}
		return "redirect:/mylocal/list?page=" + page ;
	}
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page="+page;
		
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "mylocal";
			service.deleteMylocal(num, pathname);
		} catch (Exception e) {
		}
		return "redirect:/mylocal/list?" + query;
	}
	
	@RequestMapping(value = "download")
	public void download(@RequestParam long fileNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "mylocal";
		
		boolean b = false;
		
		Mylocal dto=service.readFile(fileNum);
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
		String pathname = root + "uploads" + File.separator + "mylocal";

		boolean b = false;
		
		List<Mylocal>listFile=service.listFile(num);
		if(listFile.size()>0) {
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
		String pathname = root + "uploads" + File.separator + "mylocal";
		
		Mylocal dto=service.readFile(fileNum);
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
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}	
	
	@RequestMapping(value = "listReply")
	public String listReply(@RequestParam long num,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model) throws Exception {
		
		int size = 5;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		
		dataCount=service.replyCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if (current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		List<Reply>listReply=service.listReply(map);
		
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
		return "mylocal/listReply";
	}
	
	@RequestMapping(value = "insertReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object>insertReply(Reply dto, HttpSession session){
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		String state="true";
		try {
			dto.setUserId(info.getUserId());
			service.insertReply(dto);
		} catch (Exception e) {
			state="false";
		}
		Map<String, Object>model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value = "deleteReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object>deleteReply(@RequestParam Map<String, Object>paramMap){
		String state="true";
		try {
			service.deleteReply(paramMap);
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		return map;
	}
	
	@PostMapping("insertMylocalLike")
	@ResponseBody
	public Map<String, Object> insertMylocalLike(@RequestParam long num,
			@RequestParam boolean like,
			HttpSession session) {
		String state = "true";
		int MylocalLikeCount = 0;
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("num", num);
		paramMap.put("userId", info.getUserId());
		
		try {
			if(like) {
				service.deleteMylocalLike(paramMap);
			} else {
				service.insertMylocalLike(paramMap);
			}
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}
		
		MylocalLikeCount = service.MylocalLikeCount(num);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("MylocalLikeCount", MylocalLikeCount);
		
		return model;
	}
	
}
