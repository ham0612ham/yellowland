package com.sp.app.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("mail.mailController")
@RequestMapping("/mail/*")
public class MailController {
	@Autowired
	private MailSender mailSender;
	
	@RequestMapping(value="send", method=RequestMethod.GET)
	public String sendForm(Model model) throws Exception {

		return ".mail.send";
	}

	@RequestMapping(value="send", method=RequestMethod.POST)
	public String sendSubmit(Mail dto, 
			final RedirectAttributes reAttr) throws Exception {
		
		boolean b=mailSender.mailSend(dto);
		
		String msg="<span style='color:'#36C88A';'>"+dto.getReceiverEmail()+"</span> 님에게<br>";
		if(b) {
			msg+="메일을 성공적으로 전송 했습니다.";
		} else {
			msg+="메일을 전송하는데 실패했습니다.";
		}
		
		reAttr.addFlashAttribute("message", msg);
		
		return "redirect:/mail/complete";
	}
	
	@RequestMapping(value="complete")
	public String complete(@ModelAttribute("message") String message) throws Exception{
		
		if(message==null || message.length()==0)
			return "redirect:/";
		
		return ".mail.complete";
	}
}
