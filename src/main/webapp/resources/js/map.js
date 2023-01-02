function makeReport(dongNum){
	zumposu(dongNum);
	geupsu(dongNum);
	pyeupsu(dongNum);
	upzongbunpo(dongNum);
	mechulak(dongNum);
	mechulgunsu(dongNum);
	yoilbyulMuchul(dongNum);
	sigandebuelMechul(dongNum);
	sungbuelMechul(dongNum);
	sungbuelMechulThree(dongNum);
};


function zumposu(dongNum) {
	let url = "/app/commEchart/zumposu";
	let query = "dongNum="+dongNum;
	const fn = function(data) {
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
			series : data.series
			
		};
		option && myChart.setOption(option);
		$("#zumposu-result").text(data.zumposu+"개");
	};
	ajaxFun(url, "get", query, "json", fn);
};

function geupsu(dongNum) {
	let url = "/app/commEchart/geupsu";
	let query = "dongNum="+dongNum;
	const fn = function(data) {
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
			series : data.series
		};

		option && myChart.setOption(option);
		if(data.quart < 0) {
			$("#geupsu-quart-count").text("↓ "+Math.abs(data.quart)+"개");
			$("#geupsu-quart-count").css("color", "#e02171")
		} else {
			$("#geupsu-quart-count").text("↑ "+data.quart+"개");
			$("#geupsu-quart-count").css("color", "#36C88A")
		}
		if(data.year < 0) {
			$("#geupsu-year-count").text("↓ "+Math.abs(data.year)+"개");
			$("#geupsu-year-count").css("color", "#e02171")
		} else {
			$("#geupsu-year-count").text("↑ "+data.year+"개");
			$("#geupsu-year-count").css("color", "#36C88A")
		}
		$("#geupsu-result").text(data.su+"개");
	};
	ajaxFun(url, "get", query, "json", fn);
};

function pyeupsu(dongNum) {
	let url = "/app/commEchart/pyeupsu";
	let query = "dongNum="+dongNum;
	const fn = function(data) {
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
				series : data.series
		};
		
		option && myChart.setOption(option);
		if(data.quart < 0) {
			$("#pyeupsu-quart-count").text("↓ "+Math.abs(data.quart)+"개");
			$("#pyeupsu-quart-count").css("color", "#e02171")
		} else {
			$("#pyeupsu-quart-count").text("↑ "+data.quart+"개");
			$("#pyeupsu-quart-count").css("color", "#36C88A")
		}
		if(data.year < 0) {
			$("#pyeupsu-year-count").text("↓ "+Math.abs(data.year)+"개");
			$("#pyeupsu-year-count").css("color", "#e02171")
		} else {
			$("#pyeupsu-year-count").text("↑ "+data.year+"개");
			$("#pyeupsu-year-count").css("color", "#36C88A")
		}
		$("#pyeupsu-result").text(data.su+"개");
	};
	ajaxFun(url, "get", query, "json", fn);
};

function upzongbunpo(dongNum) {
	let url = "/app/commEchart/upzongbunpo";
	let query = "dongNum="+dongNum;
	const fn = function(data) {
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
				radius : '60%',
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
		$(".upzongbunpo-job-first").text(data.most);
		$(".upzongbunpo-job-grow").text(data.up);
		option && myChart.setOption(option);
	};
	ajaxFun(url, "get", query, "json", fn);
};

function mechulak(dongNum) {
	let url = "/app/commEchart/mechulak";
	let query = "dongNum="+dongNum;
	const fn = function(data) {
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
				data : data.dong
			}, {
				name : '자치구',
				type : 'line',
				data : data.sigu
			}, {
				name : '서울시',
				type : 'line',
				data : data.seoul
			} ]
		};

		option && myChart.setOption(option);
		$("#mechulak-ave").text(data.ave + "만원");
		
		if(data.qChai < 0) {
			$("#mechulak-quart").text("↓ "+Math.abs(data.qChai)+"만원");
			$("#mechulak-quart").css("color", "#e02171")
		} else {
			$("#mechulak-quart").text("↑ "+data.qChai+"만원");
			$("#mechulak-quart").css("color", "#36C88A")
		}
		if(data.yChai < 0) {
			$("#mechulak-year").text("↓ "+Math.abs(data.yChai)+"만원");
			$("#mechulak-year").css("color", "#e02171")
		} else {
			$("#mechulak-year").text("↑ "+data.yChai+"만원");
			$("#mechulak-year").css("color", "#36C88A")
		}
	};
	ajaxFun(url, "get", query, "json", fn);
};

function mechulgunsu(dongNum) {
	let url = "/app/commEchart/mechulgunsu";
	let query = "dongNum="+dongNum;
	const fn = function(data) {
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
					data : data.dong
				}, {
					name : '자치구',
					type : 'line',
					data : data.sigu
				}, {
					name : '서울시',
					type : 'line',
					data : data.seoul
				} ]
		};
		
		option && myChart.setOption(option);
		$("#mechulgunsu-month-ave").text(data.ave + "건");
		
		if(data.qChai < 0) {
			$("#mechulgunsu-quart").text("↓ "+Math.abs(data.qChai)+"건");
			$("#mechulgunsu-quart").css("color", "#e02171")
		} else {
			$("#mechulgunsu-quart").text("↑ "+data.qChai+"건");
			$("#mechulgunsu-quart").css("color", "#36C88A")
		}
		if(data.yChai < 0) {
			$("#mechulgunsu-year").text("↓ "+Math.abs(data.yChai)+"건");
			$("#mechulgunsu-year").css("color", "#e02171")
		} else {
			$("#mechulgunsu-year").text("↑ "+data.yChai+"건");
			$("#mechulgunsu-year").css("color", "#36C88A")
		}
	};
	ajaxFun(url, "get", query, "json", fn);
};

function yoilbyulMuchul(dongNum) {
	let url = "/app/commEchart/yoilbyulMuchul";
	let query = "dongNum="+dongNum;
	let yoil = [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일' ];
	
	const fn = function(data) {
		var chartDom = document.getElementById('yoilbyul-muchul');
		var myChart = echarts.init(chartDom);
		var option;
		option = {
			xAxis : {
				type : 'category',
				data : yoil
			},
			yAxis : {
				type : 'value'
			},
			tooltip : {
				trigger : 'axis'
			},
			series : data.series
		};
		$(".yoilbyul-muchul-yoil").text(yoil[data.yoil]);
		option && myChart.setOption(option);
	};
	ajaxFun(url, "get", query, "json", fn);
};

function sigandebuelMechul(dongNum) {
	let url = "/app/commEchart/sigandebuelMechul";
	let query = "dongNum="+dongNum;
	let sigan = [ '00~06시', '06~11시', '11~14시', '14~17시', '17~21시', '21~24시' ];
	const fn = function(data) {
		var chartDom = document.getElementById('sigandebuel-mechul');
		var myChart = echarts.init(chartDom);
		var option;
		console.log(data.series)
		option = {
			tooltip : {
				trigger : 'axis',
				axisPointer : {
					type : 'cross',
					label : {
						backgroundColor : '#36C88A'
					}
				}
			},
			legend : {
				data : [ '시간대별 매출 비율' ]
			},
			grid : {
				left : '3%',
				right : '4%',
				bottom : '3%',
				containLabel : true
			},
			xAxis : [ {
				type : 'category',
				boundaryGap : false,
				data : sigan
			} ],
			yAxis : [ {
				type : 'value'
			} ],
			color : [ '#36C88A' ],
			series : [ {
				name : '평균비율(%)',
				type : 'line',
				stack : 'Total',
				areaStyle : {},
				emphasis : {
					focus : 'series'
				},
				data : data.data
			} ]
		};
		$(".sigandebuel-mechul-highest").text(sigan[data.sigan]);
		option && myChart.setOption(option);
	};
	ajaxFun(url, "get", query, "json", fn);
};

function sungbuelMechul(dongNum) {
	let url = "/app/commEchart/sungbuelMechul";
	let query = "dongNum="+dongNum;
	let gender = ['남성', '여성'];
	const fn = function(data) {
		var chartDom = document.getElementById('sungbuel-mechul');
		var myChart = echarts.init(chartDom);
		var option;

		option = {
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
				radius : '60%',
				color : [ '#756EF2', '#36C88A'],
				data : [ {
					value : data.male,
					name : '남성'
				}, {
					value : data.female,
					name : '여성'
				}],
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
		$(".sungbuel-mechul-result").text(gender[data.gender]);
		$(".sungbuel-mechul-percent").text("("+data.percent+"%)");
	};
	ajaxFun(url, "get", query, "json", fn);
};

function sungbuelMechulThree(dongNum) {
	let url = "/app/commEchart/sungbuelMechulThree";
	let query = "dongNum="+dongNum;
	const fn = function(data) {
		sungbuelMechulFood(data);
		sungbuelMechulService(data);
	};
	ajaxFun(url, "get", query, "json", fn);
};


function sungbuelMechulFood(data){
	var chartDom = document.getElementById('sungbuel-mechul-food');
	var myChart = echarts.init(chartDom);
	var option;
	
	option = {
			tooltip : {
				trigger : 'item'
			},
			series : [ {
				type : 'pie',
				radius : '70%',
				color : [ '#756EF2', '#36C88A'],
				data : [ {
					value : data.maleFood,
					name : '남성'
				}, {
					value : data.femaleFood,
					name : '여성'
				}],
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
};	


function sungbuelMechulService(data){
	var chartDom = document.getElementById('sungbuel-mechul-service');
	var myChart = echarts.init(chartDom);
	var option;
	
	option = {
			tooltip : {
				trigger : 'item'
			},
			series : [ {
				name : 'Access From',
				type : 'pie',
				radius : '70%',
				color : [ '#756EF2', '#36C88A'],
				data : [ {
					value : data.maleService,
					name : '남성'
				}, {
					value : data.femaleService,
					name : '여성'
				}],
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
	
};

function sungbuelMechulRetail(data){
	var chartDom = document.getElementById('sungbuel-mechul-retail');
	var myChart = echarts.init(chartDom);
	var option;
	
	option = {
			tooltip : {
				trigger : 'item'
			},
			series : [ {
				name : 'Access From',
				type : 'pie',
				radius : '70%',
				color : [ '#756EF2', '#36C88A'],
				data : [ {
					value : data.maleRetail,
					name : '남성'
				}, {
					value : data.femaleRetail,
					name : '여성'
				}],
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
	
};

$(function() {
	var chartDom = document.getElementById('yoenryungbyul-mechul');
	var myChart = echarts.init(chartDom);
	var option;

	option = {
		xAxis : {
			type : 'category',
			data : [ '10대', '20대', '30대', '40대', '50대', '60대 이상' ]
		},
		yAxis : {
			type : 'value'
		},
		tooltip : {
			trigger : 'axis'
		},
		series : [ {
			data : [ {
				value : 0.4,
				itemStyle : {
					color : '#BBBBBB'
				}
			}, {
				value : 8.6,
				itemStyle : {
					color : '#BBBBBB'
				}
			}, {
				value : 15.2,
				itemStyle : {
					color : '#BBBBBB'
				}
			}, {
				value : 25.4,
				itemStyle : {
					color : '#BBBBBB'
				}
			}, {
				value : 29.1,
				itemStyle : {
					color : '#36C88A'
				}
			}, {
				value : 21.1,
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
	var chartDom = document.getElementById('yoenryungbyul-mechul');
	var myChart = echarts.init(chartDom);
	var option;
	
	option = {
			xAxis : {
				type : 'category',
				data : [ '10대', '20대', '30대', '40대', '50대', '60대 이상' ]
			},
			yAxis : {
				type : 'value'
			},
			tooltip : {
				trigger : 'axis'
			},
			series : [ {
				data : [ {
					value : 0.4,
					itemStyle : {
						color : '#BBBBBB'
					}
				}, {
					value : 8.6,
					itemStyle : {
						color : '#BBBBBB'
					}
				}, {
					value : 15.2,
					itemStyle : {
						color : '#BBBBBB'
					}
				}, {
					value : 25.4,
					itemStyle : {
						color : '#BBBBBB'
					}
				}, {
					value : 29.1,
					itemStyle : {
						color : '#36C88A'
					}
				}, {
					value : 21.1,
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
	var chartDom = document.getElementById('yoenryungbyul-mechul-service');
	var myChart = echarts.init(chartDom);
	var option;
	
	option = {
			xAxis : {
				type : 'category',
				data : [ '10대', '20대', '30대', '40대', '50대', '60대 이상' ]
			},
			yAxis : {
				type : 'value'
			},
			tooltip : {
				trigger : 'axis'
			},
			series : [ {
				data : [ {
					value : 0.2,
					itemStyle : {
						color : '#BBBBBB'
					}
				}, {
					value : 3.0,
					itemStyle : {
						color : '#BBBBBB'
					}
				}, {
					value : 9.4,
					itemStyle : {
						color : '#BBBBBB'
					}
				}, {
					value : 24.9,
					itemStyle : {
						color : '#BBBBBB'
					}
				}, {
					value : 29.3,
					itemStyle : {
						color : '#36C88A'
					}
				}, {
					value : 32.3,
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
	var chartDom = document.getElementById('yoenryungbyul-mechul-retail');
	var myChart = echarts.init(chartDom);
	var option;
	
	option = {
			xAxis : {
				type : 'category',
				data : [ '10대', '20대', '30대', '40대', '50대', '60대 이상' ]
			},
			yAxis : {
				type : 'value'
			},
			tooltip : {
				trigger : 'axis'
			},
			series : [ {
				data : [ {
					value : 0.2,
					itemStyle : {
						color : '#BBBBBB'
					}
				}, {
					value : 6.1,
					itemStyle : {
						color : '#BBBBBB'
					}
				}, {
					value : 10.9,
					itemStyle : {
						color : '#BBBBBB'
					}
				}, {
					value : 20,
					itemStyle : {
						color : '#BBBBBB'
					}
				}, {
					value : 25.5,
					itemStyle : {
						color : '#36C88A'
					}
				}, {
					value : 37.3,
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
	var chartDom = document.getElementById('sungbyul-yoenryungbyul-yudongingu');
	var myChart = echarts.init(chartDom);
	var option;

	option = {
	  tooltip: {
	    trigger: 'axis'
	  },
	  legend: {
	    data: ['남성', '여성']
	  },
	  calculable: true,
	  xAxis: [
	    {
	      type: 'category',
	      data: ['10대', '20대', '30대', '40대', '50대', '60대 이상']
	    }
	  ],
	  yAxis: [
	    {
	      type: 'value'
	    }
	  ],
	  series: [
	    {
	      name: '남성',
	      type: 'bar',
	      color: '#756EF2',
	      data: [18.3, 12, 11.2, 16.2, 17.7, 24.6],
	      markPoint: {
	        data: [
	          { type: 'max', name: 'Max' },
	          { type: 'min', name: 'Min' }
	        ]
	      },
	      markLine: {
	        data: [{ type: 'average', name: 'Avg' }]
	      }
	    },
	    {
	      name: '여성',
	      type: 'bar',
	      color: '#36C88A',
	      data: [13.7, 10.5, 10.7, 14.5, 18.2, 32.4],
	      markPoint: {
	        data: [
	          { type: 'max', name: 'Max' },
	          { type: 'min', name: 'Min' }
	        ]
	      },
	      markLine: {
	        data: [{ type: 'average', name: 'Avg' }]
	      }
	    }
	  ]
	};

	option && myChart.setOption(option);
});

$(function() {
	var chartDom = document.getElementById('gugeoingu-su');
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
