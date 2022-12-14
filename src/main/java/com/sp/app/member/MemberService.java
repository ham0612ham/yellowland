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
	
	public void deleteMember(Map<String, Object> map) throws Exception;
	
	public void generatePwd(Member dto) throws Exception;
}
