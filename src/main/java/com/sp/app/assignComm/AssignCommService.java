package com.sp.app.assignComm;

import java.util.List;

public interface AssignCommService {
	public void insertAllComm(Community dto, String path) throws Exception;
	public void updateComm(Community dto) throws Exception;
	public void deleteComm(long num) throws Exception;
	
	public Community readComm(long num);
	public List<Community> readCommImg(long num);
	public List<Community> listComm();
	public long listCommCount();

}
