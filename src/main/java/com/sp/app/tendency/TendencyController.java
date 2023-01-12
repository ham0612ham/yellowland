package com.sp.app.tendency;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.app.common.APISerializer;
import com.sp.app.prop.PropReader;

@Controller("tendency.tendencyController")
@RequestMapping("/tendency/*")
public class TendencyController {
	
	@Autowired
	private APISerializer apiSerializer;
	
	@RequestMapping("main")
	public String tendencyMain(Model model) {
		
		PropReader propReader = new PropReader();
		
		String daumKey = propReader.readDaumKey();
		
		model.addAttribute("daumKey", daumKey);
		
		return ".tendency.main";
	}
	
	@RequestMapping("testStep1")
	public String testSpte1() {
		
		return ".tendency.testStep1";
	}
	
	@RequestMapping(value="testStep2")
	public String testSpte2(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep2";
	}
	
	@RequestMapping(value="testStep3", method = RequestMethod.POST)
	public String testSpte3(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep3";
	}
	
	@RequestMapping(value="testStep4", method = RequestMethod.POST)
	public String testSpte4(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep4";
	}
	
	@RequestMapping(value="testStep5", method = RequestMethod.POST)
	public String testStep5(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep5";
	}
	
	@RequestMapping(value="testStep6", method = RequestMethod.POST)
	public String testStep6(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep6";
	}
	
	@RequestMapping(value="testStep7", method = RequestMethod.POST)
	public String testStep7(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep7";
	}
	
	@RequestMapping(value="testStep8", method = RequestMethod.POST)
	public String testStep8(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep8";
	}
	
	@RequestMapping(value="testStep9", method = RequestMethod.POST)
	public String testStep9(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep9";
	}
	
	@RequestMapping(value="testStep10", method = RequestMethod.POST)
	public String testStep10(Tendency dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return ".tendency.testStep10";
	}
	
	@RequestMapping("resultEcho")
	public String flask(Tendency dto, Model model) {
		try {
			String spec = "http://localhost:5000/resultEcho/"+dto.getCateJobNum()+"?independent="
					+dto.getIndependent()+"&active="+dto.getActive()+"&study="+dto.getStudy()
					+"&certificate="+dto.getCertificate()+"&dayNight="+dto.getDayNight()
					+"&gender="+dto.getGender()+"&friendly="+dto.getFriendly()
					+"&age="+dto.getAge()+"&hotplace="+dto.getHotplace();
			String stringJson = apiSerializer.receiveToString(spec);
			JSONObject job = new JSONObject(stringJson);
			
			model.addAttribute("first", job.getString("first"));
			model.addAttribute("second", job.getString("second"));
			model.addAttribute("third", job.getString("third"));
			model.addAttribute("fourth", job.getString("fourth"));
			model.addAttribute("fifth", job.getString("fifth"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("cateJobNum", dto.getCateJobNum());
		
		return ".tendency.result";
	}
	
	@RequestMapping(value="result")
	public String testResult(Model model) {
		
		PropReader propReader = new PropReader();
		
		String daumKey = propReader.readDaumKey();
		
		model.addAttribute("daumKey", daumKey);
		
		return ".tendency.result";
	}
}
