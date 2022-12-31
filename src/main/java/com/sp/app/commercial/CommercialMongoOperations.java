package com.sp.app.commercial;

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

@Service("commercial.commercialMongoOperations")
public class CommercialMongoOperations {
	@Autowired
	private MongoOperations mongo;
	
	public List<Sg_store_top10> list_sg_store_top10(){
		List<Sg_store_top10> list = null;
		try {
			BasicQuery query = new BasicQuery("{}");
			list = mongo.find(query, Sg_store_top10.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Sg_sales_top10> list_sg_sales_top10(){
		List<Sg_sales_top10> list = null;
		try {
			BasicQuery query = new BasicQuery("{}");
			list = mongo.find(query, Sg_sales_top10.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Sg_float_top10> list_sg_float_top10(){
		List<Sg_float_top10> list = null;
		try {
			BasicQuery query = new BasicQuery("{}");
			list = mongo.find(query, Sg_float_top10.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Sg_citizen_top10> list_sg_citizen_top10(){
		List<Sg_citizen_top10> list = null;
		try {
			BasicQuery query = new BasicQuery("{}");
			list = mongo.find(query, Sg_citizen_top10.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Sg_store_top10> list_sg_store_top10(List<Long> dongList){
		List<Sg_store_top10> list = new ArrayList<Sg_store_top10>();
		List<Sg_store> list1 = null;
		List<Sg_store> list2 = null;
		Sg_store_top10 top10 = null;
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		try {
			for(Long dong : dongList) {
				top10 = new Sg_store_top10();
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dong));
				groupOperation = Aggregation.group("dongNum").sum("storeSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				AggregationResults<Sg_store> result1 = mongo.aggregate(aggregation, "sg_store", Sg_store.class);
				list1 = result1.getMappedResults();
				
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(1).and("dongNum").is(dong));
				groupOperation = Aggregation.group("dongNum").sum("storeSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				AggregationResults<Sg_store> result2 = mongo.aggregate(aggregation, "sg_store", Sg_store.class);
				list2 = result2.getMappedResults();
				for(int i=0; i<list1.size(); i++) {
					Sg_store dto1 = list1.get(i);
					Sg_store dto2 = list2.get(i);
					top10.setChai(dto1.getTot()-dto2.getTot());
					top10.setDongNum(dong);
					float ratio = (float)(Math.round((float)(dto1.getTot()-dto2.getTot())*100/dto2.getTot()*10)/10.0);
					top10.setRatio(ratio);
				}
				if(top10.getDongNum() != 0) {
					list.add(top10);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Sg_sales_top10> list_sg_sales_top10(List<Long> dongList){
		List<Sg_sales_top10> list = new ArrayList<Sg_sales_top10>();
		List<Sg_sales> list1 = null;
		List<Sg_sales> list2 = null;
		Sg_sales_top10 top10 = null;
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		try {
			for(Long dong : dongList) {
				top10 = new Sg_sales_top10();
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dong));
				groupOperation = Aggregation.group("dongNum").sum("salesSu_quarter").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				AggregationResults<Sg_sales> result1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
				list1 = result1.getMappedResults();
				
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(1).and("dongNum").is(dong));
				groupOperation = Aggregation.group("dongNum").sum("salesSu_quarter").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				AggregationResults<Sg_sales> result2 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
				list2 = result2.getMappedResults();
				for(int i=0; i<list1.size(); i++) {
					Sg_sales dto1 = list1.get(i);
					Sg_sales dto2 = list2.get(i);
					top10.setChai(dto1.getTot()-dto2.getTot());
					top10.setDongNum(dong);
					float ratio = (float)(Math.round((float)(dto1.getTot()-dto2.getTot())*100/dto2.getTot()*10)/10.0);
					top10.setRatio(ratio);
				}
				if(top10.getDongNum() != 0) {
					list.add(top10);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Sg_float_top10> list_sg_float_top10(List<Long> dongList){
		List<Sg_float_top10> list = new ArrayList<Sg_float_top10>();
		List<Sg_float> list1 = null;
		List<Sg_float> list2 = null;
		Sg_float_top10 top10 = null;
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		try {
			for(Long dong : dongList) {
				top10 = new Sg_float_top10();
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dong));
				groupOperation = Aggregation.group("dongNum").sum("floSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				AggregationResults<Sg_float> result1 = mongo.aggregate(aggregation, "sg_float", Sg_float.class);
				list1 = result1.getMappedResults();
				
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(2).and("dongNum").is(dong));
				groupOperation = Aggregation.group("dongNum").sum("floSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				AggregationResults<Sg_float> result2 = mongo.aggregate(aggregation, "sg_float", Sg_float.class);
				list2 = result2.getMappedResults();
				for(int i=0; i<list1.size(); i++) {
					Sg_float dto1 = list1.get(i);
					Sg_float dto2 = list2.get(i);
					top10.setChai(dto1.getTot()-dto2.getTot());
					top10.setDongNum(dong);
					float ratio = (float)(Math.round((float)(dto1.getTot()-dto2.getTot())*100/dto2.getTot()*10)/10.0);
					top10.setRatio(ratio);
				}
				if(top10.getDongNum() != 0) {
					list.add(top10);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Sg_citizen_top10> list_sg_citizen_top10(List<Long> dongList){
		List<Sg_citizen_top10> list = new ArrayList<Sg_citizen_top10>();
		List<Sg_citizen> list1 = null;
		Sg_citizen_top10 top10 = null;
		try {
			for(Long dong : dongList) {
				top10 = new Sg_citizen_top10();
				MatchOperation matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dong));
				GroupOperation groupOperation = Aggregation.group("dongNum").sum("citizenSu").as("tot");
				Aggregation aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				AggregationResults<Sg_citizen> result1 = mongo.aggregate(aggregation, "sg_citizen", Sg_citizen.class);
				list1 = result1.getMappedResults();
				for(Sg_citizen dto:list1) {
					top10.setChai(dto.getTot());
					top10.setDongNum(dong);
					top10.setRatio(0);
				}
				if(top10.getDongNum() != 0) {
					list.add(top10);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Sg_store_top10> list_sg_store_top10(Form form, List<Long> dongList) {
		List<Sg_store_top10> list = new ArrayList<Sg_store_top10>();
		List<Sg_store> list1 = null;
		List<Sg_store> list2 = null;
		Sg_store_top10 top10 = null;
		
		String menu = form.getSelectMenu1();
		String work = form.getSelectWork();
		
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		try {
			for(Long dong : dongList) {
				top10 = new Sg_store_top10();
				if (menu.equals("all")) {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dong));
				} else if(work.equals("all")) {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dong).and("cateJobNum").is(menu));
				} else {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dong).and("wCode").is(work));
				}
				groupOperation = Aggregation.group("dongNum").sum("storeSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				AggregationResults<Sg_store> result1 = mongo.aggregate(aggregation, "sg_store", Sg_store.class);
				list1 = result1.getMappedResults();
				
				if (menu.equals("all")) {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(2).and("dongNum").is(dong));
				} else if(work.equals("all")) {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(2).and("dongNum").is(dong).and("cateJobNum").is(menu));
				} else {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(2).and("dongNum").is(dong).and("wCode").is(work));
				}
				groupOperation = Aggregation.group("dongNum").sum("storeSu").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				AggregationResults<Sg_store> result2 = mongo.aggregate(aggregation, "sg_store", Sg_store.class);
				list2 = result2.getMappedResults();
				for(int i=0; i<list1.size(); i++) {
					Sg_store dto1 = list1.get(i);
					Sg_store dto2 = list2.get(i);
					top10.setChai(dto1.getTot()-dto2.getTot());
					top10.setDongNum(dong);
					float ratio = (float)(Math.round((float)(dto1.getTot()-dto2.getTot())*100/dto2.getTot()*10)/10.0);
					top10.setRatio(ratio);
				}
				if(top10.getDongNum() != 0) {
					list.add(top10);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Sg_sales_top10> list_sg_sales_top10(Form form, List<Long> dongList) {
		List<Sg_sales_top10> list = new ArrayList<Sg_sales_top10>();
		List<Sg_sales> list1 = null;
		List<Sg_sales> list2 = null;
		Sg_sales_top10 top10 = null;
		
		String menu = form.getSelectMenu1();
		String work = form.getSelectWork();

		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		try {
			for(Long dong : dongList) {
				top10 = new Sg_sales_top10();
				if (menu.equals("all")) {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dong));
				} else if(work.equals("all")) {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dong).and("cateJobNum").is(menu));
				} else {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dong).and("wCode").is(work));
				}
				groupOperation = Aggregation.group("dongNum").sum("salesSu_quarter").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				AggregationResults<Sg_sales> result1 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
				list1 = result1.getMappedResults();
				
				if (menu.equals("all")) {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(2).and("dongNum").is(dong));
				} else if(work.equals("all")) {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(2).and("dongNum").is(dong).and("cateJobNum").is(menu));
				} else {
					matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(2).and("dongNum").is(dong).and("wCode").is(work));
				}
				groupOperation = Aggregation.group("dongNum").sum("salesSu_quarter").as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				AggregationResults<Sg_sales> result2 = mongo.aggregate(aggregation, "sg_sales", Sg_sales.class);
				list2 = result2.getMappedResults();
				for(int i=0; i<list1.size(); i++) {
					Sg_sales dto1 = list1.get(i);
					Sg_sales dto2 = list2.get(i);
					top10.setChai(dto1.getTot()-dto2.getTot());
					top10.setDongNum(dong);
					float ratio = (float)(Math.round((float)(dto1.getTot()-dto2.getTot())*100/dto2.getTot()*10)/10.0);
					top10.setRatio(ratio);
				}
				if(top10.getDongNum() != 0) {
					list.add(top10);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public List<Sg_float_top10> list_sg_float_top10(Form form, List<Long> dongList) {
		List<Sg_float_top10> list = new ArrayList<Sg_float_top10>();
		List<Sg_float> list1 = null;
		List<Sg_float> list2 = null;
		Sg_float_top10 top10 = null;
		String gender = form.getGender();
		gender = gender.equals("allGender") ? "" : "_"+gender;
		String week = form.getWeek();
		week = week.equals("allWeek") ? "" : "_"+week.substring(4);
		String age = form.getAge();
		age = age.equals("ageAll") ? "" : "_"+age.substring(3);
		String sum = "floSu"+age+week+gender;
		MatchOperation matchOperation = null;
		GroupOperation groupOperation = null;
		Aggregation aggregation = null;
		try {
			for(Long dong : dongList) {
				top10 = new Sg_float_top10();
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dong));
				groupOperation = Aggregation.group("dongNum").sum(sum).as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				AggregationResults<Sg_float> result1 = mongo.aggregate(aggregation, "sg_float", Sg_float.class);
				list1 = result1.getMappedResults();
				
				matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(2).and("dongNum").is(dong));
				groupOperation = Aggregation.group("dongNum").sum(sum).as("tot");
				aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				AggregationResults<Sg_float> result2 = mongo.aggregate(aggregation, "sg_float", Sg_float.class);
				list2 = result2.getMappedResults();
				for(int i=0; i<list1.size(); i++) {
					Sg_float dto1 = list1.get(i);
					Sg_float dto2 = list2.get(i);
					top10.setChai(dto1.getTot()-dto2.getTot());
					top10.setDongNum(dong);
					float ratio = (float)(Math.round((float)(dto1.getTot()-dto2.getTot())*100/dto2.getTot()*10)/10.0);
					top10.setRatio(ratio);
				}
				if(top10.getDongNum() != 0) {
					list.add(top10);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Sg_citizen_top10> list_sg_citizen_top10(Form form, List<Long> dongList) {
		List<Sg_citizen_top10> list = new ArrayList<Sg_citizen_top10>();
		List<Sg_citizen> list1 = null;
		Sg_citizen_top10 top10 = null;
		String gender = form.getGender();
		String age = form.getAge();
		String sum = null;
		GroupOperation groupOperation = null;
		try {
			for(Long dong : dongList) {
				top10 = new Sg_citizen_top10();
				MatchOperation matchOperation = Aggregation.match(Criteria.where("yCode").is(2022).and("qCode").is(3).and("dongNum").is(dong));
				if (gender.equals("allGender") && age.equals("ageAll")) {
					groupOperation = Aggregation.group("dongNum").sum("citizenSu").as("tot");
				} else if (!gender.equals("allGender") && age.equals("ageAll")) {
					sum = gender.equals("male") ? "maleCitizenSu" : "femaleCitizenSu";
					groupOperation = Aggregation.group("dongNum").sum(sum).as("tot");
				} else if (gender.equals("allGender") && !age.equals("ageAll")) {
					sum = "citizenSu_"+age.substring(3);
					groupOperation = Aggregation.group("dongNum").sum(sum).as("tot");
				} else {
					sum = gender+"Su_"+age.substring(3);
					groupOperation = Aggregation.group("dongNum").sum(sum).as("tot");
				}
				
				Aggregation aggregation = Aggregation.newAggregation(matchOperation, groupOperation);
				AggregationResults<Sg_citizen> result1 = mongo.aggregate(aggregation, "sg_citizen", Sg_citizen.class);
				list1 = result1.getMappedResults();
				for(Sg_citizen dto:list1) {
					top10.setChai(dto.getTot());
					top10.setDongNum(dong);
					top10.setRatio(0);
				}
				if(top10.getDongNum() != 0) {
					list.add(top10);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
