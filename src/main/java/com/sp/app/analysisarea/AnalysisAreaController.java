package com.sp.app.analysisarea;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller(value = "analysisarea.analysisareaController")
@RequestMapping(value = "/analysis/area/*")
public class AnalysisareaController {
	
	@RequestMapping("main")
	public String main() throws Exception {

		return ".analysis.area";
	}
	
	@RequestMapping(value = "getHtml", method = RequestMethod.GET)
	public String getHtml(@RequestParam String fileName, Model model) {
		
		return "analysisFile/area/"+fileName;
	}
}
