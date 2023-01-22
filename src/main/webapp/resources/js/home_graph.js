function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			console.log(jqXHR.responseText);
		}
	});
}

$(function(){
	graph1Chart("all", "all");
	graph2Chart("all", "all");
	graph3Chart("all", "all");
});

$(function(){
	$("select[name=siguNum]").on("change", function(){
		let siguNum = $(this).val();
		let cateJobNum = $("select[name=cateJobNum]").val();
		graph1Chart(siguNum, cateJobNum);
		graph2Chart(siguNum, cateJobNum);
		graph3Chart(siguNum);
	});
});

$(function(){
	$("select[name=cateJobNum]").on("change", function(){
		let siguNum = $("select[name=siguNum]").val();
		let cateJobNum = $(this).val();
		graph1Chart(siguNum, cateJobNum);
		graph2Chart(siguNum, cateJobNum);
		graph3Chart(siguNum);
	});
});

function graph1Chart(siguNum, cateJobNum) {
	let url = "/app/commEchart/graph1Chart";
	let query = "siguNum="+siguNum+"&cateJobNum="+cateJobNum;
	const fn = function(data) {
		var chartDom = document.getElementById('graph1-chart');
		var myChart = echarts.init(chartDom);
		var option;

		option = {
		  tooltip: {
		    trigger: 'item'
		  },
		  color: ['#756EF2', '#36C88A'],
		  series: [
		    {
		      name: 'Access From',
		      type: 'pie',
		      radius: ['70%'],
		      avoidLabelOverlap: false,
		      itemStyle: {
		        borderColor: '#fff',
		        borderWidth: 2
		      },
		      label: {
		        show: false,
		        position: 'center'
		      },
		      data: [
		        { value: data.normal, name: '일반점포' },
		        { value: data.fran, name: '프랜차이즈' }
		      ]
		    }
		  ]
		};
		$("#graph1-total1").text(data.total1.toLocaleString()+" 개");
		$("#graph1-normal").text(data.normal.toLocaleString()+" 개");
		$("#graph1-fran").text(data.fran.toLocaleString()+" 개");
		$("#graph1-total2").text(data.total2.toLocaleString()+" 개");
		$("#graph1-total3").text(data.total3.toLocaleString()+" 개");
		option && myChart.setOption(option);
	};
	ajaxFun(url, "get", query, "json", fn);
};

function graph2Chart(siguNum, cateJobNum) {
	let url = "/app/commEchart/graph2Chart";
	let query = "siguNum="+siguNum+"&cateJobNum="+cateJobNum;
	const fn = function(data) {
		console.log(data);
		let one_year_before_chai = data.thisQ - data.yearB;
		let one_quart_before_chai = data.thisQ - data.quartB;
		let q = "";
		let y = "";
		y = one_year_before_chai > 0 ? "+" : "-";
		q = one_quart_before_chai > 0 ? "+" : "-";
		
		$("#this-quart").text(data.thisQ.toLocaleString()+"억");
		$("#one-quart-before-chai").text(q +" "+ (Math.abs(one_quart_before_chai).toLocaleString())+"억");
		$("#one-year-before-chai").text(y +" "+ (Math.abs(one_year_before_chai).toLocaleString())+"억");
		$("#one-quart-before").text(data.quartB.toLocaleString()+"억");
		$("#one-year-before").text(data.yearB.toLocaleString()+"억");
	};
	ajaxFun(url, "get", query, "json", fn);
};


function graph3Chart(siguNum) {
	let url = "/app/commEchart/graph3Chart";
	let query = "siguNum="+siguNum;
	const fn = function(data) {
		var chartDom = document.getElementById('graph3-chart');
		var myChart = echarts.init(chartDom);
		var option;

		option = {
		  tooltip : { trigger : 'axis' },
		  dataset: { source: data.source },
		  grid: { containLabel: true },
		  xAxis: { name: '만명' },
		  yAxis: { type: 'category' },
		  color: ['#36C88A'],
		  series: [
		    {
		      type: 'bar',
		      encode: {
		        x: '유동인구',
		        y: '행정동'
		      }
		    }
		  ]
		};
		option && myChart.setOption(option);
	};
	ajaxFun(url, "get", query, "json", fn);
};
