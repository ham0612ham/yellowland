package com.sp.app.analysis;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller(value = "analysis.analysisController")
@RequestMapping(value = "/analysis/*")
public class AnalysisController {
	
	@RequestMapping("main")
	public String main() throws Exception {

		return ".analysis.main";
	}
}
