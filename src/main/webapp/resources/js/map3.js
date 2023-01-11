$(function(){
	$("#rentDong").click(function(){
		$(".selectMenu").hide();
		$(".check-area-2").hide();
		$("#kijun").text("3.3㎡당 월 임대료, 2022년 3분기 기준");
	});
	
	$("#hotDong").click(function(){
		location.href="/app/commercial/map";
	});
});

$(function(){
	$("#rentDong").click(function(){
		let menu = $(this).val();
		let dan = "원";
			
		let url = "/app/commercial/getRentRankList";
			
		let level = 8;
		let lat1 = 37.5729503;
		let long1 = 126.9793579;
		let innerHtml = '';
		let query = "siguNum=all";
			
		const fn = function(data) {
			let obj2 = new Array();
			$(data.list).each(function(index, item){
				let ud = item.ratio >= 0 && item.chai >= 0 ? "↑" : "↓";
				let color = "white";
				if(index < 3) color = "yellow";
				let objs = new Object();
				
				if(index+1 < 10) {
					objs.content = "<div class='marker' data-val='"+item.dongNum+"' data-name='"
					+item.dongName+"' data-lat='"
					+item.latitude+"' data-long='"
					+item.longitude+"'><div class=''></div><div class='marker-rank'><div class='marker-rank-img'><img style='width: 18px;' src='/app/resources/images/rank_"
					+color+".png'></div><div class='marker-rank-text'><p>"
					+(index+1)+"</p></div></div><div class='marker-region-name'>"
					+item.dongName+"</div><div class='marker-sales-total'>"
					+item.q20223.toLocaleString()+dan+"</div></div>";
				} else {
					objs.content = "<div class='marker' data-val='"+item.dongNum+"' data-name='"
					+item.dongName+"' data-lat='"
					+item.latitude+"' data-long='"
					+item.longitude+"'><div class=''></div><div class='marker-rank'><div class='marker-rank-img'><img style='width: 18px;' src='/app/resources/images/rank_"
					+color+".png'></div><div class='marker-rank-text' style='left: 41%;'><p>"
					+(index+1)+"</p></div></div><div class='marker-region-name'>"
					+item.dongName+"</div><div class='marker-sales-total'>"
					+item.q20223.toLocaleString()+dan+"</div></div>";
				}
				
				console.log(objs.content);
				
				objs.latlng = new kakao.maps.LatLng(item.latitude, item.longitude)
				obj2.push(objs);
					
				innerHtml += "<div class='ranks d-flex flex-row'><div class='rank'>"
					+(index+1)+"</div><div class='rank-region'>"+item.dongName
					+"</div><div class='rank-value'>"+item.q20223.toLocaleString()
					+dan+"</div><div class='rank-percent'>"+item.siguName+"</div></div><hr class='horiz'>";
			});
			$("#rank-lists").html(innerHtml);
			makeMap(level, lat1, long1, obj2);
			obj = obj2;
		}
		ajaxFun(url, "get", query, "json", fn);
	});
});

$(function(){
	$("select[name=categoryGu]").change(function(){
		if($("#rentDong").is(":checked")) {
			let siguNum = $(this).val();
			let menu = $(this).val();
			let dan = "원";
			
			let url = "/app/commercial/getRentRankList";
			
			let level = 8;
			let lat1 = 37.5729503;
			let long1 = 126.9793579;
			let innerHtml = '';
			let query = "siguNum="+siguNum;
			
			const fn = function(data) {
				let obj2 = new Array();
				$(data.list).each(function(index, item){
					let ud = item.ratio >= 0 && item.chai >= 0 ? "↑" : "↓";
					let color = "white";
					if(index < 3) color = "yellow";
					let objs = new Object();
					
					if(index+1 < 10) {
						objs.content = "<div class='marker' data-val='"+item.dongNum+"' data-name='"
						+item.dongName+"' data-lat='"
						+item.latitude+"' data-long='"
						+item.longitude+"'><div class=''></div><div class='marker-rank'><div class='marker-rank-img'><img style='width: 18px;' src='/app/resources/images/rank_"
						+color+".png'></div><div class='marker-rank-text'><p>"
						+(index+1)+"</p></div></div><div class='marker-region-name'>"
						+item.dongName+"</div><div class='marker-sales-total'>"
						+item.q20223.toLocaleString()+dan+"</div></div>";
					} else {
						objs.content = "<div class='marker' data-val='"+item.dongNum+"' data-name='"
						+item.dongName+"' data-lat='"
						+item.latitude+"' data-long='"
						+item.longitude+"'><div class=''></div><div class='marker-rank'><div class='marker-rank-img'><img style='width: 18px;' src='/app/resources/images/rank_"
						+color+".png'></div><div class='marker-rank-text' style='left: 41%;'><p>"
						+(index+1)+"</p></div></div><div class='marker-region-name'>"
						+item.dongName+"</div><div class='marker-sales-total'>"
						+item.q20223.toLocaleString()+dan+"</div></div>";
					}
					
					console.log(objs.content);
					
					objs.latlng = new kakao.maps.LatLng(item.latitude, item.longitude)
					obj2.push(objs);
					
					innerHtml += "<div class='ranks d-flex flex-row'><div class='rank'>"
						+(index+1)+"</div><div class='rank-region'>"+item.dongName
						+"</div><div class='rank-value'>"+item.q20223.toLocaleString()
						+dan+"</div><div class='rank-percent'>"+item.siguName+"</div></div><hr class='horiz'>";
				});
				
				if (siguNum !== "all") {
					level = data.level;
					lat1 = data.lat1;
					long1 = data.long1;
				}
				
				$("#rank-lists").html(innerHtml);
				makeMap(level, lat1, long1, obj2);
				obj = obj2;
			}
			ajaxFun(url, "get", query, "json", fn);
		}
	});
});