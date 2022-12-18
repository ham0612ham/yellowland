package com.sp.app.bringcate;

import java.util.List;

public interface BringcateService {
	public List<Bringcate> categoryJob() throws Exception;
	public List<Bringcate> job(String cateJobNum) throws Exception;
	public List<Bringcate> categoryGu() throws Exception;
	public List<Bringcate> dong(String siguNum) throws Exception;
}
