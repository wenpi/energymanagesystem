function getHicharts(chartId,chartType,backgroundColor,height,borderRadius,spacingBottom,categories,data,dataName,dataU,fillColor){
	$("#"+chartId).highcharts({
		chart:{
			type:chartType,
			backgroundColor:backgroundColor,
			height:height,
			width:230,
			borderRadius:borderRadius,
			spacingBottom:spacingBottom,
			spacingTop:1
		},
		credits:{//引用网页
				enabled:false
			},
		exporting:{//导出表
			enabled:false
		},
		title:{//表标题
			text:null
		},
		legend:{//图例
			enabled:false
		},
		xAxis:{
			title:{//x轴标题
				enabled:false
			},
			categories:categories,//x轴坐标在tooltip中的显示
			labels:{//x轴坐标数字
				enabled:false
			},
			lineColor:'#C8D59D',//x轴线颜色
			lineWidth:1,//x轴线宽度
			tickLength:0//X轴短线长度
		},
		yAxis: {
			title:{//y轴标题
				enabled:false
			},
			gridLineDashStyle:'ShortDashDot',//网格横线类型
			labels:{//y轴坐标数字
				enabled:false
			}
		},
		tooltip: {
			shared:true,
			useHTML: true,//使用html标签
            headerFormat: '<small>{point.key}</small><table>',//标签第一行：显示x轴数据
            pointFormat: '<tr><td>{series.name}: </td>' +
            '<td style="text-align: right"><b>{point.y}'+dataU+'</b></td></tr>',//标签第二行：显示y轴数据+单位（人次）
            footerFormat: '</table>'
		},
		colors:['#F0F0F0'],//线色
		plotOptions: {
			series: {
				 lineWidth: 1,//线宽
				 marker:{
					states:{
						hover:{
							fillColor:fillColor,
							lineWidth:2,
							radius:4
						}
					}
				 }
			}
		},
		series: [{
			name:dataName,//数据名：显示在tooltip第一行
			data: data
		}]
	});
}