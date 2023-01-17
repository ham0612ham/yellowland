package com.sp.app.myReply;

import java.util.List;
import java.util.Map;

public interface MyReplyService {
	public List<MyReply>listMyReply(Map<String, Object>map);
	public int dataCount(Map<String, Object>map);
	public MyReply readMyReply(long num);
}
