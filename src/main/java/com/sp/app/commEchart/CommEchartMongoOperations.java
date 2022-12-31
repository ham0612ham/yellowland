package com.sp.app.commEchart;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.aggregation.GroupOperation;
import org.springframework.data.mongodb.core.aggregation.MatchOperation;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.stereotype.Service;

import com.sp.app.commercial.Sg_store;

@Service("commerEchart.commEchartMongoOperations")
public class CommEchartMongoOperations {
	@Autowired
	private MongoOperations mongo;
	
	final int[] yCode = {2021,2021,2022,2022,2022};
	final int[] qCode = {3,4,1,2,3};
	
	public List<Long> zumposu(long dongNum){
		List<Long> list = new ArrayList<Long>();
		List<Sg_store> result = null;
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_store> result1 = null;
		
		try {
			for(int i=0; i<yCode.length; i++) {
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]).and("dongNum").is(dongNum));
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
	
	public List<Long> geupsu(long dongNum){
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
	
	public List<Long> pyeupsu(long dongNum){
		List<Long> list = new ArrayList<Long>();
		List<Sg_store> result = null;
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_store> result1 = null;
		
		try {
			for(int i=0; i<yCode.length; i++) {
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]).and("dongNum").is(dongNum));
				groupOperation = Aggregation.group("dongNum").sum("closeSu").as("tot");
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
