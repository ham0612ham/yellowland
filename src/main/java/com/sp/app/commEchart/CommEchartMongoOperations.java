package com.sp.app.commEchart;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.aggregation.GroupOperation;
import org.springframework.data.mongodb.core.aggregation.MatchOperation;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.stereotype.Service;

import com.sp.app.commercial.Sg_citizen;
import com.sp.app.commercial.Sg_float;
import com.sp.app.commercial.Sg_float_top5;
import com.sp.app.commercial.Sg_sales;
import com.sp.app.commercial.Sg_sales_job;
import com.sp.app.commercial.Sg_store;

@Service("commerEchart.commEchartMongoOperations")
public class CommEchartMongoOperations {
	@Autowired
	private MongoOperations mongo;
	
	final int[] yCode = {2021,2021,2022,2022,2022};
	final int[] qCode = {3,4,1,2,3};
	final String[] cateJobNum = {"CS1","CS2","CS3"};
	
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
	
	public List<Long> upzongbunpo(long dongNum){
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
	
	public List<Long> mechulak(long dongNum) {
		List<Long> list = new ArrayList<Long>();
		List<Sg_sales> result = null;
		List<Sg_store> store = null;
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_sales> result1 = null;
		AggregationResults<Sg_store> store1 = null;
		
		long siguNum = dongNum / 1000;
		try {
			for(int i=0; i<5; i++) { // 선택 상권
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]).and("dongNum").is(dongNum));
				groupOperation = Aggregation.group("dongNum").sum("salesCost_quarter").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
				result = result1.getMappedResults();
				
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]).and("dongNum").is(dongNum));
				groupOperation = Aggregation.group("dongNum").sum("storeSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				store1 = mongo.aggregate(aggregation, "sg_store", Sg_store.class);
				store = store1.getMappedResults();
				
				list.add(result.get(0).getTot()/3/store.get(0).getTot());
			}
			for(int i=0; i<5; i++) { // 자치구
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]).and("siguNum").is(siguNum));
				groupOperation = Aggregation.group("siguNum").sum("salesCost_quarter").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
				result = result1.getMappedResults();
				
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]).and("siguNum").is(siguNum));
				groupOperation = Aggregation.group("siguNum").sum("storeSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				store1 = mongo.aggregate(aggregation, "sg_store", Sg_store.class);
				store = store1.getMappedResults();
				
				list.add(result.get(0).getTot()/3/store.get(0).getTot());
			}
			for(int i=0; i<5; i++) { // 서울시
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]));
				groupOperation = Aggregation.group().sum("salesCost_quarter").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
				result = result1.getMappedResults();
				
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]));
				groupOperation = Aggregation.group().sum("storeSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				store1 = mongo.aggregate(aggregation, "sg_store", Sg_store.class);
				store = store1.getMappedResults();
				
				list.add(result.get(0).getTot()/3/store.get(0).getTot());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Long> mechulgunsu(long dongNum) {
		List<Long> list = new ArrayList<Long>();
		List<Sg_sales> result = null;
		List<Sg_store> store = null;
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_sales> result1 = null;
		AggregationResults<Sg_store> store1 = null;
		
		long siguNum = dongNum / 1000;
		try {
			for(int i=0; i<5; i++) { // 선택 상권
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]).and("dongNum").is(dongNum));
				groupOperation = Aggregation.group("dongNum").sum("salesSu_quarter").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
				result = result1.getMappedResults();
				
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]).and("dongNum").is(dongNum));
				groupOperation = Aggregation.group("dongNum").sum("storeSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				store1 = mongo.aggregate(aggregation, "sg_store", Sg_store.class);
				store = store1.getMappedResults();
				
				list.add(result.get(0).getTot()/3/store.get(0).getTot());
			}
			for(int i=0; i<5; i++) { // 자치구
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]).and("siguNum").is(siguNum));
				groupOperation = Aggregation.group("siguNum").sum("salesSu_quarter").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
				result = result1.getMappedResults();
				
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]).and("siguNum").is(siguNum));
				groupOperation = Aggregation.group("siguNum").sum("storeSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				store1 = mongo.aggregate(aggregation, "sg_store", Sg_store.class);
				store = store1.getMappedResults();
				
				list.add(result.get(0).getTot()/3/store.get(0).getTot());
			}
			for(int i=0; i<5; i++) { // 서울시
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]));
				groupOperation = Aggregation.group().sum("salesSu_quarter").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
				result = result1.getMappedResults();
				
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]));
				groupOperation = Aggregation.group().sum("storeSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				store1 = mongo.aggregate(aggregation, "sg_store", Sg_store.class);
				store = store1.getMappedResults();
				
				list.add(result.get(0).getTot()/3/store.get(0).getTot());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Double> yoilbyulMuchul(long dongNum){
		List<Double> list = new ArrayList<Double>();
		String[] week = {"salesCost_Mon", "salesCost_Tue", "salesCost_Wed", "salesCost_Thu", "salesCost_Fri", "salesCost_Sat", "salesCost_Sun"};
		List<Sg_sales> result = null;
		List<Sg_sales> sumResult = null;
		long sum = 0;
		
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_sales> result1 = null;
		AggregationResults<Sg_sales> sumResult1 = null;
		
		try {
			for(int i=0; i<7; i++) {
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dongNum));
				groupOperation = Aggregation.group("dongNum").sum(week[i]).as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				sumResult1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
				sumResult = sumResult1.getMappedResults();
				
				sum += sumResult.get(0).getTot();
			}
			
			for(int i=0; i<7; i++) {
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dongNum));
				groupOperation = Aggregation.group("dongNum").sum(week[i]).as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
				result = result1.getMappedResults();
				
				list.add(Math.round((double)(result.get(0).getTot() * 100)/sum*10)/10.0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Double> sigandebuelMechul(long dongNum){
		List<Double> list = new ArrayList<Double>();
		String[] sigan = {"salesCost_0006", "salesCost_0611", "salesCost_1114", "salesCost_1417", "salesCost_1721", "salesCost_2124"};
		List<Sg_sales> result = null;
		List<Sg_sales> sumResult = null;
		long sum = 0;
		
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_sales> result1 = null;
		AggregationResults<Sg_sales> sumResult1 = null;
		
		try {
			for(int i=0; i<6; i++) {
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dongNum));
				groupOperation = Aggregation.group("dongNum").sum(sigan[i]).as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				sumResult1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
				sumResult = sumResult1.getMappedResults();
				
				sum += sumResult.get(0).getTot();
			}
			
			for(int i=0; i<6; i++) {
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dongNum));
				groupOperation = Aggregation.group("dongNum").sum(sigan[i]).as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
				result = result1.getMappedResults();
				
				list.add(Math.round((double)(result.get(0).getTot() * 100)/sum*10)/10.0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Double> sungbuelMechul(long dongNum){
		List<Double> list = new ArrayList<Double>();
		String[] gender = {"salesCost_male", "salesCost_female"};
		List<Sg_sales> result = null;
		List<Sg_sales> sumResult = null;
		long sum = 0;
		
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_sales> result1 = null;
		AggregationResults<Sg_sales> sumResult1 = null;
		
		try {
			for(int i=0; i<2; i++) {
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dongNum));
				groupOperation = Aggregation.group("dongNum").sum(gender[i]).as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				sumResult1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
				sumResult = sumResult1.getMappedResults();
				
				sum += sumResult.get(0).getTot();
			}
			
			for(int i=0; i<2; i++) {
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dongNum));
				groupOperation = Aggregation.group("dongNum").sum(gender[i]).as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
				result = result1.getMappedResults();
				
				list.add(Math.round((double)(result.get(0).getTot() * 100)/sum*10)/10.0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Double> sungbuelMechulThree(long dongNum){
		List<Double> list = new ArrayList<Double>();
		String[] gender = {"salesCost_male", "salesCost_female"};
		String[] cate = {"CS1", "CS2", "CS3"};
		List<Sg_sales> result = null;
		List<Sg_sales> sumResult = null;
		long sum;
		
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_sales> result1 = null;
		AggregationResults<Sg_sales> sumResult1 = null;
		
		try {
			for(int n=0; n<cate.length; n++) {
				sum = 0;
				for(int i=0; i<gender.length; i++) {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dongNum).and("cateJobNum").is(cate[n]));
					groupOperation = Aggregation.group("dongNum").sum(gender[i]).as("tot");
					aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
					sumResult1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
					sumResult = sumResult1.getMappedResults();
					
					sum += sumResult.get(0).getTot();
				}
				for(int i=0; i<gender.length; i++) {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dongNum).and("cateJobNum").is(cate[n]));
					groupOperation = Aggregation.group("dongNum").sum(gender[i]).as("tot");
					aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
					result1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
					result = result1.getMappedResults();
					
					list.add(Math.round((double)(result.get(0).getTot() * 100)/sum*10)/10.0);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Double> yoenryungbyulMechul(long dongNum){
		List<Double> list = new ArrayList<Double>();
		String[] cate = {"CS1", "CS2", "CS3"};
		String[] age = {"salesCost_10", "salesCost_20", "salesCost_30", "salesCost_40", "salesCost_50", "salesCost_60" };
		List<Sg_sales> result = null;
		List<Sg_sales> sumResult = null;
		
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_sales> result1 = null;
		AggregationResults<Sg_sales> sumResult1 = null;
		
		try {
			for(int n=0; n<cate.length; n++) {
				long sum = 0;
				for(int i=0; i<6; i++) {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dongNum).and("cateJobNum").is(cate[n]));
					groupOperation = Aggregation.group("dongNum").sum(age[i]).as("tot");
					aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
					sumResult1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
					sumResult = sumResult1.getMappedResults();
					
					sum += sumResult.get(0).getTot();
				}
				
				for(int i=0; i<6; i++) {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dongNum).and("cateJobNum").is(cate[n]));
					groupOperation = Aggregation.group("dongNum").sum(age[i]).as("tot");
					aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
					result1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
					result = result1.getMappedResults();
					
					list.add(Math.round((double)(result.get(0).getTot() * 100)/sum*10)/10.0);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Double> sungbyulYoenryungbyulYudongingu(long dongNum){
		List<Double> list = new ArrayList<Double>();
		String[] genderAge = {"floSu_10_male", "floSu_20_male", "floSu_30_male", "floSu_40_male", "floSu_50_male", "floSu_60_male"
				,"floSu_10_female", "floSu_20_female", "floSu_30_female", "floSu_40_female", "floSu_50_female", "floSu_60_female"};
		List<Sg_float> result = null;
		List<Sg_float> sumResult = null;
		long sum = 0;
		
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_float> result1 = null;
		AggregationResults<Sg_float> sumResult1 = null;
		
		try {
			for(int i=0; i<12; i++) {
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dongNum));
				groupOperation = Aggregation.group("dongNum").sum(genderAge[i]).as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				sumResult1 = mongo.aggregate(aggregation, "sg_float", Sg_float.class);
				sumResult = sumResult1.getMappedResults();
				
				sum += sumResult.get(0).getTot();
			}
			
			for(int i=0; i<12; i++) {
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dongNum));
				groupOperation = Aggregation.group("dongNum").sum(genderAge[i]).as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_float", Sg_float.class);
				result = result1.getMappedResults();
				
				list.add(Math.round((double)(result.get(0).getTot() * 100)/sum*10)/10.0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Long> gugeoinguSu(long dongNum) {
		List<Long> list = new ArrayList<Long>();
		List<Sg_citizen> result = null;
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_citizen> result1 = null;
		
		long siguNum = dongNum / 1000;
		try {
			for(int i=0; i<5; i++) { // 선택 상권
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]).and("dongNum").is(dongNum));
				groupOperation = Aggregation.group("dongNum").sum("citizenSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_citizen", Sg_citizen.class);
				result = result1.getMappedResults();
				
				list.add(result.get(0).getTot());
			}
			for(int i=0; i<5; i++) { // 자치구
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]).and("siguNum").is(siguNum));
				groupOperation = Aggregation.group("siguNum").sum("citizenSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_citizen", Sg_citizen.class);
				result = result1.getMappedResults();
				
				list.add(result.get(0).getTot());
			}
			for(int i=0; i<5; i++) { // 서울시
				matchOperation = Aggregation.match(Criteria.where("yCode").is(yCode[i]).and("qCode").is(qCode[i]));
				groupOperation = Aggregation.group().sum("citizenSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_citizen", Sg_citizen.class);
				result = result1.getMappedResults();
				
				list.add(result.get(0).getTot());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Long> graph1Chart(String siguNum, String cateJobNum){
		List<Long> list = new ArrayList<>();
		List<Sg_store> result = null;
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_store> result1 = null;
		
		int[] y = {2022, 2022, 2022, 2021};
		int[] q = {3,3,2,3};
		String[] s = {"storeSu", "franSu", "storeSu", "storeSu"};
		
		try {
			for(int i=0; i<4; i++) {
				if(cateJobNum.equals("all") && siguNum.equals("all")) {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(y[i]).and("qCode").is(q[i]));
				} else if (!cateJobNum.equals("all") && siguNum.equals("all")) {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(y[i]).and("qCode").is(q[i]).and("cateJobNum").is(cateJobNum));
				} else if (cateJobNum.equals("all") && !siguNum.equals("all")) {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(y[i]).and("qCode").is(q[i]).and("siguNum").is(Integer.parseInt(siguNum)));
				} else if (!cateJobNum.equals("all") && !siguNum.equals("all")) {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(y[i]).and("qCode").is(q[i]).and("siguNum").is(Integer.parseInt(siguNum)).and("cateJobNum").is(cateJobNum));
				}
				groupOperation = Aggregation.group("siguNum").sum(s[i]).as("tot");
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
	

	public List<Long> sg_sales_job(String siguNum, String cateJobNum){
		List<Long> list = new ArrayList<>();
		List<Sg_sales_job> result = null;
		MatchOperation matchOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_sales_job> result1 = null;
		int[] y = {2022, 2022, 2021};
		int[] q = {3,2,3};
		
		try {
			for(int i=0; i<3; i++) {
				matchOperation = Aggregation.match(Criteria.where("yCode").is(y[i]).and("qCode").is(q[i]).and("cateJobNum").is(cateJobNum));
				aggregation = Aggregation.newAggregation(matchOperation);
				result1 = mongo.aggregate(aggregation, "sg_sales_job", Sg_sales_job.class);
				result = result1.getMappedResults();
				
				list.add(result.get(0).getTot()/100000000);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Long> graph2Chart(String siguNum, String cateJobNum){
		List<Long> list = new ArrayList<>();
		List<Sg_sales> result = null;
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_sales> result1 = null;
		int[] y = {2022, 2022, 2021};
		int[] q = {3,2,3};
		
		try {
			for(int i=0; i<3; i++) {
				if(cateJobNum.equals("all")) {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(y[i]).and("qCode").is(q[i]).and("siguNum").is(Integer.parseInt(siguNum)));
				} else {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(y[i]).and("qCode").is(q[i]).and("siguNum").is(Integer.parseInt(siguNum)).and("cateJobNum").is(cateJobNum));
				}
				groupOperation = Aggregation.group("siguNum").sum("salesCost_quarter").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
				result = result1.getMappedResults();
				
				list.add(result.get(0).getTot()/100000000);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Sg_float_top5> sg_float_top5() {
		List<Sg_float_top5> list = null;
		try {
			BasicQuery query = new BasicQuery("{}");
			list = mongo.find(query, Sg_float_top5.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Sg_float> graph3Chart(List<Long> dongList){
		List<Sg_float> list = new ArrayList<>();
		List<Sg_float> result = null;
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		AggregationResults<Sg_float> result1 = null;
		
		try {
			for(int i=0; i<dongList.size(); i++) {
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dongList.get(i)));
				groupOperation = Aggregation.group("dongNum").sum("floSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				result1 = mongo.aggregate(aggregation, "sg_float", Sg_float.class);
				result = result1.getMappedResults();
				
				list.add(result.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}