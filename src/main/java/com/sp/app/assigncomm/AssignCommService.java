package com.sp.app.assigncomm;

import java.util.List;

public interface AssignCommService {
	public void insertComm(Community dto) throws Exception;
	public void updateComm(Community dto) throws Exception;
	public void deleteComm(long num) throws Exception;
	
	public Community readComm(long num);
	public List<Community> listComm(String dongNum);

}
