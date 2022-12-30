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
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

@Service("commercial.commercialMongoOperations")
public class CommercialMongoOperations {
	@Autowired
	private MongoOperations mongo;
	
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
				list.add(top10);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Sg_store> list_sg_store(){
		List<Sg_store> list = null;
		try {
			Query query = new Query();
		    query.addCriteria(Criteria.where("dongNum").is(11680580).and("yCode").is(2022));
		    list = mongo.find(query, Sg_store.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
