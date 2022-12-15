package com.sp.app.parse;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.APISerializer;

@Controller("parse.userController")
@RequestMapping("/parse/*")
public class UserController {
	@Autowired
	private UserService service;
	
	@Autowired
	private APISerializer apiSerializer;
	
	@RequestMapping(value="main")
	public String main() {
		return "parse/main";
	}
	
	// AJAX - XML로 응답
	@RequestMapping(value = "xmlList", method = RequestMethod.GET, produces = "application/xml; charset=utf-8")
	@ResponseBody
	public String xmlList1(HttpServletRequest req) throws Exception {
		String result = null;
		
		// http://localhost:9090/app/resources/xml/guestXML.xml
		String cp=req.getContextPath();
		String spec=req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+cp;
		spec+="/resources/xml/guestXML.xml";
		
		// XML을 String으로 반환
		result = apiSerializer.receiveToString(spec);
		
		return result;
	}
	
	// xml을 json으로 바꾼 것
	@GetMapping("jsonList2") 
	@ResponseBody
	public Map<String, Object> jsonList2(HttpServletRequest req) throws Exception { 
		String cp=req.getContextPath();
		String spec=req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+cp;
		spec+="/resources/xml/guestXML.xml";
		
		// xml을 파싱해서 결과를 Map(JSON)으로 반환
		Map<String, Object> model = service.serializeNode(spec);
		
		return model;
	}
	
	@RequestMapping(value="weather4", method=RequestMethod.GET, 
			produces="application/xml; charset=utf-8") // 전송할 컨텐츠 타입을 명시하는 것
	@ResponseBody
	public String weather4() throws Exception {
		String result = null;
		
		// 현재 지역 날씨
		String spec = "http://www.kma.go.kr/XML/weather/sfc_web_map.xml";
		result = apiSerializer.receiveToString(spec);
		
		return result;
	}
}
