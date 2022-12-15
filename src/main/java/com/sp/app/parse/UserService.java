package com.sp.app.parse;

import java.util.Map;

public interface UserService {
	public Map<String, Object> serializeNode(String spec);
	public String documentWriter(String spec);
}
