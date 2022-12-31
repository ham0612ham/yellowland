function makeReport(dongNum){
	zumposu(dongNum);
	geupsu(dongNum);
	pyeupsu(dongNum);
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
			$("#geupsu-quart-count").addClass("red-text");
		} else {
			$("#geupsu-quart-count").text("↑ "+data.quart+"개");
			$("#geupsu-quart-count").addClass("gr-text");
		}
		if(data.year < 0) {
			$("#geupsu-year-count").text("↓ "+Math.abs(data.year)+"개");
			$("#geupsu-year-count").addClass("red-text");
		} else {
			$("#geupsu-year-count").text("↑ "+data.year+"개");
			$("#geupsu-year-count").addClass("gr-text");
		}
		$("#geupsu-result").text(data.su+"개");
	};
	ajaxFun(url, "get", query, "json", fn);
};

function pyeupsu(dongNum) {
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
			$("#pyeupsu-quart-count").text("↓ "+Math.abs(data.quart)+"개");
			$("#pyeupsu-quart-count").addClass("red-text");
		} else {
			$("#pyeupsu-quart-count").text("↑ "+data.quart+"개");
			$("#pyeupsu-quart-count").addClass("gr-text");
		}
		if(data.year < 0) {
			$("#pyeupsu-year-count").text("↓ "+Math.abs(data.year)+"개");
			$("#pyeupsu-year-count").addClass("red-text");
		} else {
			$("#pyeupsu-year-count").text("↑ "+data.year+"개");
			$("#pyeupsu-year-count").addClass("gr-text");
		}
		$("#geupsu-result").text(data.su+"개");
	};
	ajaxFun(url, "get", query, "json", fn);
};

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
			radius : '60%',
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
	var chartDom = document.getElementById('sigandebuel-mechul');
	var myChart = echarts.init(chartDom);
	var option;

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
			data : [ '00~06시', '06~11시', '11~14시', '14~17시', '17~21시', '21~24시' ]
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
			data : [ 2.6, 12, 19.4, 26, 31.4, 8.7 ]
		} ]
	};

	option && myChart.setOption(option);

});

$(function() {
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
				value : 52.6,
				name : '남성'
			}, {
				value : 47.4,
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

});

$(function() {
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
					value : 60.9,
					name : '남성'
				}, {
					value : 39.1,
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
	
});

$(function() {
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
					value : 47.5,
					name : '남성'
				}, {
					value : 52.5,
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
	
});

$(function() {
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
					value : 50.5,
					name : '남성'
				}, {
					value : 49.5,
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
