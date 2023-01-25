
function makeGraph(dongNum){
	milzipdo(dongNum);
	jumpo(dongNum);


}; 

function makeGraph2(siguNum){
	yongdoArea(siguNum);
}
	function yongdoArea(siguNum) {
		let url = "/app/matchingReport/yongdoArea";
		let query = "siguNum="+siguNum;
		const fn = function(data) {
			var chartDom = document.getElementById('yongdoArea');
			var myChart = echarts.init(chartDom);
			var option;
			option = {
				title : {
					left : 'center'
				},
				tooltip : {
					trigger : 'item'
				},
				legend : {
					orient : 'vertical',
					left : 'left'
				},
				series : [ {
					name : 'Access From',
					type : 'pie',
					radius :[ '40%','70%'],
					borderColor: '#fff',
					borderWidth: 2,
					color : [ '#49B3FF', '#36C88A', '#FCFF6A' ],
					data : data.data,
					emphasis : {
						itemStyle : {
							shadowBlur : 10,
							shadowOffsetX : 0,
							shadowColor : 'rgba(0, 0, 0, 0.5)'
						}
					}
				} ]
			};
			
			$(".yongdo-first").text(data.most);
			
			option && myChart.setOption(option);
		};
		ajaxFun(url, "get", query, "json", fn);
	};
	
function jumpo(dongNum) {
		let url = "/app/matchingReport/jumpo";
		let query = "dongNum="+dongNum;
		const fn = function(data) {
			var chartDom = document.getElementById('jumpo');
			var myChart = echarts.init(chartDom);
			var option;
			option = {
				xAxis : {
					type : 'category',
					data : [ '2021년 3분기', '2021년 4분기', '2022년 1분기', '2022년 2분기',
							'2022년 3분기' ]
				},
				tooltip : {
					trigger : 'axis'
				},
				yAxis : {
					type : 'value'
				},
				series : data.series
			};

			option && myChart.setOption(option);
			if(data.quart < 0) {
				$("#jumpo-quart-count").text("↓ "+Math.abs(data.quart)+"개");
				$("#jumpo-quart-count").css("color", "#e02171")
			} else {
				$("#jumpo-quart-count").text("↑ "+data.quart+"개");
				$("#jumpo-quart-count").css("color", "#36C88A")
			}
			if(data.year < 0) {
				$("#jumpo-year-count").text("↓ "+Math.abs(data.year)+"개");
				$("#jumpo-year-count").css("color", "#e02171")
			} else {
				$("#jumpo-year-count").text("↑ "+data.year+"개");
				$("#jumpo-year-count").css("color", "#36C88A")
			}
			$("#jumpo-result").text(data.su+"개");
		};
		ajaxFun(url, "get", query, "json", fn);
	};

 
function  milzipdo(dongNum) {
		let url = "/app/matchingReport/milzipdo";
		let query = "dongNum="+dongNum;
		const fn = function(data) {
			var chartDom = document.getElementById('milzipdo');
			var myChart = echarts.init(chartDom);
			var option;
			option = {
				title : {
					left : 'center'
				},
				tooltip : {
					trigger : 'item'
				},
				legend : {
					orient : 'vertical',
					left : 'left'
				},
				series : [ {
					name : 'Access From',
					type : 'pie',
					radius :[ '40%','70%'],
					color : [ '#49B3FF', '#36C88A', '#FCFF6A' ],
					data : data.data,
					itemStyle: {
						borderRadius: 10,
						borderColor:'#fff',
						borderWidth: 2
						
					},
					emphasis : {
						itemStyle : {
							shadowBlur : 10,
							shadowOffsetX : 0,
							shadowColor : 'rgba(0, 0, 0, 0.5)'
						}
					}
				} ]
			};
			$(".upzongbunpo-job-first").text(data.most);
			$(".upzongbunpo-job-grow").text(data.up);
			option && myChart.setOption(option);
		};
		ajaxFun(url, "get", query, "json", fn);
	};


