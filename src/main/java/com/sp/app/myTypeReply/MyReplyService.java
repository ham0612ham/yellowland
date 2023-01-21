package com.sp.app.myTypeReply;

import java.util.List;
import java.util.Map;

public interface MyReplyService {
	public List<MyTypeReply>listMyReply(Map<String, Object>map);
	public int dataCount(Map<String, Object>map);
	public MyTypeReply readMyReply(long num);
}
