package com.sp.app.typeCommunity;

import java.util.List;
import java.util.Map;

public interface TypeCommunityService {
	public void insertTypeCommunity(TypeCommunity dto) throws Exception;
	public List<TypeCommunity> listTypeCommunity(Map<String, Object> map);
	
}
