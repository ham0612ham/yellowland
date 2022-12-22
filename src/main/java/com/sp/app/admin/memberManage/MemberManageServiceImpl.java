package com.sp.app.admin.memberManage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("admin.memberManage.memberManageService")
public class MemberManageServiceImpl implements MemberManageService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("memberManage.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Member> listMember(Map<String, Object> map) {
		List<Member> list = null;
		
		try {
			list = dao.selectList("memberManage.listMember", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Member readMember(String userId) {
		Member dto = null;

		try {
			dto = dao.selectOne("memberManage.readMember", userId);

			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail(s[0]);
					
				}

				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel(s[0]);
					
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	

	@Override
	public void updateFailureCountReset(String userId) throws Exception {
		try {
			dao.updateData("memberManage.updateFailureCountReset", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMemberEnabled(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("memberManage.updateMemberEnabled", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertMemberState(Member dto) throws Exception {
		try {
			dao.updateData("memberManage.insertMemberState", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Member> listMemberState(String userId) {
		List<Member> list = null;
		
		try {
			list = dao.selectList("memberManage.listMemberState", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Member readMemberState(String userId) {
		Member dto = null;

		try {
			dto = dao.selectOne("memberManage.readMemberState", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

}
