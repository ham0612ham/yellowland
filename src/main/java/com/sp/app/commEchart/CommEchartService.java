package com.sp.app.commEchart;

import java.util.List;

public interface CommEchartService {
	public List<Long> zumposu(long dongNum);
	public List<Long> geupsu(long dongNum);
	public List<Long> pyeupsu(long dongNum);
	public List<Long> upzongbunpo(long dongNum);
	public List<String> upzongbunpo_up(List<Long> list);
	public List<Long> mechulak(long dongNum);
	public List<Long> mechulgunsu(long dongNum);
	public List<Double> yoilbyulMuchul(long dongNum);
	public List<Double> sigandebuelMechul(long dongNum);
	public List<Double> sungbuelMechul(long dongNum);
	public List<Double> sungbuelMechulThree(long dongNum);
	public List<Double> yoenryungbyulMechul(long dongNum);
	public List<Double> sungbyulYoenryungbyulYudongingu(long dongNum);
	public List<Long> gugeoinguSu(long dongNum);
	public List<Long> graph1Chart(String siguNum, String cateJobNum);
	public List<Long> graph2Chart(String siguNum, String cateJobNum);
	public List<Object> graph3Chart(String siguNum);
}
