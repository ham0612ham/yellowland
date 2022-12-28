// 주거인구를 눌렀을 때
$(function(){
	$("#hPop-lav").click(function(){
		let url = "/app/commercial/sg_citizen_top10";
		let siguNum = $("select[name=categoryGu]").val();
		query = "siguNum="+siguNum;
		const fn = function(data) {
			let obj = new Array();
			$(data).each(function(index, item){
				let color = "white";
				if(index < 3) color = "yellow";
				let objs = new Object();
				objs.content = "<div class='marker' data-val='"+item.dongNum+"' data-name='"+item.dongName+"' data-lat='"+item.latitude+"' data-long='"+item.longitude+"'><div class=''></div><div class='marker-rank'><div class='marker-rank-img'><img style='width: 18px;' src='/app/resources/images/rank_"+color+".png'></div><div class='marker-rank-text'><p>"+(index+1)+"</p></div></div><div class='marker-region-name'>"+item.dongName+"</div><div class='marker-sales-total'>"+item.chai+"명</div></div>";
				objs.latlng = new kakao.maps.LatLng(item.latitude, item.longitude)
				obj.push(objs);
			});
			let level = 8;
			let lat1 = 37.5729503;
			let long1 = 126.9793579;
			makeMap(level, lat1, long1, obj);
		}
		ajaxFun(url, "post", query, "json", fn);
	});
});