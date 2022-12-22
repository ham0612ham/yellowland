package com.sp.app.localCommunity;

import java.util.List;
import java.util.Map;

public interface LocalCommunityService {
	public void insertLocalCommunity(LocalCommunity dto) throws Exception;
	
	public List<LocalCommunity> ListLocalCommunity(Map<String, Object> map);
	
}
