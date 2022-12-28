package com.sp.app.commercial;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
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
		System.out.println("개수 : " + list.size());
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
