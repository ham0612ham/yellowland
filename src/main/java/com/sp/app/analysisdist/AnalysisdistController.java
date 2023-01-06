package com.sp.app.analysisdist;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller(value = "analysisdist.analysisdistController")
@RequestMapping(value = "/analysis/dist/*")
public class AnalysisdistController {
	
	@RequestMapping("main")
	public String main() throws Exception {

		return ".analysis.dist";
	}
	
	@RequestMapping(value = "getHtml", method = RequestMethod.GET)
	public String getHtml(@RequestParam String fileName, Model model) {
		
		return "analysisFile/dist/"+fileName;
	}
}
