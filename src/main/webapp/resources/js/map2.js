// 주거인구를 눌렀을 때
$(function(){
	$("#hPop-lav").click(function(){
		let url = "/app/commercial/sg_citizen_top10";
		let siguNum = $("select[name=categoryGu]").val();
		// let gender = $("input[name=gender]").val();
		let level = 8;
		let lat1 = 37.5729503;
		let long1 = 126.9793579;
		let innerHtml = '';
		let query = "siguNum="+siguNum;
		
		const fn = function(data) {
			console.log("갔다옴");
			let obj2 = new Array();
			$(data.list).each(function(index, item){
				let color = "white";
				if(index < 3) color = "yellow";
				let objs = new Object();
				objs.content = "<div class='marker' data-val='"+item.dongNum+"' data-name='"+item.dongName+"' data-lat='"+item.latitude+"' data-long='"+item.longitude+"'><div class=''></div><div class='marker-rank'><div class='marker-rank-img'><img style='width: 18px;' src='/app/resources/images/rank_"+color+".png'></div><div class='marker-rank-text'><p>"+(index+1)+"</p></div></div><div class='marker-region-name'>"+item.dongName+"</div><div class='marker-sales-total'>"+item.chai+"명</div></div>";
				objs.latlng = new kakao.maps.LatLng(item.latitude, item.longitude)
				obj2.push(objs);
				
				innerHtml += "<div class='ranks d-flex flex-row'><div class='rank'>"
							+(index+1)+"</div><div class='rank-region'>"+item.dongName
							+"</div><div class='rank-value'>"+item.chai
							+"명</div><div class='rank-percent'>"+item.ratio+"% ↑</div></div><hr class='horiz'>";
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
		let siguNum = $("select[name=categoryGu]").val();
		let siguName = $("#select-Gu").val();
		$("input[name=category]").val(siguNum);
		$("input[name=gu]").val(siguName);
		
		let level = 8;
		let lat1 = 37.5729503;
		let long1 = 126.9793579;
		let innerHtml = '';
		
		let url = "/app/commercial/getRankLists?"
		let query = $(this).closest("form").serialize();
		query += "&siguNum="+siguNum;
		
		alert(query);
		
		const fn = function(data) {
			console.log("갔다옴");
		}
		ajaxFun(url, "get", query, "json", fn);
	});
});