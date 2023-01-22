package com.sp.app.assignComm;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.member.SessionInfo;
import com.sp.app.prop.PropReader;

@Controller(value = "assignComm.assignCommController")
@RequestMapping(value = "/assignComm/*")
public class AssignCommController {
	
	@Autowired
	private AssignCommService service;
	
	
	public void jsonFileWriter(HttpSession session, List<Community> list) throws Exception {
		
		try {
			
			String root = session.getServletContext().getRealPath("/");
			
			File jsonFile = new File(root + "resources" + File.separator + "jsonData"+ File.separator +"positions.json");
			BufferedWriter bw = new BufferedWriter(new FileWriter(jsonFile));
			
			// json 파일의 메인 객체와 배열
			JSONObject jsonObject = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			
			// 위도, 경도를 JSON 객체로 만들어 배열에 담기
			for(Community dto : list) {
				
				JSONObject jo = new JSONObject();
				jo.put("lat", dto.getLat());
				jo.put("lng", dto.getLng());
				
				jsonArray.put(jo);
			
			}
			
			jsonObject.put("positions", jsonArray);
			
			String jsonObStr = jsonObject.toString();
			
			bw.write(jsonObStr);
			bw.flush();
			bw.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	
	
	@GetMapping(value = "main")
	public String main(HttpSession session, Model model) throws Exception {
		
		PropReader propReader = new PropReader();
		
		String daumKey = propReader.readDaumKey();
		
		List<Community> list = service.listComm();
		
		// 상가에 위도와 경도를 가진 json 파일을 만들어 지도에 클러스터 표시
		jsonFileWriter(session, list);
		
		long count = service.listCommCount();
	
		model.addAttribute("daumKey", daumKey);
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("mode", "write");
		
		return ".assignComm.main";
	}
	
	@PostMapping(value = "write")
	public String formSubmit(Community dto, HttpServletRequest req) throws Exception {
		
		try {
			
			HttpSession session = req.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			dto.setUserId(info.getUserId());
			
			String root = session.getServletContext().getRealPath("/");
			String path = root + "uploads" + File.separator + "image";
			
			service.insertAllComm(dto, path);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/assignComm/main";
	}
	
	// ajax - html
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String asDetail(@RequestParam long num, Model model) throws Exception {
		
		Community dto = null;
		List<Community> imgList = null;
		
		try {
			
			dto = service.readComm(num);
			
			imgList = service.readCommImg(num);
			
			model.addAttribute("dto", dto);
			model.addAttribute("imgList", imgList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "assignComm/detail";
	}
	
	@GetMapping("myList")
	public String myList(@RequestParam String userId, Model model) throws Exception {
		
		try {
			
		List<Community> list = service.listComm(userId);
		long count = service.listCommCount(userId);
		
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "assignComm/myList";
	}
	
	
	@PostMapping("update")
	public String updateSubmit(Community dto, HttpSession session, Model model) throws Exception {
		
		try {
			
			String root = session.getServletContext().getRealPath("/");
			String path = root + "uploads" + File.separator + "image";
			
			service.updateComm(dto, path);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
		return "redirect:/assignComm/main";
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam long num) throws Exception {
		
		try {
			
			service.deleteComm(num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/assignComm/main";
	}
	
	@RequestMapping(value = "noteSubmit", method = RequestMethod.POST)
	public String noteSubmit(Note note, HttpSession session) throws Exception {
		
		try {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			note.setSenderId(info.getUserId());
			
			service.insertNote(note);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/assignComm/main";
	}
	
	// ajax - html
	@GetMapping(value = "dtoJsonDetail")
	public String dtoJsonDetail(@RequestParam long num, Model model) throws Exception {
		
		Community dto = null;
		
		try {
		
			dto = service.readComm(num);
			
			model.addAttribute("dto", dto);
			model.addAttribute("mode", "update");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "assignComm/updateForm";
	}
	
	@RequestMapping(value = "updateList", method = RequestMethod.GET)
	public String updateList(@RequestParam double swLat, @RequestParam double swLng, 
			@RequestParam double neLat, @RequestParam double neLng, Model model) throws Exception {
		
		List<Community> list = null;
		long count = 0;
		
		try {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("swLat", swLat);
			map.put("swLng", swLng);
			map.put("neLat", neLat);
			map.put("neLng", neLng);
			
			list = service.updateList(map);
			
			count = service.updateListCount(map);
			
			model.addAttribute("updateList", list);
			model.addAttribute("newCount", count);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "assignComm/updateList";
	}
	
	@GetMapping(value = "detailLatLng")
	public String detailLatLng(@RequestParam double lat, @RequestParam double lng, Model model) throws Exception {
		
		Community dto = null;
		
		try {
			
			dto = service.detailLatLng(lat, lng);
			
			model.addAttribute("dto", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "assignComm/detail";
	}
	
}
