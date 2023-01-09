package com.sp.app.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("member.memberController")
@RequestMapping(value = "/member/*")
public class MemberController {
	@Autowired
	private MemberService service;

	@RequestMapping(value = "member", method = RequestMethod.GET)
	public String memberForm(Model model) {
		model.addAttribute("mode", "member");
		return ".member.member";
	}

	@RequestMapping(value = "member", method = RequestMethod.POST)
	public String memberSubmit(Member dto,
			final RedirectAttributes reAttr,
			Model model) {

		try {
			service.insertMember(dto);
		} catch (DuplicateKeyException e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "아이디 중복으로 회원가입이 실패했습니다.");
			return ".member.member";
		} catch (DataIntegrityViolationException e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "제약 조건 위반으로 회원가입이 실패했습니다.");
			return ".member.member";
		} catch (Exception e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "회원가입이 실패했습니다.");
			return ".member.member";
		}

		StringBuilder sb = new StringBuilder();
		sb.append(dto.getUserName() + "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
		sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");

		// 리다이렉트된 페이지에 값 넘기기
		reAttr.addFlashAttribute("message", sb.toString());
		reAttr.addFlashAttribute("title", "회원 가입");

		return "redirect:/member/complete";
	}

	@RequestMapping(value = "complete")
	public String complete(@ModelAttribute("message") String message) throws Exception {

		if (message == null || message.length() == 0) // F5를 누른 경우
			return "redirect:/";

		return ".member.complete";
	}
	
	@RequestMapping(value = "login")
	public String loginForm() {
		return ".member.login";
	}
	
	@GetMapping("noAuthorized")
	public String noAuthorized() {
		return ".member.noAuthorized";
	}

	@GetMapping("expired")
	public String expired() {
		return ".member.expired";
	}

	@RequestMapping(value = "pwd", method = RequestMethod.GET)
	public String pwdForm(String dropout, Model model) {

		if (dropout == null) {
			model.addAttribute("mode", "update");
		} else {
			model.addAttribute("mode", "dropout");
		}

		return ".member.pwd";
	}

	@RequestMapping(value = "pwd", method = RequestMethod.POST)
	public String pwdSubmit(@RequestParam String userPwd,
			@RequestParam String mode, 
			final RedirectAttributes reAttr,
			HttpSession session,
			Model model) {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Member dto = service.readMember(info.getUserId());
		if (dto == null) {
			session.invalidate();
			return "redirect:/";
		}

		boolean bPwd = service.isPasswordCheck(info.getUserId(), userPwd);
		
		if (! bPwd ) {
			if (mode.equals("update")) {
				model.addAttribute("mode", "update");
			} else {
				model.addAttribute("mode", "dropout");
			}
			model.addAttribute("message", "패스워드가 일치하지 않습니다.");
			return ".member.pwd";
		}

		if (mode.equals("dropout")) {
			session.removeAttribute("member");
			session.invalidate();

			StringBuilder sb = new StringBuilder();
			sb.append(dto.getUserName() + "님의 회원 탈퇴 처리가 정상적으로 처리되었습니다.<br>");
			sb.append("메인화면으로 이동 하시기 바랍니다.<br>");

			reAttr.addFlashAttribute("title", "회원 탈퇴");
			reAttr.addFlashAttribute("message", sb.toString());

			return "redirect:/member/complete";
		}

		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		return ".member.member";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(Member dto,
			final RedirectAttributes reAttr,
			Model model) {

		try {
			service.updateMember(dto);
		} catch (Exception e) {
		}

		StringBuilder sb = new StringBuilder();
		sb.append(dto.getUserName() + "님의 회원정보가 정상적으로 변경되었습니다.<br>");
		sb.append("메인화면으로 이동 하시기 바랍니다.<br>");

		reAttr.addFlashAttribute("title", "회원 정보 수정");
		reAttr.addFlashAttribute("message", sb.toString());

		return "redirect:/member/complete";
	}

	@RequestMapping(value = "userIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> idCheck(@RequestParam String userId) throws Exception {

		String p = "true";
		Member dto = service.readMember(userId);
		if (dto != null) {
			p = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("passed", p);
		return model;
	}
	
	@RequestMapping(value="pwdFind", method=RequestMethod.GET)
	public String pwdFindForm(HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info != null) {
			return "redirect:/";
		}
		
		return ".member.pwdFind";
	}
	
	@RequestMapping(value = "pwdFind", method = RequestMethod.POST)
	public String pwdFindSubmit(@RequestParam String userId,
			RedirectAttributes reAttr,
			Model model) throws Exception {
		
		Member dto = service.readMember(userId);
		if(dto == null || dto.getEmail() == null || dto.getEnabled() == 0) {
			model.addAttribute("message", "등록된 아이디가 아닙니다.");
			return ".member.pwdFind";
		}
		
		try {
			service.generatePwd(dto);
		} catch (Exception e) {
			model.addAttribute("message", "이메일 전송이 실패했습니다.");
			return ".member.pwdFind";
		}
		
		StringBuilder sb=new StringBuilder();
		sb.append("회원님의 이메일로 임시패스워드를 전송했습니다.<br>");
		sb.append("로그인 후 패스워드를 변경하시기 바랍니다.<br>");
		
		reAttr.addFlashAttribute("title", "패스워드 찾기");
		reAttr.addFlashAttribute("message", sb.toString());
		
		return "redirect:/member/complete";
	}
	
	@GetMapping("updatePwd")
	public String updatePwdForm() throws Exception {
		
		return ".member.updatePwd";
	}
	
	@PostMapping("updatePwd")
	public String updatePwdFormSubmit(@RequestParam String userPwd,
			HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member dto = new Member();
		dto.setUserId(info.getUserId());
		dto.setUserPwd(userPwd);
		
		try {
			service.updatePwd(dto);
		} catch (RuntimeException e) { // 똑같을 때 RuntimeException예외를 이전에 발생시켜놨음
			model.addAttribute("message", "변경할 패스워드가 기존 패스워드와 일치 합니다.");
			return ".member.updatePwd";
		} catch (Exception e) {
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "confirmIdTel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> confirmIdTel(@RequestParam String userId,
			@RequestParam String tel) {
		Map<String, Object> mem = new HashMap<String, Object>();
		String state = null;
		mem.put("userId", userId);
		mem.put("tel", tel);
		
		try {
			state = service.confirmIdTel(mem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model; 
	}
	
	@RequestMapping(value = "confirmNameTel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> confirmNameTel(@RequestParam String userName,
			@RequestParam String tel) {
		Map<String, Object> mem = new HashMap<String, Object>();
		Map<String, Object> map = null;
		mem.put("userName", userName);
		mem.put("tel", tel);
		
		try {
			map = service.confirmNameTel(mem);
			System.out.println(map.get("userId"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", map.get("state"));
		model.put("userId", map.get("userId"));
		
		return model; 
	}
	
	@RequestMapping(value="idFind", method=RequestMethod.GET)
	public String idFind(HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info != null) {
			return "redirect:/";
		}
		
		return ".member.idFind";
	}
	
	@RequestMapping(value = "idFind", method = RequestMethod.POST)
	public String idFindSubmit(@RequestParam String userName,
			@RequestParam String tel,
			@RequestParam String userId,
			RedirectAttributes reAttr,
			Model model) throws Exception {
		System.out.println("실행중....");
		
		try {
			service.sendMail(userId);
		} catch (Exception e) {
			model.addAttribute("message", "이메일 전송이 실패했습니다.");
			return ".member.idFind";
		}
		
		StringBuilder sb=new StringBuilder();
		sb.append("회원님의 이메일로 아이디를 전송했습니다.<br>");
		
		reAttr.addFlashAttribute("title", "아이디 찾기");
		reAttr.addFlashAttribute("message", sb.toString());
		
		return "redirect:/member/complete";
	}
}
