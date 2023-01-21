package com.sp.app.member;

import java.util.Map;

public interface MemberService {
	public Member loginMember(String userId);
	
	public void insertMember(Member dto) throws Exception;
	
	public void updateMembership(Map<String, Object> map) throws Exception;
	public void updateLastLogin(String userId) throws Exception;
	public void updateMember(Member dto) throws Exception;
	
	public Member readMember(String userId);
	public Member readMember(long memberIdx);
	
	public void deleteMember(Map<String, Object> map) throws Exception;//탈퇴관련 
	
	public void generatePwd(Member dto) throws Exception;
	
	public boolean isPasswordCheck(String userId, String userPwd);
	public void updatePwd(Member dto) throws Exception;
	public int checkFailureCount(String userId);
	public void updateFailureCount(String userId) throws Exception;
	public void updateFailureCountReset(String userId) throws Exception;
	public void updateMemberEnabled(Map<String, Object> map) throws Exception;
	public void insertMemberState(Member dto) throws Exception;
	
	public String confirmIdTel(Map<String, Object> map) throws Exception;
	public Map<String, Object> confirmNameTel(Map<String, Object> map) throws Exception;
	public void sendMail(String userId) throws Exception;
	public void dropoutMember(Member dto) throws Exception;  //탈퇴관련 생각중 
	//public void dropoutMember(String userId) throws Exception; 
	public Member detailMember(String userId);
	public void deleteMember (String userId)throws Exception;
}
