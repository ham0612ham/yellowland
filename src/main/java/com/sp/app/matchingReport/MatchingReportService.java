package com.sp.app.matchingReport;

import java.util.List;

public interface MatchingReportService {
	public List<Long> jumpo(long dongNum);
	public List<Long> yongdoArea(long siguNum);
	public List<String> yongdoAreamost(List<Long>list);
	public List<Long> milzipdo(long dongNum);
	public List<String> milzipdoup(List<Long> list);
	public List<Long> imdae(long dongNum);
	
}
