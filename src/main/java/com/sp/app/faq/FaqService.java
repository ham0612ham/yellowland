package com.sp.app.faq;

import java.util.List;
import java.util.Map;

public interface FaqService {
	public List<Faq> ListFaq(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Faq readFaq(long num);
}
