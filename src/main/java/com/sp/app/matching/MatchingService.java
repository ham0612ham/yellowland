package com.sp.app.matching;

import java.util.List;


public interface MatchingService {
	public void insertMatching(Matching dto) throws Exception;
	public void updateMatching(Matching dto) throws Exception;
	public void deleteMatching(long num) throws Exception;
	
	public Matching readMatching(long num);
	public List<Matching> listMatching(String dongNum);

   public List<Matching> listSigu () throws Exception;
   public List<Matching> listDong (long siguNum) throws Exception;

}  

 
