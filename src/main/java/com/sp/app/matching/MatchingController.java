package com.sp.app.matching;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.APISerializer;


@Controller("matching.matchingController")
@RequestMapping(value = "/matching/*")
public class MatchingController {
	@Autowired
	private MatchingService service;
	
	@Autowired
	private APISerializer apiSerializer ;
	
	
	@RequestMapping (value = "list")
	public String list(Model model) throws Exception{
		return ".matching.list";
		
	}
	@GetMapping(value="write")
	public String writeForm(Model model) throws Exception {
		//시군구 목록 
		List<Matching> listSigu = service.listSigu();
	
		
		model.addAttribute("mode", "write");
		model.addAttribute("listSigu", listSigu);
		
		return ".matching.write";
	}
	
	@PostMapping("write")
	@ResponseBody
	public Map<String, Object> writeSubmit(MatchingInfo dto,
			HttpSession session) {
		
		Map<String, Object> model = new HashMap<>();
		try {
			int n = Integer.parseInt(dto.getSetbudget()) / Integer.parseInt(dto.getSetsize());
			String query = "siguNum="+dto.getSiguNum()+"&dongNum="+dto.getDongNum()+"&budget="+n+
					"&age="+dto.getSetage()+"&gender="+URLEncoder.encode(dto.getSetgender(),"utf-8");
			String spec = "http://localhost:5000/matching?"+query;
			String stringJson = apiSerializer.receiveToString(spec);
			
			stringJson = URLDecoder.decode(stringJson,"utf-8");
			
		    JSONArray jarr = new JSONArray(stringJson);

		    List<MatchingInfo> list = new ArrayList<>();
		    
		    for(int i = 0; i < jarr.length(); i++) {
		    	JSONObject job = jarr.getJSONObject(i);
		    	MatchingInfo vo = new MatchingInfo();
		    	vo.setSgGBName(job.getString("sgGBName"));
		    	vo.setBudget(job.getInt("budget"));
		    	list.add(vo);
		    
		    }
		    
			model.put("list", list);
		   
			// Matching vo = new Matching();

			//service.insertMatching(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	@GetMapping(value = "listDong")
	@ResponseBody
	public Map<String, Object> listDong(@RequestParam long siguNum) throws Exception {

		// 시군구의 동 목록 가져오기
		List<Matching> listDong = service.listDong(siguNum);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listDong", listDong);
		
		return model;
	}
	
	@GetMapping(value ="main")
	public String main() {
		return ".matching.main";

	}
	
	@GetMapping(value = "listJob")
	@ResponseBody
	public Map<String, Object> listJob(@RequestParam String catejobNum) throws Exception {
		// 업종 대분류의 소분류 목록 가져오기
		List<Matching> listJob = service.listJob(catejobNum);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listJob", listJob);
		
		return model;
	}
	

}
