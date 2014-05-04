
//双y轴，不同类型图表    图表Id  背景色    图标题 X轴标签 x轴间距  第一y轴  第二y轴    数据（数组）图色 图型    参照y轴列表    图例名列表
function renderToTwoType(chartId,backcolor,title,cateList,xStep,yLeftTitle,yRightTitle,dataList,colors,typeList,chartYAxisList,chartLegendList,showlegend,height,width,gridLineColor){
	var seriesList=[];
	var legendList=chartLegendList;
	var yAxisList=chartYAxisList;
	var z=[2,1];
	if(dataList.length>2){
		z=[2,1,2,1];
	}
	
	for(var i=0;i<dataList.length;i++){
		var unit="kW";
		
		seriesList.push({
				name:legendList[i],
				type:typeList[i],
				marker:{
					fillColor:colors[i]
				},
				data:dataList[i],
				yAxis:yAxisList[i],
				zIndex:z[i]
		});
	}
	$("#"+chartId).highcharts({
		chart:{//基本表
			backgroundColor:backcolor,//背景色：整个表
			height:height,//调节上下长度
			width:width,	//调节左右宽度
			borderRadius:0,//边角弧度
		},
		credits:{//引用网页
				enabled:false,
			},
		exporting:{//导出表
			enabled:false,
		},
		title:{//表标题
			text:'<span style="font-size:14px;">'+title+'</span>',
			style:{
					color:'#C0D0E0'
			}
		},
		legend:{
			enabled:showlegend,
			borderWidth:0,
			itemStyle:{
				color:'#FFF',
				fontFamily:'微软雅黑',
			},
		},
		xAxis:{
			categories:cateList,//x轴坐标在tooltip中的显示
			labels:{//x轴坐标数字
				step:xStep,
				style:{
					color:'#C0D0E0'
				}
			},
			lineWidth:1,//x轴线宽度
			lineColor:gridLineColor,
			tickLength:1,//X轴短线长度
			tickColor:gridLineColor,
			gridLineWidth:0,
			tickmarkPlacement:'on',
		},
		yAxis: [{
			tickWidth:1,
			tickColor:gridLineColor,
			title:{//y轴标题
				text:yLeftTitle,
				style:{
					fontFamily: '微软雅黑',
					color:'#C0D0E0',
					fontWeight:'normal',
				}
			},
			gridLineDashStyle:'LongDash',//网格横线类型,
			gridLineColor:gridLineColor,
			labels:{//y轴坐标数字
				style:{
					color:'#C0D0E0'
				}
			}
		},{
			gridLineDashStyle:'LongDash',//网格横线类型
			gridLineColor:gridLineColor,
			labels:{//y轴坐标数字
				style:{
					color:'#C0D0E0'
				}
			},
			tickWidth:1,
			tickColor:gridLineColor,
			title:{//y轴标题
				text:yRightTitle,
				style:{
					fontFamily: '微软雅黑',
					color:'#C0D0E0',
					fontWeight:'normal',
				},
				rotation:270
			},
			opposite:true,
			allowDecimals:false
		}],
		tooltip: {
			//crosshairs:true,
			shared:true,
		},
		colors:colors,//线色
		plotOptions: {
			series: {
				lineWidth:2,//线宽
				borderWidth:0,
				marker:{
					radius:0,
					lineWidth:2//点上线宽
				}
			},
		},
		series: seriesList
	});
}

//双轴大图，参数与上同
function renderToBigTwoType(chartId,backcolor,title,cateList,xStep,yLeftTitle,yRightTitle,dataList,colors,typeList,chartYAxisList,chartLegendList){
	var seriesList=[];
	var legendList=chartLegendList;
	var yAxisList=chartYAxisList;
	var z=[2,1];
	if(dataList.length>2){
		z=[2,1,2,1];
	}
	for(var i=0;i<dataList.length;i++){
		var unit="kW";
		
		seriesList.push({
				name:legendList[i],
				type:typeList[i],
				marker:{
					fillColor:colors[i]
				},
				data:dataList[i],
				yAxis:yAxisList[i],
				zIndex:z[i]
		});
	}
	$("#"+chartId).highcharts({
		chart:{//基本表
			height:242,//调节上下长度
			width:588,	//调节左右宽度
			borderRadius:0,//边角弧度
		},
		credits:{//引用网页
				enabled:false,
			},
		exporting:{//导出表
			enabled:false,
		},
		title:{//表标题
			text:'<span style="font-size:14px;">'+title+'</span>'
		},
		legend:{
			itemStyle:{
				// fontFamily:'微软雅黑',
			},
		},
		xAxis:{
			categories:cateList,//x轴坐标在tooltip中的显示
			labels:{//x轴坐标数字
				step:xStep
			},
			tickLength:5,//X轴短线长度
			gridLineDashStyle:'LongDash',//网格横线类型
			gridLineWidth:0
		},
		yAxis: [{
			lineWidth:1,
			tickWidth:1,
			title:{//y轴标题
				text:yLeftTitle,
				style:{
//					fontFamily: '微软雅黑',
//					fontWeight:'normal',
				}
			},
			gridLineDashStyle:'LongDash',//网格横线类型,
		},{
			gridLineWidth:0,//网格横线类型
			lineWidth:1,
			tickWidth:1,
			title:{//y轴标题
				text:yRightTitle,
				rotation:270,
				style:{
//					fontFamily: '微软雅黑',
//					fontWeight:'normal',
				}
			},
			opposite:true
		}],
		tooltip: {
			crosshairs:true,
			shared:true,
		},
		colors:colors,//线色
		plotOptions: {
			series: {
				lineWidth:3,//线宽
				borderWidth:0,
				marker:{
					radius:0,
					lineWidth:2//点上线宽
				}
			},
		},
		series: seriesList
	});
}
//普通图                    Id       标题        x轴间隔，x标签  网格线样式       y轴标题 单位   是否显示图例 比较线色    数据       背景色
function renderToCommonChart(chartid,centertitle,step,cataList,gridLineDashStyle,ytitle,ySymbol,showLegend,parallelcolor,seriesList,backcolor,height,width,gridLineColor){
	$('#'+chartid).highcharts(
	{
		chart : {
			backgroundColor:backcolor,//背景色：整个表
			height:height,//调节上下长度
			width:width,	//调节左右宽度
			borderRadius:0,//边角弧度
		},
		title : {
			text : '<span style="font-size:14px;">'+centertitle+'</span>',
			style:{
					color:'#C0D0E0'
			}
		},
		xAxis : {
			labels : {
				step : parseInt(step),
				style:{
					color:'#C0D0E0'
				}
			},
			categories : cataList,
			gridLineDashStyle : (gridLineDashStyle == '' ? 'LongDash' : gridLineDashStyle),
			gridLineWidth:0,
			tickLength:1,
			tickColor:gridLineColor,
			lineColor:gridLineColor
		},
		credits : {
			enabled : false
		},
		yAxis : {
			gridLineDashStyle : (gridLineDashStyle == '' ? 'LongDash' : gridLineDashStyle),
			gridLineColor:gridLineColor,
			title : {
				text : ytitle,
				style:{
					color:'#C0D0E0',
					fontFamily: '微软雅黑',
					fontWeight:'normal',
				}
			},
			labels: {
				formatter: function() {
					return this.value + ySymbol; // Y轴数值后带的符号
				},
				style:{
					color:'#C0D0E0'
				}
			},
			tickWidth:1,
			tickColor:gridLineColor
		},
		legend:{
			enabled:showLegend,
			borderWidth:0,
			itemStyle:{
				color:'#FFF',
				fontFamily:'微软雅黑',
			},
		},
		 plotOptions: {
			series: {
				lineWidth:2,//线宽
				borderWidth:0,
				marker:{
					radius:0,
					lineWidth:2//点上线宽
				},
				color:'#AABB00'
			},
		},
		series : seriesList
	});
}
//大图
function renderToBigCommonChart(chartid,centertitle,step,cataList,gridLineDashStyle,ytitle,ySymbol,showLegend,
//比较线色    数据       背景色
parallelcolor,seriesList,backcolor){
	$('#'+chartid).highcharts(
	{
		chart : {
			height:242,//调节上下长度
			width:588,	//调节左右宽度
			borderRadius:0,//边角弧度
		},
		title : {
			text : "",
		},
		xAxis : {
			labels : {
				step : parseInt(step)
			},
			categories : cataList,
			gridLineDashStyle : (gridLineDashStyle == '' ? 'LongDash' : gridLineDashStyle),
			gridLineWidth:0
		},
		credits : {
			enabled : false
		},
		yAxis : {
			gridLineDashStyle : (gridLineDashStyle == '' ? 'LongDash' : gridLineDashStyle),
			title : {
				text :ytitle,
				style:{
					fontFamily:'微软雅黑',
					fontWeight:'normal',
				}
			},
			labels: {
				formatter: function() {
					return this.value + ySymbol; // Y轴数值后带的符号
				}
			},
			lineWidth:1,
			tickWidth:1,
		},
		legend:{
			enabled:showLegend
		},
		tooltip : {
			shared:true
		},
		 plotOptions: {
			series: {
				lineWidth:2,//线宽
				borderWidth:0,
				marker:{
					radius:0,
					lineWidth:2//点上线宽
				},
				trackByArea: true
			},
		},
		series : seriesList
	});
}
//圆环                ID      图型        标签        图色      数据   图例方向       图例水平位置  字色
function renderToRing(chartid,charttype, categories, colorsArr, datas,legendLayout,legendAlign,backcolor,
//标题
centerTitle,showLegend,height,width){
	var cates = categories,cArr=colorsArr,data=datas;
	var dataArrayList = [];
	try{
		
		// 循环添加数据
		for(var i=0;i<datas.length;i++){
			dataArrayList.push({
				name : cates[i],
				y : data[i],
				color : cArr[i]
			});
		}
	}catch(e){}
	$('#'+chartid).highcharts({
		chart : {
			plotBackgroundColor : null,
			plotBorderWidth : null,
			plotShadow : false,
			backgroundColor:backcolor,//背景色：整个表
			height:height,//调节上下长度
			width:width,	//调节左右宽度
			borderRadius:0,//边角弧度
		},
		title : {
			text :'<span style="font-size:14px;">'+centerTitle+'</span>',
			style:{
					color:'#C0D0E0'
			}
		},
		credits : {
			enabled : false
		},
		tooltip : {
			pointFormat : '<b>{point.y}%</b>'
		},
		plotOptions : {
			pie : {
				allowPointSelect : true,
				cursor : 'pointer',
				showInLegend : true,
				innerSize:'50%',
				dataLabels:{
					connectorWidth:1,
					distance:10,
					color:'#C0D0E0',
				},
				borderWidth:0
			}
		},
		legend : {
			enabled:showLegend,
			borderWidth:0,
			layout : (legendLayout == '' ? 'vertical' : legendLayout),
			align : (legendAlign == '' ? 'right' : legendAlign),
			itemStyle : {
				 color: '#FFF',
				 fontFamily:'微软雅黑'
			},
			verticalAlign:'middle',
		},
		series : [ {
			type : charttype,
			data : dataArrayList,
			dataLabels : {
				formatter : function() {
					return this.y + "%";
				}			
			}
		} ]
	});
}
//大圆环
function renderToBigRing(chartid,charttype, categories, colorsArr, datas,legendLayout,legendAlign,backcolor,
//标题
centerTitle){
	var cates = categories,cArr=colorsArr,data=datas;
	var dataArrayList = [];
	
	try{
		
		// 循环添加数据
		for(var i=0;i<datas.length;i++){
			dataArrayList.push({
				name : cates[i],
				y : data[i],
				color : cArr[i]
			});
		}
	}catch(e){}

	$('#'+chartid).highcharts({
		chart : {
			plotBackgroundColor : null,
			plotBorderWidth : null,
			plotShadow : false,
			backgroundColor:backcolor,//背景色：整个表
			height:242,//调节上下长度
			width:588,	//调节左右宽度
			borderRadius:0,//边角弧度
		},
		title : {
			text : centerTitle,
			style:{
					color:'#000'
			}
		},
		credits : {
			enabled : false
		},
		tooltip : {
			pointFormat : '<b>{point.y}%</b>'
		},
		plotOptions : {
			pie : {
				allowPointSelect : true,
				cursor : 'pointer',
				showInLegend : true,
				innerSize:'40%',
				dataLabels:{
					connectorWidth:1,
					distance:10,
					connectorColor:'#000',
					color:'#000'
				},
				borderWidth:0
			}
		},
		legend : {
			layout : (legendLayout == '' ? 'vertical' : legendLayout),
			align : (legendAlign == '' ? 'right' : legendAlign),
			itemStyle : {
				color: '#7F7FAB',
				fontFamily:'微软雅黑'
			},
			verticalAlign:'middle'
		},
		series : [ {
			type : charttype,
			data : dataArrayList,
			dataLabels : {
				formatter : function() {
					return this.y + "%";
				}			
			}
		} ]
	});
}
//数据处理
function getSeriesList(charttype,connectLineWidth,lineWidth,legendList,colorList,fillColorList,radiusList,symbol,referencevalue,referencetype,referencelegendname,referencecolor,dataList){
	var seriesList = [];
	var leList = legendList.split(",");
	var cList = colorList.split(",");
	var fcList = fillColorList.split(",");
	var rList = radiusList.split(",");
	var z=[1,2,1,2];
	//debugger;
	for(var k=0;k<dataList.length;k++){
		seriesList.push({
				 type : charttype,
				 name : leList[k],
				 color : cList[k], // 颜色列表
				 lineWidth : connectLineWidth == "" ? 2 : parseInt(connectLineWidth),// 连接线线宽，为空则默认为2，为0则不显示连接线
				 marker : {
					 lineWidth : lineWidth == "" ? 0 : parseInt(lineWidth),// 线宽，此为具体曲线点的点线宽  ，为空则默认为2
					 lineColor : cList[k], // 颜色列表
					 fillColor : fcList[k],// 填充颜色列表
					 radius : rList[k] == "" ? 4 : parseInt(rList[k]), //曲线点半径，默认是4
					 symbol : (symbol == '' ? 'circle' : symbol) //曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
				 },
				 data : dataList[k],
				 zIndex:z[k]
			});
	}
	
	// 如果参考值配置中有值，则添加对应的参考报表
	if(referencevalue!=''){
		var referenceList = []; // 参考值对应的数据列表
		try{
			// 循环对应dataList的元素个数，将参考数据个数和dataList中的元素个数一致
			for(var i=0;i<dataList[0].length;i++){
				referenceList.push(parseFloat(referencevalue));
			}
			seriesList.push({
				 type : referencetype,
				 name : referencelegendname,
				 color : referencecolor,
				 marker: {
					radius: 0,  //曲线点半径，默认是4
					symbol: 'circle' //曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
				 },
				 data : referenceList
			});
		}catch(e){}
	}
	return seriesList;
}
//设备监测-小图
function renderToChart(chartId,chartColor,data,name){
	$('#'+chartId).highcharts({
		chart : {
			type:'column',
			backgroundColor:'',
			//height:135,//调节上下长度
			//width:300,	//调节左右宽度
			borderRadius:0//边角弧度
		},
		title : {
			text : ''
		},
		xAxis : {
			lineColor:'#858BA3',
			tickColor:'#858BA3',
			tickLength:5,
			title:{
				enabled:false
			},
			tickInterval:2,
			labels:{
				style:{
					color:'#FFFFFF'
				}
			}
		},
		credits : {
			enabled : false
		},
		yAxis : {
			tickWidth:1,
			tickColor:'#858BA3',
			gridLineWidth:0,
			lineColor:'#858BA3',
			lineWidth:1,
			title:{
				enabled:false
			},
			allowDecimals:false,
			labels:{
				style:{
					color:'#FFFFFF'
				}
			}
		},
		legend:{
			enabled:false
		},
		plotOptions : {
			column : {
				borderWidth:0
			}
		},
		colors:[chartColor],
		series : [{
			name:name,
			data:data,
		}]
	});
}
//charttype数组 legend字符串 data单组数据
function renderToSimpleChart(id,legend,cataList,xStep,fillColor,yTitle,title,chartcolor,charttype,data,showLegend){
	$('#'+id).highcharts({
		chart:{
			type:charttype,
			width:556,
			height:242
		},
		credits:{
			enabled:false
		},
		title:{
			text:title
		},
		xAxis:{
			categories:cataList,
			labels:{
				step:xStep
			}
		},
		yAxis:{
			gridLineDashStyle: 'longdash',
			lineWidth:1,
			tickWidth:1,
			title:{
				text:yTitle
			},
			startOnTick:false,
		},
		legend:{
			enabled:showLegend
		},
		colors:chartcolor,
		plotOptions:{
			series:{
				marker:{
					fillColor:fillColor
				}
			}
		},
		series:[{
			name:legend,
			data:data
		}]
	});
}
//绘制多线图--设备监测
function getSBJCChart(id, legend, cataList, xStep,fillColor, yTitle,title, chartColor,charttype, dataList,showLegend){
	var data=[];
	data.push({
		name:legend,
		data:dataList
	});
	$("#"+id).highcharts({
		chart:{
			type:charttype,
			height:300,
			width:654
		},
		credits:{
			enabled:false
		},
		title:{
			text:title
		},
		xAxis:{
			categories:cataList,
			labels:{
				step:xStep
			}
		},
		yAxis:{
			gridLineDashStyle: 'longdash',
			lineWidth:1,
			tickWidth:1,
			title:{
				text:''
			},
			startOnTick:false,
		},
		legend:{
			enabled:showLegend
		},
		colors:chartColor.split(','),
		plotOptions:{
			series:{
				marker:{
					fillColor:'white',
					lineWidth:1,
					lineColor:chartColor.split(',')[0]
				}
			}
		},
		series:data
	});
}
//运行负载率
function getYXFZLChart(chartid){
	$("#"+chartid).highcharts({
		chart:{//基本表
			type:'column',//表格式：线形，柱形，饼形等
			width:556,
			height:242,
			borderRadius:3,//边角弧度
		},
		credits:{//引用网页
				enabled:false,
			},
		exporting:{//导出表
			enabled:false,
		},
		title:{
			text:null//去标题
		},
		xAxis:[{
			tickPositions: [1, 3, 5, 7,9,11,13,15,17,19,21,23],
			lineColor:'#C8D59D',//x轴线颜色
			lineWidth:1,//x轴线宽度
			tickWidth:1
		}],
		yAxis: [{//y轴编号‘0’
			gridLineDashStyle:'LongDash',//网格横线类型
			lineWidth:1,
			tickWidth:1,
			title:{
				text:'负载率(%)'
			},
			labels:{
				format:'{value}%'//坐标单位%
			}
		},{//y轴编号‘1’
			title:{
				text:'COP',
				rotation:270,//标题旋转角度
			},
			min:0,//坐标从0开始显示
			allowDecimals:true,//坐标允许出现小数
			labels:{
				style:{
					color:'01893F',
				}
			},
			gridLineWidth:0,//网格线宽度
			lineWidth:1,
			tickWidth:1,
			tickInterval:1.0,
			opposite:true//在x轴右端显示
		}],
		tooltip: {
            shared: true//联合显示tip
        },
		legend:{
			borderColor: '#FFFFFF',//图例边框线宽
		},
		colors:['#FFBE00','#65C9FB','#98B853','#FD99FC','#01893F'],//柱色
		plotOptions: {
			column:{
				stacking:'normal',//柱形堆叠
				pointWidth:10,//柱形宽度
			},
			spline:{
				lineWidth:8,//线宽
			}
		},
		series: [{
			name:'冷机1#',//数据名：显示在tooltip第一行
			data: [80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80,null,null,null,null],
			type:'column',
			tooltip:{
				valueSuffix:'%',//tooltip中显示单位‘%’
			}
		},{
			name:'冷机2#',//数据名：显示在tooltip第一行
			data: [null,null,null,null,null,null,null,75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75,null,null,null,null],
			type:'column',
			tooltip:{
				valueSuffix:'%',
			}
		},{
			name:'冷机3#',
			data:[null,null,null,null,null,null,null,55,90,55,55,55,55,55,55,55,55,55,55,55, 80, 80, 80, 80],
			type:'column',
			tooltip:{
				valueSuffix:'%',
			}
		},{
			name:'冷机4#',
			data:[null,null,null,null,null,null,null,60,60,60,60,60,60,60,60,60,60,60,60,60, 55, 55, 55, 55],
			type:'column',
			tooltip:{
				valueSuffix:'%',
			}
		},{
			name:'COP',
			data:[2.5, 3.0,3.1, 3.2, 3.0, 2.8,2.5,2.6,2.4,2.9,3.1,3.2,3.3,3.5,3.4,3.3,3.2,3.1,3.1,3.2,3.0,2.8,2.7,2.6],
			type:'spline',//平滑线
			yAxis:1,//以编号为‘1’的y轴为基准
		}],
	});
}
//运行趋势-运行时间
function getYXSJChart(chartId){
	$('#'+chartId).highcharts({
        chart: {
            height:40,
			width:430,
            type: 'column',
			spacingTop:0,
			spacingBottom:0,
			spacingLeft:0,
			spacingRight:0,
			marginTop:0,
        },
        title: {
            text: ''
        },
        xAxis:{
            labels:{
                enabled:false,
            },
            tickLength:0,
            lineWidth: 0
        },
        yAxis: {
            min: 0,
            title: {
                text: ''
            },
            labels:{
                enabled:false,
            },
            tickWidth:0,
            gridLineWidth: 0
        },
        legend: {
            enabled:false,
        },
        plotOptions: {
            column: {
                borderWidth:0,
                stacking: 'percent',
                groupPadding:0,
                pointWidth:18
            }
        },
         tooltip: {
            formatter: function() {
                return this.x +
                    '点状态:<b>'+ this.series.name+'</b>';
            }
        },
		colors:['#33CCCC','#E8FCFD'],
        exporting:{
            enabled:false
        },
        credits:{
            enabled:false
        },
        series: [{
            name: '开启',
            data: [10, null, 10, null, 10,10, null, 10, null, 10,10, null, 10, null, 10,10, null, 10, null, 10,10, null, 10, null]
        },{
            name: '关闭',
            data: [null, 10, null, 10, null,null, 10, null, 10, null,null, 10, null, 10, null,null, 10, null, 10, null,null, 10, null, 10]
        }]
    });
}
//设备详情-运行时间
function getSBXQ_YXSJchart(id){
	$("#"+id).highcharts({
	    chart: {
	        type: 'line',
			borderRadius:2,
			width:600,
			height:60,
			backgroundColor: '',
			//plotBorderWidth:0,//图表边宽度
			spacingBottom:0,//表边距
	    },
		credits:{//版权引用
			enabled:false,
		},
		exporting:{//导出表
			enabled:false,
		},
		legend:{//图例
			enabled:false,
		},
		plotOptions:{//图表区显示
			line:{
				stacking:'normal',
			},
			
		},
		series:[{
			name:'打开',
			data:[10,10,10,null,null,10,10,null,null,10,10],
			connectNulls:true,
			zIndex:1,
		},{
			name:'关闭',
			data:[null,null,null,10,10,null,null,10,10,null,null],
			connectEnds:true,
			zIndex:2,
		}],
		title:{
			text:null,
		},
		colors:['#FF6600','#ACB4D0'],
		tooltip:{},
		xAxis:{
			title:{
				enabled:false
			},
			labels:{
				enabled:false
			},
			lineWidth:0
		},
		yAxis:{
			title:{
				enabled:false
			},
			labels:{
				enabled:false
			},
		},
	});
}
//设备详情-运行时间（周月）
function getYXSJ_zhouChart(id,cateList,data){
	$("#"+id).highcharts({
		chart:{
			type:'column',
		},
		title: {
            text: ''
        },
        xAxis: {
            categories: cateList
        },
        yAxis: {
        	gridLineDashStyle: 'longdash',
            min: 0,
            title: {
                text: '运行时间(h)'
            }
        },
		credits:{
			enabled:false
		},
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f}h</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        legend:{
        	enabled:false
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: '运行时间',
            data: data

        }]
	});
}