package com.sp.app.member;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.dao.CommonDAO;
import com.sp.app.mail.Mail;
import com.sp.app.mail.MailSender;
import com.sp.app.prop.PropReader;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO dao;

	@Autowired
	private MailSender mailSender;

	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Override
	public Member loginMember(String userId) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.loginMember", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void insertMember(Member dto) throws Exception {
		try {
			if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}

			if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}

			long memberSeq = dao.selectOne("member.memberSeq");
			dto.setMemberIdx(memberSeq);
			
			String encPassword = bcrypt.encode(dto.getUserPwd());
			dto.setUserPwd(encPassword);

			dao.insertData("member.insertMember", memberSeq);

			dao.updateData("member.insertMember12", dto);
			
			dto.setAuthority("ROLE_USER");
			dao.insertData("member.insertAuthority", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Member readMember(String userId) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.readMember", userId);

			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Member readMember(long memberIdx) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.readMember2", memberIdx);

			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateMembership(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("member.updateMembership", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateLastLogin(String userId) throws Exception {
		try {
			dao.updateData("member.updateLastLogin", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMember(Member dto) throws Exception {
		try {
			if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}

			if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}
			
			boolean bPwdUpdate = ! isPasswordCheck(dto.getUserId(), dto.getUserPwd());
			if( bPwdUpdate ) {
				String encPassword = bcrypt.encode(dto.getUserPwd());
				dto.setUserPwd(encPassword);
				
				dao.updateData("member.updateMember1", dto);
			}

			dao.updateData("member.updateMember2", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		try {
			map.put("membership", 0);
			updateMembership(map);

			dao.deleteData("member.deleteMember2", map);
			dao.deleteData("member.deleteMember1", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void generatePwd(Member dto) throws Exception {
		// 10 자리 임시 패스워드 생성
		PropReader prop = new PropReader();
		StringBuilder sb = new StringBuilder();
		Random rd = new Random();
		String s = "!@#$%^&*~-+ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
		for (int i = 0; i < 10; i++) {
			int n = rd.nextInt(s.length());
			sb.append(s.substring(n, n + 1));
		}

		String result;
		StringBuilder sb2 = new StringBuilder();
		sb2.append("<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%; background-color: #fff;\">");
		sb2.append("<tbody><tr><td><div style=\"margin: 0 auto; max-width: 720px; background-color: #fff; font-family: Malgun Gothic, Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;\">");
		sb2.append("<table cellpadding=\"0\" cellspacing=\"0\"style=\"width: 100%; margin: 0 auto; background-color: #fff; text-align: left; letter-spacing: -0.8px;\">");
		sb2.append("<tbody><tr><td colspan=\"3\" height=\"24\"></td></tr><tr><td colspan=\"3\" height=\"40\"></td></tr><tr><td width=\"16\"></td><td><table cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%; margin: 0; padding: 0\">");
		sb2.append("<tbody><tr><td style=\"font-weight: 300; font-size: 26px; color: #000; line-height: 36px; \">임시패스워드 발급 메일입니다.</td></tr><tr><td style=\"padding-top: 24px; font-weight: 400; font-size: 14px; font-family: 'Noto Sans KR'; color: #666; line-height: 22px; letter-spacing: -0.8px;\">");
		sb2.append("안녕하세요. ㈜노른자 입니다. <br> <br> 고객님의 임시 패스워드가 성공적으로 발급되어 안내드립니다. 아래 버튼을 누르면 로그인 페이지로 이동합니다. 로그인은 본 메일에 기재되어있는 새로 발급된 패스워드로 이용 부탁드립니다.\n 메일을 받으신 분이 요청한 본인이 아닐 경우, 아래 고객센터로 연락하시거나 1:1문의를 통해 문의 부탁드립니다. 찾아주시는 회원분들께 더 유익한 정보로 찾아뵙겠습니다. 감사합니다.");
		sb2.append("</td></tr></tbody></table></td><td width=\"16\"></td></tr><tr><td colspan=\"3\" height=\"40\"></td></tr><tr><td width=\"16\"></td><td><table cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%; margin: 0; padding: 0\">");
		sb2.append("<tbody><tr><td height=\"1\" style=\"background-color: #ccc;\"></td></tr></tbody></table></td><td width=\"16\"></td></tr><tr><td width=\"16\"></td><td><table cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%; margin: 0; padding: 0\">");
		sb2.append("<tbody><tr><td valign=\"top\" width=\"104\" style=\"padding-top: 9px; padding-right: 10px; padding-bottom: 9px; padding-left: 10px; font-weight: 400; font-size: 14px; font-family: 'Noto Sans KR'; color: #000; line-height: 22px; letter-spacing: -0.8px; background-color: #fbfbfb;\">임시 패스워드</td>");
		sb2.append("<td style=\"padding-top: 9px; padding-right: 10px; padding-bottom: 9px; padding-left: 14px; font-weight: 400; font-size: 14px; font-family: 'Noto Sans KR'; color: #666; line-height: 22px; letter-spacing: -0.8px;\">");
		sb2.append("<span style=\"font-family: 'Roboto'; font-size: 15px; letter-spacing: 0;\">"+sb.toString()+"</span></td></tr><tr><tr><td colspan=\"2\" height=\"1\" style=\"background-color: #eee;\"></td>");
		sb2.append("</tr></tbody></table></td><td width=\"16\"></td></tr><tr><td colspan=\"3\" height=\"48\"></td></tr><tr><td width=\"16\"></td><td><a href=\"http://localhost:9090/app/member/login\" style=\"display: block; padding-top: 12px; padding-bottom: 12px; font-weight: 700; font-size: 16px; font-family: 'noto sans kr'; color: #fff; text-align: center; line-: 24px; letter-spacing: -0.8px; background-color: #36C88A; border-radius: 24px; text-decoration: none;\" target=\"_blank\" rel=\"noreferrer noopener\">노른자 로그인하기</a>");
		sb2.append("</td><td width=\"16\"></td></tr><tr><td colspan=\"3\" height=\"48\"></td></tr><tr><td width=\"16\"></td><td><table cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%; margin: 0; padding: 0\">");
		sb2.append("<tbody><tr><td style=\"font-weight: 400; font-size: 14px; font-family: 'Noto Sans KR'; color: #666; line-height: 22px; letter-spacing: -0.8px;\">자세한 문의사항은 1:1문의나 자주묻는 질문에서 확인 가능합니다. <br>");
		sb2.append("<br></td></tr></tbody></table></td><td width=\"16\"></td></tr><tr><td colspan=\"3\" height=\"60\"></td>");
		sb2.append("</tr><tr><td colspan=\"3\" height=\"1\" style=\"background-color: #eee\"></td></tr><tr><td width=\"16\"></td><td><table cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%; margin: 0; padding: 0\"><tbody>");
		sb2.append("<tr><td height=\"23\"></td></tr><tr><td style=\"font-weight: 400; font-size: 12px; font-family: 'Noto Sans KR'; color: #888; line-height: 20px; letter-spacing: -0.8px;\">본 메일은 발신전용으로 회신이되지 않습니다.<br> 문의사항은 노른자 고객센터(<a href=\"tel:18119997\" name=\"ANCHOR4083\" style=\"font-weight: 700; text-decoration: underline;\" target=\"_blank\" rel=\"noreferrer noopener\"><font color=\"#888\">1212-3434</font></a>)를 이용해 주시기 바랍니다.");
		sb2.append("</td></tr></tbody></table></td><td width=\"16\"></td></tr></tbody></table></div></td></tr></tbody></table>");
		result = sb2.toString();

		Mail mail = new Mail();
		mail.setReceiverEmail(prop.readNaverEmail());

		mail.setSenderEmail(prop.readNaverEmail());
		mail.setSenderName("노른자");
		mail.setSubject("[노른자]에서 임시 패스워드 발급 드립니다.");
		mail.setContent(result);

		boolean b = mailSender.mailSend(mail);

		if (b) {
			dto.setUserPwd(sb.toString());
			updatePwd(dto); // 임시 패스워드를 저장
		} else {
			throw new Exception("이메일 전송중 오류가 발생했습니다.");
		}
	}

	@Override
	public boolean isPasswordCheck(String userId, String userPwd) {
		Member dto = readMember(userId);
		
		if(dto == null) {
			return false;
		}
		return bcrypt.matches(userPwd, dto.getUserPwd());
	}

	@Override
	public void updatePwd(Member dto) throws Exception {
		try {
			if(isPasswordCheck(dto.getUserId(), dto.getUserPwd())) {
				throw new RuntimeException("패스워드가 기존 패스워드와 일치합니다.");
			}
			
			String encPassword = bcrypt.encode(dto.getUserPwd());
			dto.setUserPwd(encPassword);
			
			dao.updateData("member.updateMember1", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			throw e;
		}
	}
//삭제는 번호를 확인하고 해야하니 dropout에서 하는게 맞지않을까해서 

	@Override
	public void dropoutMember(Member dto)throws Exception{
		try {
			if(isPasswordCheck(dto.getUserId(), dto.getUserPwd())) {
				throw new RuntimeException("패스워드가 기존 패스워드와 일치합니다.");
			}
			
			String encPassword = bcrypt.encode(dto.getUserPwd());
			dto.setUserPwd(encPassword);
			//dao.deleteData("member.dropoutMember",dto);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("membership", 0);
			updateMembership(map);		
			dao.deleteData("member.deleteMember2", map);
			dao.deleteData("member.deleteMember1", map);
		} catch (Exception e) {
			e.printStackTrace();
				throw e;
		}
			
	}
	
	@Override
	public int checkFailureCount(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("member.checkFailureCount", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public void updateFailureCount(String userId) throws Exception {
		try {
			dao.updateData("member.updateFailureCount", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateFailureCountReset(String userId) throws Exception {
		try {
			dao.updateData("member.updateFailureCountReset", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMemberEnabled(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("member.updateMemberEnabled", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertMemberState(Member dto) throws Exception {
		try {
			dao.insertData("member.insertMemberState", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public String confirmIdTel(Map<String, Object> map) throws Exception {
		String bool;
		Member member = null;
		
		try {
			member = dao.selectOne("member.confirmIdTel", map);
			if(member == null) {
				bool = "false";
			} else {
				bool = "true";
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return bool;
	}

	@Override
	public Map<String, Object> confirmNameTel(Map<String, Object> map) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		String bool;
		Member member = null;
		
		try {
			member = dao.selectOne("member.confirmNameTel", map);
			if(member == null) {
				bool = "false";
			} else {
				bool = "true";
				model.put("userId", member.getUserId());
				System.out.println(member.getUserId());
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		model.put("state", bool);
		return model;
	}
	
	@Override
	public void sendMail(String userId) throws Exception {
		PropReader prop = new PropReader();

		String result;
		StringBuilder sb2 = new StringBuilder();
		sb2.append("<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%; background-color: #fff;\">");
		sb2.append("<tbody><tr><td><div style=\"margin: 0 auto; max-width: 720px; background-color: #fff; font-family: Malgun Gothic, Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;\">");
		sb2.append("<table cellpadding=\"0\" cellspacing=\"0\"style=\"width: 100%; margin: 0 auto; background-color: #fff; text-align: left; letter-spacing: -0.8px;\">");
		sb2.append("<tbody><tr><td colspan=\"3\" height=\"24\"></td></tr><tr><td colspan=\"3\" height=\"40\"></td></tr><tr><td width=\"16\"></td><td><table cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%; margin: 0; padding: 0\">");
		sb2.append("<tbody><tr><td style=\"font-weight: 300; font-size: 26px; color: #000; line-height: 36px; \">아이디 알림 메일입니다.</td></tr><tr><td style=\"padding-top: 24px; font-weight: 400; font-size: 14px; font-family: 'Noto Sans KR'; color: #666; line-height: 22px; letter-spacing: -0.8px;\">");
		sb2.append("안녕하세요. ㈜노른자 입니다. <br> <br> 고객님께서 요청하신 아이디 안내차 메일 보내드립니다. 아래 버튼을 누르면 로그인 페이지로 이동합니다. 패스워드 재발급은 패스워드 재발급 페이지를 통해 이용 가능합니다.\n 메일을 받으신 분이 요청한 본인이 아닐 경우, 아래 고객센터로 연락하시거나 1:1문의를 통해 문의 부탁드립니다. 찾아주시는 회원분들께 더 유익한 정보로 찾아뵙겠습니다. 감사합니다.");
		sb2.append("</td></tr></tbody></table></td><td width=\"16\"></td></tr><tr><td colspan=\"3\" height=\"40\"></td></tr><tr><td width=\"16\"></td><td><table cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%; margin: 0; padding: 0\">");
		sb2.append("<tbody><tr><td height=\"1\" style=\"background-color: #ccc;\"></td></tr></tbody></table></td><td width=\"16\"></td></tr><tr><td width=\"16\"></td><td><table cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%; margin: 0; padding: 0\">");
		sb2.append("<tbody><tr><td valign=\"top\" width=\"104\" style=\"padding-top: 9px; padding-right: 10px; padding-bottom: 9px; padding-left: 10px; font-weight: 400; font-size: 14px; font-family: 'Noto Sans KR'; color: #000; line-height: 22px; letter-spacing: -0.8px; background-color: #fbfbfb;\">아이디</td>");
		sb2.append("<td style=\"padding-top: 9px; padding-right: 10px; padding-bottom: 9px; padding-left: 14px; font-weight: 400; font-size: 14px; font-family: 'Noto Sans KR'; color: #666; line-height: 22px; letter-spacing: -0.8px;\">");
		sb2.append("<span style=\"font-family: 'Roboto'; font-size: 15px; letter-spacing: 0;\">"+userId+"</span></td></tr><tr><tr><td colspan=\"2\" height=\"1\" style=\"background-color: #eee;\"></td>");
		sb2.append("</tr></tbody></table></td><td width=\"16\"></td></tr><tr><td colspan=\"3\" height=\"48\"></td></tr><tr><td width=\"16\"></td><td><a href=\"http://localhost:9090/app/member/login\" style=\"display: inline; padding: 12px 115px 12px 115px; font-weight: 700; font-size: 16px; font-family: 'noto sans kr'; color: #fff; text-align: center; line-: 24px; letter-spacing: -0.8px; background-color: #36C88A; border-radius: 24px; text-decoration: none; width: 45%;\" target=\"_blank\" rel=\"noreferrer noopener\">노른자 로그인하기</a>");
		sb2.append("<a href=\"http://localhost:9090/app/member/pwdFind\" style=\"display: inline; padding: 12px 125px 12px 125px; margin-left: 10px; font-weight: 700; font-size: 16px; font-family: 'noto sans kr'; color: #fff; text-align: center; line-: 24px; letter-spacing: -0.8px; background-color: #36C88A; border-radius: 24px; text-decoration: none; width: 45%;\" target=\"_blank\" rel=\"noreferrer noopener\">패스워드 찾기</a>");
		sb2.append("</td><td width=\"16\"></td></tr><tr><td colspan=\"3\" height=\"48\"></td></tr><tr><td width=\"16\"></td><td><table cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%; margin: 0; padding: 0\">");
		sb2.append("<tbody><tr><td style=\"font-weight: 400; font-size: 14px; font-family: 'Noto Sans KR'; color: #666; line-height: 22px; letter-spacing: -0.8px;\">자세한 문의사항은 1:1문의나 자주묻는 질문에서 확인 가능합니다. <br>");
		sb2.append("<br></td></tr></tbody></table></td><td width=\"16\"></td></tr><tr><td colspan=\"3\" height=\"60\"></td>");
		sb2.append("</tr><tr><td colspan=\"3\" height=\"1\" style=\"background-color: #eee\"></td></tr><tr><td width=\"16\"></td><td><table cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%; margin: 0; padding: 0\"><tbody>");
		sb2.append("<tr><td height=\"23\"></td></tr><tr><td style=\"font-weight: 400; font-size: 12px; font-family: 'Noto Sans KR'; color: #888; line-height: 20px; letter-spacing: -0.8px;\">본 메일은 발신전용으로 회신이되지 않습니다.<br> 문의사항은 노른자 고객센터(<a href=\"tel:18119997\" name=\"ANCHOR4083\" style=\"font-weight: 700; text-decoration: underline;\" target=\"_blank\" rel=\"noreferrer noopener\"><font color=\"#888\">1212-3434</font></a>)를 이용해 주시기 바랍니다.");
		sb2.append("</td></tr></tbody></table></td><td width=\"16\"></td></tr></tbody></table></div></td></tr></tbody></table>");
		result = sb2.toString();

		Mail mail = new Mail();
		mail.setReceiverEmail(prop.readNaverEmail());

		mail.setSenderEmail(prop.readNaverEmail());
		mail.setSenderName("노른자");
		mail.setSubject("[노른자]에서 아이디를 알려 드립니다.");
		mail.setContent(result);

		boolean b = mailSender.mailSend(mail);

		if (!b) {
			throw new Exception("이메일 전송중 오류가 발생했습니다.");
		}
	}

	@Override
	public Member detailMember(String userId) {
		Member dto=null;
		try {
			dto=dao.selectOne("member.detailMember",userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void deleteMember(String userId) throws Exception {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("membership", 0);
			updateMembership(map);
			dao.deleteData("member.deleteMember2",map);
			dao.deleteData("member.deleteMember1",map);
			//dao.deleteData("member.deleteMember2",userId);
			//dao.deleteData("member.deleteMember1",userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}



	
}
