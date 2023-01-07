$(function(){
	let menu = $(this).val();
	let dan = "개";
		
	let url = "/app/commercial/sg_store_top10";
		
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
				+item.chai+dan+"</div></div>";
			} else {
				objs.content = "<div class='marker' data-val='"+item.dongNum+"' data-name='"
				+item.dongName+"' data-lat='"
				+item.latitude+"' data-long='"
				+item.longitude+"'><div class=''></div><div class='marker-rank'><div class='marker-rank-img'><img style='width: 18px;' src='/app/resources/images/rank_"
				+color+".png'></div><div class='marker-rank-text' style='left: 41%;'><p>"
				+(index+1)+"</p></div></div><div class='marker-region-name'>"
				+item.dongName+"</div><div class='marker-sales-total'>"
				+item.chai+dan+"</div></div>";
			}
			
			objs.latlng = new kakao.maps.LatLng(item.latitude, item.longitude)
			obj2.push(objs);
				
			innerHtml += "<div class='ranks d-flex flex-row'><div class='rank'>"
				+(index+1)+"</div><div class='rank-region'>"+item.dongName
				+"</div><div class='rank-value'>"+item.chai
				+dan+"</div><div class='rank-percent'>"+item.ratio+"% "+ud+"</div></div><hr class='horiz'>";
		});
		$("#rank-lists").html(innerHtml);
		makeMap(level, lat1, long1, obj2);
		obj = obj2;
	}
	ajaxFun(url, "get", query, "json", fn);
});

$(function(){
	$("input[name=selectMenu]").change(function(){
		let menu = $(this).val();
		let dan = "";
		
		let url = "";
		switch (menu) {
			case 'stoCou' : url = "/app/commercial/sg_store_top10"; dan = "개"; break;
			case 'sales' : url = "/app/commercial/sg_sales_top10"; dan = "억"; break;
			case 'mPop' : url = "/app/commercial/sg_float_top10"; dan = "명"; break;
			case 'hPop' : url = "/app/commercial/sg_citizen_top10"; dan = "명"; break;
		}
		
		let siguNum = $("select[name=categoryGu]").val();
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
				let pcolor = item.ratio >= 0 && item.chai >= 0 ? "" : "rank-per-red";
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
					+item.chai+dan+"</div></div>";
				} else {
					objs.content = "<div class='marker' data-val='"+item.dongNum+"' data-name='"
					+item.dongName+"' data-lat='"
					+item.latitude+"' data-long='"
					+item.longitude+"'><div class=''></div><div class='marker-rank'><div class='marker-rank-img'><img style='width: 18px;' src='/app/resources/images/rank_"
					+color+".png'></div><div class='marker-rank-text' style='left: 41%;'><p>"
					+(index+1)+"</p></div></div><div class='marker-region-name'>"
					+item.dongName+"</div><div class='marker-sales-total'>"
					+item.chai+dan+"</div></div>";
				}
				
				objs.latlng = new kakao.maps.LatLng(item.latitude, item.longitude)
				obj2.push(objs);
				
				innerHtml += "<div class='ranks d-flex flex-row'><div class='rank'>"
					+(index+1)+"</div><div class='rank-region'>"+item.dongName
					+"</div><div class='rank-value'>"+item.chai
					+dan+"</div><div class='rank-percent "+pcolor+"'>"+item.ratio+"% "+ud+"</div></div><hr class='horiz'>";
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
	});
});

$(function(){
	$(".btn-send").click(function(){
		let selectedMenu = $("input[name=selectedMenu]").val();
		let siguName = $("#select-Gu").val();
		let dan = "";
		$("input[name=siguNum]").val(siguName);
		let siguNum = $("select[name=categoryGu]").val();
		
		let level = 8;
		let lat1 = 37.5729503;
		let long1 = 126.9793579;
		let innerHtml = '';
		let url  = "";
		
		switch (selectedMenu) {
			case 'stoCou' : url = "/app/commercial/getStoCouRankLists"; dan = "개"; break;
			case 'sales' : url = "/app/commercial/getSalesRankLists"; dan = "억"; break;
			case 'mPop' : url = "/app/commercial/getMPopRankLists"; dan = "명"; break;
			case 'hPop' : url = "/app/commercial/getHPopRankLists"; dan = "명"; break;
		}
		let query = $(this).closest("form").serialize();
		
		const fn = function(data) {
			let obj2 = new Array();
			$(data.list).each(function(index, item){
				let ud = item.ratio >= 0 && item.chai >= 0 ? "↑" : "↓";
				let color = "white";
				let pcolor = item.ratio >= 0 && item.chai >= 0 ? "" : "rank-per-red";
				if(index < 3) color = "yellow";
				let objs = new Object();
				objs.content = "<div class='marker' data-val='"+item.dongNum+"' data-name='"+item.dongName+"' data-lat='"+item.latitude+"' data-long='"+item.longitude+"'><div class=''></div><div class='marker-rank'><div class='marker-rank-img'><img style='width: 18px;' src='/app/resources/images/rank_"+color+".png'></div><div class='marker-rank-text'><p>"+(index+1)+"</p></div></div><div class='marker-region-name'>"+item.dongName+"</div><div class='marker-sales-total'>"+item.chai+dan+"</div></div>";
				objs.latlng = new kakao.maps.LatLng(item.latitude, item.longitude)
				obj2.push(objs);
				
				innerHtml += "<div class='ranks d-flex flex-row'><div class='rank'>"
							+(index+1)+"</div><div class='rank-region'>"+item.dongName
							+"</div><div class='rank-value'>"+item.chai
							+dan+"</div><div class='rank-percent "+pcolor+"'>"+item.ratio+"% "+ud+"</div></div><hr class='horiz'>";
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
	});
});