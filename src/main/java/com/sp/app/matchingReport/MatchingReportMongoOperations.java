package com.sp.app.matchingReport;

import java.util.ArrayList;
import java.util.List;

import org.apache.poi.util.SystemOutLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.aggregation.GroupOperation;
import org.springframework.data.mongodb.core.aggregation.MatchOperation;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.stereotype.Service;

import com.sp.app.commercial.Sg_rent_dong_h;
import com.sp.app.commercial.Sg_sales;
import com.sp.app.commercial.Sg_store;
import com.sp.app.matching.Sg_rent;
import com.sp.app.matching.Sg_rent_y;
import com.sp.app.matching.Sg_yongdo;

@Service("matchingReport.matchingReportMongoOperations")
public class MatchingReportMongoOperations {
	@Autowired
	private MongoOperations mongo;
	
	final int[] yCode = {2021,2021,2022,2022,2022};
	final int[] qCode = {3,4,1,2,3};
	final String[] cateJobNum = {"CS1","CS2","CS3"};
	
	
	public List<Long> yongdoArea(long siguNum){
		List<Long> list = new ArrayList<Long>();
		String[] yongdo = {"jooguArea","sangupArea","nokjiArea"};	
		List<Sg_yongdo> result = null;
		
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_yongdo> result1 = null;
		
	 
		
		try {
			for(int i=0; i<3; i++) {
				matchOperation = Aggregation.match(Criteria.where("siguNum").is(siguNum));
				groupOperation = Aggregation.group("siguNum").sum(yongdo[i]).as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_yongdo", Sg_yongdo.class);
				result = result1.getMappedResults();
				
				 System.out.print("결과"+result.get(0).getTot());
				list.add(result.get(0).getTot());
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Long> milzipdo(long dongNum){
		List<Long> list = new ArrayList<Long>();
		List<Sg_store> result = null;
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_store> result1 = null;
		
		try {
			for(int i=0; i<cateJobNum.length; i++) {
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("cateJobNum").is(cateJobNum[i]).and("dongNum").is(dongNum));
				groupOperation = Aggregation.group("dongNum").sum("storeSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_store", Sg_store.class);
				result = result1.getMappedResults();
				
				list.add(result.get(0).getTot());
			}
			for(int i=0; i<cateJobNum.length; i++) {
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(2).and("cateJobNum").is(cateJobNum[i]).and("dongNum").is(dongNum));
				groupOperation = Aggregation.group("dongNum").sum("storeSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_store", Sg_store.class);
				result = result1.getMappedResults();
				
				list.add(result.get(0).getTot());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Long> jumpo(long dongNum){
		List<Long> list = new ArrayList<Long>();
		List<Sg_store> result = null;
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_store> result1 = null;
		
		try {
			for(int i=0; i<yCode.length; i++) {
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]).and("dongNum").is(dongNum));
				groupOperation = Aggregation.group("dongNum").sum("openCount").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_store", Sg_store.class);
				result = result1.getMappedResults();
				
				list.add(result.get(0).getTot());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	

}