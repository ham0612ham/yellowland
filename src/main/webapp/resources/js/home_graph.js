$(function() {
	var chartDom = document.getElementById('graph3-chart');
	var myChart = echarts.init(chartDom);
	var option;

	option = {
	  dataset: {
	    source: [
	      ['유동인구', '행정동'],
	      [58212, '마포구 서교동'],
	      [78254, '강동구 길동'],
	      [12755, '강남구 역삼1동'],
	      [20145, '서대문구 북아현동'],
	      [79146, '강서구 화곡1동']
	    ]
	  },
	  grid: { containLabel: true },
	  xAxis: { name: 'amount' },
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
});
$(function(){
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
	        borderRadius: 10,
	        borderColor: '#fff',
	        borderWidth: 2
	      },
	      label: {
	        show: false,
	        position: 'center'
	      },
	      emphasis: {
	        label: {
	          show: true,
	          fontSize: 40,
	          fontWeight: 'bold'
	        }
	      },
	      data: [
	        { value: 530310, name: '일반점포' },
	        { value: 44729, name: '프랜차이즈' }
	      ]
	    }
	  ]
	};

	option && myChart.setOption(option);
});