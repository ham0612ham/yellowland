$(function() {
	var chartDom = document.getElementById('zumposu');
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
		series : [ {
			data : [ {
				value : 99,
				itemStyle : {
					color : '#A9A9A9'
				}
			}, {
				value : 101,
				itemStyle : {
					color : '#A9A9A9'
				}
			}, {
				value : 105,
				itemStyle : {
					color : '#A9A9A9'
				}
			}, {
				value : 103,
				itemStyle : {
					color : '#A9A9A9'
				}
			}, {
				value : 101,
				itemStyle : {
					color : '#36C88A'
				}
			} ],
			type : 'bar'
		} ]
	};

	option && myChart.setOption(option);

});

$(function() {
	var chartDom = document.getElementById('geupsu');
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
		series : [ {
			data : [ {
				value : 21,
				itemStyle : {
					color : '#A9A9A9'
				}
			}, {
				value : 16,
				itemStyle : {
					color : '#A9A9A9'
				}
			}, {
				value : 15,
				itemStyle : {
					color : '#A9A9A9'
				}
			}, {
				value : 15,
				itemStyle : {
					color : '#A9A9A9'
				}
			}, {
				value : 20,
				itemStyle : {
					color : '#36C88A'
				}
			} ],
			type : 'bar'
		} ]
	};

	option && myChart.setOption(option);

});

$(function() {
	var chartDom = document.getElementById('pyeupsu');
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
		series : [ {
			data : [ {
				value : 18,
				itemStyle : {
					color : '#A9A9A9'
				}
			}, {
				value : 12,
				itemStyle : {
					color : '#A9A9A9'
				}
			}, {
				value : 6,
				itemStyle : {
					color : '#A9A9A9'
				}
			}, {
				value : 13,
				itemStyle : {
					color : '#A9A9A9'
				}
			}, {
				value : 12,
				itemStyle : {
					color : '#36C88A'
				}
			} ],
			type : 'bar'
		} ]
	};

	option && myChart.setOption(option);

});

$(function() {
	var chartDom = document.getElementById('upzongbunpo');
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
			radius : '50%',
			color : [ '#49B3FF', '#36C88A', '#FCFF6A' ],
			data : [ {
				value : 189,
				name : '외식업'
			}, {
				value : 190,
				name : '서비스업'
			}, {
				value : 269,
				name : '소매업'
			} ],
			emphasis : {
				itemStyle : {
					shadowBlur : 10,
					shadowOffsetX : 0,
					shadowColor : 'rgba(0, 0, 0, 0.5)'
				}
			}
		} ]
	};

	option && myChart.setOption(option);

});

$(function() {
	var chartDom = document.getElementById('mechulak');
	var myChart = echarts.init(chartDom);
	var option;

	option = {
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			data : [ '선택 상권', '자치구', '서울시' ]
		},
		grid : {
			left : '3%',
			right : '4%',
			bottom : '3%',
			containLabel : true
		},
		xAxis : {
			type : 'category',
			boundaryGap : false,
			data : [ '2021년 3분기', '2021년 4분기', '2022년 1분기', '2022년 2분기',
					'2022년 3분기' ]
		},
		yAxis : {
			type : 'value'
		},
		color : [ '#756EF2', '#49B3FF', '#36C88A' ],
		series : [ {
			name : '선택 상권',
			type : 'line',
			stack : 'Total',
			data : [ 150, 232, 201, 154, 190 ]
		}, {
			name : '자치구',
			type : 'line',
			stack : 'Total',
			data : [ 320, 332, 301, 334, 390 ]
		}, {
			name : '서울시',
			type : 'line',
			stack : 'Total',
			data : [ 820, 932, 901, 934, 1290 ]
		} ]
	};

	option && myChart.setOption(option);
});

$(function() {
	var chartDom = document.getElementById('mechulgunsu');
	var myChart = echarts.init(chartDom);
	var option;

	option = {
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			data : [ '선택 상권', '자치구', '서울시' ]
		},
		grid : {
			left : '3%',
			right : '4%',
			bottom : '3%',
			containLabel : true
		},
		xAxis : {
			type : 'category',
			boundaryGap : false,
			data : [ '2021년 3분기', '2021년 4분기', '2022년 1분기', '2022년 2분기',
					'2022년 3분기' ]
		},
		yAxis : {
			type : 'value'
		},
		color : [ '#756EF2', '#49B3FF', '#36C88A' ],
		series : [ {
			name : '선택 상권',
			type : 'line',
			stack : 'Total',
			data : [ 150, 232, 201, 154, 190 ]
		}, {
			name : '자치구',
			type : 'line',
			stack : 'Total',
			data : [ 320, 332, 301, 334, 390 ]
		}, {
			name : '서울시',
			type : 'line',
			stack : 'Total',
			data : [ 820, 932, 901, 934, 1290 ]
		} ]
	};

	option && myChart.setOption(option);
});

$(function() {
	var chartDom = document.getElementById('yoilbyul-muchul');
	var myChart = echarts.init(chartDom);
	var option;

	option = {
		xAxis : {
			type : 'category',
			data : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일' ]
		},
		yAxis : {
			type : 'value'
		},
		tooltip : {
			trigger : 'axis'
		},
		series : [ {
			data : [ {
				value : 14.8,
				itemStyle : {
					color : '#BBBBBB'
				}
			}, {
				value : 14.1,
				itemStyle : {
					color : '#BBBBBB'
				}
			}, {
				value : 13.7,
				itemStyle : {
					color : '#BBBBBB'
				}
			}, {
				value : 17.3,
				itemStyle : {
					color : '#BBBBBB'
				}
			}, {
				value : 18,
				itemStyle : {
					color : '#36C88A'
				}
			}, {
				value : 13.2,
				itemStyle : {
					color : '#BBBBBB'
				}
			}, {
				value : 8.9,
				itemStyle : {
					color : '#BBBBBB'
				}
			} ],
			type : 'bar'
		} ]
	};

	option && myChart.setOption(option);
});
$(function() {

});
$(function() {

});
$(function() {

});
$(function() {

});
$(function() {

});