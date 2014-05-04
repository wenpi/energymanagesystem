// 返回上升或者下降的对应的符号
function returnUpOrDown(updown){
	var val_str = ''; // 存储上升、下降
	try{
		if (parseFloat(updown) < parseFloat(0)) { // 如果小于0，则显示下降符号
			val_str = '↓';
		} else if (parseFloat(updown) > parseFloat(0)) { // 如果大于0，则显示上升符号
			val_str = '↑';
		} else {
			val_str = '';
		}
	}catch(e){
		val_str = '';
	}
	
	return val_str;
}

// 将负数转化成正数  
function returnPositiveVal(val,decimals){
	var dec = 2; // 默认保留两位小数
	decimals = (decimals == undefined || decimals == '' ? '0.00' : decimals); // 判断decimals是保留几位小数
	if(decimals == '0.00'){
		dec = 2;
	} else if(decimals == '0.0'){
		dec = 1;
	} else if(decimals == '0'){
		dec = 0;
	}
	var zhi = parseFloat(val) < parseFloat(0) ? (val.slice(1)) : val;
	return decimal(zhi,dec);
}

//num表示要四舍五入的数,v表示要保留的小数位数。
function decimal(num,v)
{
    var vv = Math.pow(10,v);
    return Math.round(parseFloat(num)*vv)/vv;
}

// 显示当前日期对应的周的第一天
function showWeekFirstDay(s)
{
	var Nowdate = new Date(Date.parse(s.replace(/-/g, '/')));
	var WeekFirstDay=new Date(Nowdate-((Nowdate.getDay() == 0 ? 7 : Nowdate.getDay())-1)*86400000);
	var day = (WeekFirstDay.getDate() + "");
	day = day.length == 1 ? ("0" + day) : day;
	var month = ((WeekFirstDay.getMonth()+1) + "");
	month = month.length == 1 ? ("0" + month) : month;
	t = [WeekFirstDay.getFullYear(), month, day ];
	return t.join('-');
}

// 显示当前日期对应的周的最后一天
function showWeekLastDay(s)
{
	var Nowdate = new Date(Date.parse(s.replace(/-/g, '/')));
	var WeekFirstDay=new Date(Nowdate-((Nowdate.getDay() == 0 ? 7 : Nowdate.getDay())-1)*86400000);
	var WeekLastDay=new Date((WeekFirstDay/1000+6*86400)*1000);	
	var day = (WeekLastDay.getDate() + "");
	day = day.length == 1 ? ("0" + day) : day;
	var month = ((WeekLastDay.getMonth()+1) + "");
	month = month.length == 1 ? ("0" + month) : month;
	t = [WeekLastDay.getFullYear(), month, day ];
	return t.join('-');
}

// 当前选择的时间当月的最后一天（例如：当前s为2013-08-22(22为8月的随意一天都可)返回2013-08-31）
function showMonthLastDay(s)
{
	var d = new Date(Date.parse(s.replace(/-/g, '/')));
	var nextMonthFirstDay=new Date(d.getFullYear(),d.getMonth()+1,1);
	var result=new Date(nextMonthFirstDay-86400000);
	var month = ((result.getMonth()+1) + "");
	month = month.length == 1 ? ("0" + month) : month;
	t = [result.getFullYear(), month, result.getDate() ];
	return t.join('-');
}

// 渲染combogrid，用于选择吴尘提供的对应的name和id
function renderQueryScheme(url,renderid,showfield){
	$("#"+renderid).combogrid({
		panelWidth:500,
		height : 500,
		rownumbers:true,//序号 
		collapsible:false,//是否可折叠的 
		value:$("#"+renderid).val(),
		idField:showfield,
		textField:showfield,
		pagination : true,//是否分页
		rownumbers:true,
		fit: true,
		pageSize: 20,
		pageList: [10,20,30,40,50],
		url:url,
		frozenColumns : [[{
			field : 'ff',
			checkbox : true,
			sortable : true
		}]],
		fitColumns: true,
		columns:[[
			{field:'id',title:'urlId',width:$(this).width() * 0.15}, 
			{field:'name',title:'urlName',width:$(this).width() * 0.2},
			{field:'comments',title:'名称',width:$(this).width() * 0.2}
		]],keyHandler: {
			query: function(q){
				$('#'+renderid).combogrid("grid").datagrid("reload", { 'keyword': q });
				$('#'+renderid).combogrid("setValue", q);
			}
		}
	});
}

// 渲染报表图形
// chartid表示要渲染的id
// charttype表示要渲染的图形
// ytitle表示y轴的标题
// c_color表示图形的颜色
// step表示x轴显示的间隔
// fillcolor表示图形的填充颜色
// symbol表示图形的曲线点类型
// cateList表示X轴的列表
// dataList表示数据列表
function renderToColumnAndLineCharts(chartid,charttype,charttitle,ytitle,c_color,step,fillcolor,symbol,cateList,dataList){
	// 为建筑总能耗趋势报表填充数据
	$('#'+chartid).highcharts(
					{
						chart : {
							type : charttype
							//, backgroundColor : '#F2F2F2'
						},
						title: {
							text : '<span style="font-size:14px;">'+charttitle+'</span>'
						},
						xAxis : {
							labels : {
								step : step
							},
							categories : cateList
						},
						credits : {
							enabled : false
						},
						plotOptions: {
							area: {
								fillColor: {
									linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1},
									stops: [
										[0, c_color],
										[1, Highcharts.Color(c_color).setOpacity(0).get('rgba')]
									]
								},
								lineWidth: 1,
								marker: {
									enabled: false
								},
								shadow: false,
								states: {
									hover: {
										lineWidth: 1
									}
								},
								threshold: null
							}
						},
						yAxis : {
							gridLineDashStyle : 'LongDash',
							title : {
								text : '<span style="color:#7F7F7F;font-size:12px;">'+ytitle+'</span>'
							}
						},
						legend : {
							enabled : false
						},
						tooltip : {
							formatter : function() {
								return '<b>'
										+ Highcharts.numberFormat(this.y, 1)
										+ '</b><br/>'
							}
						},
						series : [ {
							color : c_color,
							marker : {
								fillColor : fillcolor,
								lineWidth : 2,
								lineColor : c_color,
								symbol: (symbol == "" ? 'circle' : symbol) //曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
							},
							data : dataList
						} ]
					});
}

// 渲染报表图形(适用于曲线图或者柱状图带平行线的情况)
// chartid表示要渲染的id
// charttype表示要渲染的图形
// ytitle表示y轴的标题
// c_color表示图形的颜色
// step表示x轴显示的间隔
// fillcolor表示图形的填充颜色
// dataname表示图形的曲线名称
// parallelname表示图形平行的名称
// parallelcolor表示图形的中间平行线的颜色
// linewidth表示图形的曲线的宽度
// symbol表示图形的中曲线点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
// xValueList表示图形的X轴的数值列表
// ySymbol表示图形的Y轴数值后带的符号
// cateList表示X轴的列表
// dataList表示第一个图数据列表
// cateList表示第二个图数据列表
function rendToChartMoreSeries(chartid,charttype,ytitle,c_color,step,fillcolor,dataname,paralleltype,parallelname,parallelcolor,linewidth,symbol,xValueList,ySymbol,cataList,dataList,paraList){
	// var dataArrayList = [],parallelList=[]; // 定义一个数组存放数据
	// var categoriesList = []; // 存放X轴的数值
	
	// var now_date = new Date();	
	
	// for(var i=0;i<now_date.getHours();i++){
		// dataArrayList.push(Math.floor(Math.random()*24));
		// parallelList.push(15);
		
		// categoriesList.push((i+1)+':00');
	// }
	
	// var xList = xValueList;
	
	// try{
		// if(xList.length>0){
			// categoriesList = [],dataArrayList = [],parallelList=[]; // 存放X轴的数值
			// categoriesList = xValueList;
		// }
		
		////循环添加数据
		// for(var i=0;i<xList.length;i++){
			// dataArrayList.push(Math.floor(Math.random()*24));
			// parallelList.push(Math.floor(Math.random()*10));
		// }
	// }catch(e){}

	$('#'+chartid).highcharts(
					{
						chart : {
							type : charttype
						},
						title : {
							text : ''
						},
						xAxis : {
							labels : {
								step : step
							},
							//tickPixelInterval:150,
							categories : cataList
						},
						credits : {
							enabled : false
						},
						yAxis : {
							gridLineDashStyle : 'LongDash',
							title : {
								text : '<span style="color:#7F7F7F;font-size:12px;">'+ytitle+'</span>'
							},
							labels: {
								formatter: function() {
									return this.value + ySymbol; // Y轴数值后带的符号
								}
							}
						},
						legend : {
							enabled:true							
						},
						tooltip : {
							formatter : function() {
								return '<b>'
										+ Highcharts.numberFormat(this.y, 1)
										+ '</b><br/>'
							}
						},
						 plotOptions: {
							area: {
								fillColor: {
									linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1},
									stops: [
										[0, parallelcolor],
										[1, Highcharts.Color(parallelcolor).setOpacity(0).get('rgba')]
									]
								},
								lineWidth: 1,
								marker: {
									enabled: false
								},
								shadow: false,
								states: {
									hover: {
										lineWidth: 1
									}
								},
								threshold: null
							}
						},
						series : [ {
							name : dataname,
							color : c_color,
							marker : {
								fillColor : fillcolor,
								lineWidth : 2,
								lineColor : c_color,
								symbol: (symbol == "" ? 'circle' : symbol) //曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
							},
							lineWidth: (linewidth == "0") ? 0 : 2,
							data : dataList
						}, {
							type : paralleltype,
							name : parallelname,
							marker: {
								radius: 0,  //曲线点半径，默认是4
								symbol: 'diamond' //曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
							},
							color: parallelcolor,
							data: paraList
						} ]
					});
}

// 渲染报表图形
// chartid表示要渲染的id
// charttype表示要渲染的图形
// leftTitle表示图中的左上角的标题
// categoriesss表示图中的文字选项
// colorsArrss表示图中对应的颜色列表
// datass表示图中对应的数据列表
// showLegend表示表示是否显示图例
// lableValue表示图中的文字显示类型（nameAndY显示名称和值，onlyY显示对应的值）
// backgroundColor表示图中的背景颜色
// pieSize表示图中的饼图的大小
// innerSize表示图中的饼图的宽窄
// distance表示饼图中的文字的位置
function renderToPieCharts(chartid,charttype,leftTitle,categoriesss,colorsArrss,datass,showLegend,lableValue,backgroundColor,pieSize,innerSize,distance){
	var colorsArr = colorsArrss,
            categories = categoriesss,
            datas = datass,
			data = [];
			
			// 循环添加数据
			for (var k = 0; k < datas.length; k++) {
                data.push({
                    color: colorsArr[k],
                    drilldown: {
                        categories: categories[k],
                        data: datas[k]
						,color: colorsArr[k]
                    }
                });
            }
			
    
    
        // Build the data arrays
        var browserData = [];
        var versionsData = [];
        for (var i = 0; i < data.length; i++) {
    
            // add version data
            for (var j = 0; j < data[i].drilldown.data.length; j++) {
                var brightness = 0.2 - (j / data[i].drilldown.data.length) / 5 ;
                versionsData.push({
                    name: data[i].drilldown.categories[j],
                    y: data[i].drilldown.data[j],
                    color: Highcharts.Color(data[i].color).brighten(brightness).get()
                });
            }
        }
    
        // Create the chart
        $('#'+chartid).highcharts({
            chart: {
                type: charttype,
				backgroundColor : (backgroundColor == '' ? '#FFF' : backgroundColor)
            },
            title: {
                text: '<b style="color:#FFFFFF;font-size:20px; font-family:宋体;">'+ leftTitle +'</b>',
                style: {
					fontWeight: 'bold'
				},
				x : -170
            },
			credits:{
				enabled : false     // 不显示版权信息        	
			},
            plotOptions: {
                pie: {
                    showInLegend: true,
                    shadow: false,
					dataLabels:{
						enabled :true // 不在饼图上显示提示信息
					},
                    center: ['50%', '50%']
                }
            },
            legend: { 
				enabled:showLegend,
                layout: 'vertical', // 显示形式，支持水平horizontal和垂直vertical
                align: 'right',
                verticalAlign: 'top',
                x: -10,
                y: 30,
                borderWidth: 0
            },
            tooltip: {
				enabled : true
            },
            series: [ {
                data: versionsData,
                size: (pieSize = '' ? '100%' : pieSize),
                innerSize: (innerSize == '' ? '40%' : innerSize),
				color:'#FFFFFF',
				dataLabels : {
					formatter : function() {
						var str = '';
						if(lableValue=="nameAndY"){
							str = this.point.name;
						}
						return str + this.y + "%";
					},
					distance : (distance == '' ? -20 : distance)
				}
            }]
        });
}

// 渲染报表图形带图例
// chartid表示要渲染的id
// charttype表示要渲染的图形
// categories表示要显示的图例列表
// colorsArr表示要要显示的图例颜色列表
// datas表示要显示的数据列表 
// legendLayout表示图例的布局是水平horizontal和垂直vertical
// legendAlign表示图例的对齐方式（left/center/right）
// wordColor表示显示在图表中的文字的颜色
function renderToPieChartsAndLegend(chartid,charttype, categories, colorsArr, datas,legendLayout,legendAlign,wordColor,centerTitle,innerSize){
	
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

	var op_charts = {
		chart : {
			plotBackgroundColor : null,
			plotBorderWidth : null,
			plotShadow : false
		},
		title : {
			text : '<span style="font-size:14px;">'+centerTitle+'</span>'
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
				showInLegend : true
			}
		},
		legend : {
			layout : (legendLayout == '' ? 'vertical' : legendLayout),
			align : (legendAlign == '' ? 'right' : legendAlign),
			itemStyle : {
				fontSize : '14px'
			},
			itemMarginTop : 5,
			borderWidth : 0
		},
		series : [ {
			type : charttype,
			data : dataArrayList,
			dataLabels : {
				formatter : function() {
					return this.y + "%";
				},
				//color : (wordColor == '' ? 'white' : wordColor), // 图表中的字体颜色
				distance : 10 	  // 图表中显示到文字对应在图表中的位置
			}
		} ]
	};
		
	if(innerSize!=""){ // 根据innerSize的值来赋值
		op_charts.series[0].innerSize = innerSize + "%";
	}
	
	$('#'+chartid).highcharts(op_charts);
}


// 渲染报表图形带图例
// chartid表示要渲染的id
// charttype表示要渲染的图形
// categories表示要显示的图例列表
// colorsArr表示要要显示的图例颜色列表
// datas表示要显示的数据列表 
// legendLayout表示图例的布局是水平horizontal和垂直vertical
// legendAlign表示图例的对齐方式（left/center/right）
// wordColor表示显示在图表中的文字的颜色
function renderToChartLine(chartid,charttype, marginRight, backgroundColor, marginBottom,chartTitle,titleColor,fontSize,fontWeight,fontFamily,xTitlePosition,xstep,yLeftTilte,yFontColor,valueSuffix,chartLegendLayout,chartLegendAlign,verticalAlign,borderWidth,legendXPosition,legendYPosition,seriesRadius,linewidth,chartLegendList,chartColorList,cataList,dataList){	
	var currDataList = [];
	for(var i=0;i<chartLegendList.length;i++){
		currDataList.push({
			name: '<b style="color:' + chartColorList[i] + ';">'+ chartLegendList[i] +'</b>',
			color: chartColorList[i],
			lineWidth: linewidth,
			data: dataList[i]//cDataList[i]
		});
	}

	$('#'+chartid).highcharts({
            chart: {
                type: charttype,
                marginRight: marginRight,
				backgroundColor : backgroundColor,
                marginBottom: marginBottom
            },
            title: {
                // text: '<span>'+ chartTitle +'</span>',
                // style: {
					// color: titleColor,
					// fontSize: fontSize,
					// fontWeight: fontWeight,
					// fontFamily:fontFamily
				// },
				// x : xTitlePosition
				text: '<b style="color:#FFFFFF;font-size:20px; font-family:宋体;">'+ chartTitle +'</b>',
                style: {
					fontWeight: 'bold'
				},
				x : -170
            },
            credits:{
            	enabled : false            	
            },
			xAxis : {
				labels : {
					style: {
						color: yFontColor
					},
					step : xstep
				},
				categories : cataList
			},
            yAxis: {
				gridLineDashStyle : "LongDash",
				gridLineWidth : 0,
                title: {
                    text: '<span style="color:#FFFFFF;font-size:13px; ">'+ yLeftTilte +'</span>' // y轴的标题
                },
				tickPixelInterval:30,
				labels: {//设置纵坐标显示内容的样式
					style: {
						color: yFontColor
					}
				}
            },
            tooltip: {
                valueSuffix: valueSuffix,
				enabled : true // 鼠标经过时是否可动态呈现
            },
            legend: { 
                layout: (chartLegendLayout == '' ? 'vertical' : chartLegendLayout), // 显示形式，支持水平horizontal和垂直vertical
                align: chartLegendAlign,
                verticalAlign: verticalAlign,
                x: legendXPosition,
                y: legendYPosition,
                borderWidth: borderWidth
            },
			plotOptions: {
				series: {
					marker: {
						radius: seriesRadius  //曲线点半径，默认是4
					}
				}
			}, 
            series: currDataList
        });

}


// 渲染报表图形带图例
// chartid表示要渲染的id
// charttype表示要渲染的图形
// xStep表示要x轴显示的间隔
// chartTitle表示图表中显示的标题 
// gridLineDashStyle表示要列表中的线的样式
// lineWidth表示线宽
// yLeftTitle表示Y轴左侧的标题
// yRightTitle表示Y轴右侧的标题
// toolTipColor表示提示颜色
// toolTipTitle表示提示信息标题
// tipUnit表示提示信息单位
// chartLegendList表示图例列表
// chartColorList表示图例颜色列表
// chartDataList表示图表数据列表
// chartFillColorList表示图表填充颜色列表
// chartRadiusList表示图表曲线半径列表
// chartSymbolList表示图表曲线类型列表
// chartYAxisList表示是否显示y轴的值
// cataList表示X轴显示列表
function renderToTwoChart(chartid,charttype, xStep, chartTitle, gridLineDashStyle,lineWidth,yLeftTitle,yRightTitle,toolTipColor,toolTipTitle,tipUnit,chartLegendList,chartColorList,chartDataList,chartFillColorList,chartRadiusList,chartSymbolList,chartYAxisList,cataList){
	
	var seriesList = []; // 定义一个数组存放数据
	
	var legendList = chartLegendList,colorList = chartColorList,dataList = chartDataList,symbolList = chartSymbolList , yAxisList = chartYAxisList, fillColorList = chartFillColorList, radiusList = chartRadiusList ;
	
	for(var k=0;k<dataList.length;k++){
		var unit = '';
		if(legendList[k]=="室外温度")
			unit = '℃';
		else if(legendList[k]=="室外湿度")
			unit = '%';
		seriesList.push({
			 name : legendList[k],
			 color : colorList[k],
			 marker : {
				 lineWidth : parseInt(lineWidth),
				 lineColor : colorList[k],
				 fillColor : fillColorList[k],
				 radius : (radiusList[k] == '' ? 4 : parseInt(radiusList[k])), //曲线点半径，默认是4
				 symbol : (symbolList[k] == '' ? 'circle' : symbolList[k]) //曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
			 },
			 tooltip: {
                valueSuffix: unit
             },
			 data : dataList[k],
			 yAxis : yAxisList[k] == undefined ? '0' : yAxisList[k]
		});
	}
	
	$('#'+chartid).highcharts({
			chart : {
				type : charttype
			},
			title : {
				text : '<span style="font-size:14px;">'+chartTitle+'</span>'
			},
			credits : {
				enabled : false
			},
			xAxis : {
				tickColor : '#FFFFFF', // 刻度线的颜色
				labels : {
					step : xStep //4就是x轴显示的间隔
				},
				categories : cataList
			},
			yAxis : [ {
				gridLineDashStyle : gridLineDashStyle,
				title : {
					text : yLeftTitle
				}
			}, {
				opposite : true,
				title : {
					text : yRightTitle
				}
			} ],
			tooltip : {
				crosshairs : true,
				// headerFormat : '<table style="color:' + ( toolTipColor == '' ? '#FF9900' : toolTipColor) + ';"><tr><td>'+toolTipTitle+'</td><td>{point.key}</td></tr>',
				// pointFormat : '<tr><td>{series.name}</td>'
						// + '<td><b>{point.y:.0f} ' +  '</b></td></tr>',//tipUnit +
				// footerFormat : '</table>',
				// useHTML : true,
				//percentageDecimals : 0,
				//borderRadius : 5,
				shared : true
				// ,
				// formatter:function(thischart){
					// return  '<b>'+thischart.chart.series[0].name+'</b>:'+this.points[0].y+(thischart.chart.series[0].name=="室外温度"?"℃":"%")+"<br/>"+
							// '<b>'+thischart.chart.series[1].name+'</b>:'+this.points[1].y+(thischart.chart.series[1].name=="室外湿度"?"%":"℃");
				// }

			},
			series : seriesList
		});

}



















// 返回图表需要的数据列表
function returnSeriesList(charttype,connectLineWidth,lineWidth,legendList,colorList,fillColorList,radiusList,symbol,referencevalue,referencetype,referencelegendname,referencecolor,dataList){
	var seriesList = [];
	var leList = legendList.split(",");
	var cList = colorList.split(",");
	var fcList = fillColorList.split(",");
	var rList = radiusList.split(",");
	
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
				 data : dataList[k]
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
	//debugger;
	return seriesList;
}

// 渲染报表图形(适用于曲线图或者柱状图带平行线的情况)
// chartid表示要渲染的id
// charttype表示要渲染的图形
// ytitle表示y轴的标题
// c_color表示图形的颜色
// step表示x轴显示的间隔
// fillcolor表示图形的填充颜色
// dataname表示图形的曲线名称
// parallelname表示图形平行的名称
// parallelcolor表示图形的中间平行线的颜色
// linewidth表示图形的曲线的宽度
// symbol表示图形的中曲线点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
// xValueList表示图形的X轴的数值列表
// ySymbol表示图形的Y轴数值后带的符号
// cateList表示X轴的列表
// dataList表示第一个图数据列表
// cateList表示第二个图数据列表
function renderCompareChart(chartid,centertitle,step,cataList,gridLineDashStyle,ytitle,ySymbol,showLegend,parallelcolor,seriesList){
	var optChart = {
						chart : {
							borderRadius : 0
						},
						title : {
							text : '<span style="font-size:14px;">'+centertitle+'</span>'
						},
						xAxis : {
							labels : {
								step : parseInt(step)
							},
							categories : cataList
						},
						credits : {
							enabled : false
						},
						yAxis : {
							gridLineDashStyle : (gridLineDashStyle == '' ? 'LongDash' : gridLineDashStyle),
							title : {
								text : '<span style="color:#7F7F7F;font-size:12px;">'+ytitle+'</span>'
							},
							labels: {
								formatter: function() {
									return this.value + ySymbol; // Y轴数值后带的符号
								}
							}
						},
						legend : {
							enabled:showLegend
						},
						tooltip : {
							formatter : function() {
								return '<b>'
										//+ this.series.name + '-' + this.x +'：' 
										+ this.y//Highcharts.numberFormat(this.y, 1)
										+ '</b><br/>'
							}
						},
						 plotOptions: {
							area: {
								fillColor: {
									linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1},
									stops: [
										[0, parallelcolor],
										[1, Highcharts.Color(parallelcolor).setOpacity(0).get('rgba')]
									]
								},
								lineWidth: 1,
								marker: {
									enabled: false
								},
								shadow: false,
								states: {
									hover: {
										lineWidth: 1
									}
								},
								threshold: null
							}
						},
						series : seriesList
					};
	$('#'+chartid).highcharts(optChart);
}


// 生成面积图
function buildAreaChart(chartid,dataList,color) {
	var chart = new Highcharts.Chart({
	    chart: {
	        renderTo: chartid,
	        defaultSeriesType:'area',
	        margin:[0,0,0,0]//设置绘图区域与图表边缘的间距，其4个参数分别影响与上边缘，右边缘，下边缘以及左边缘之间的间距，默认值为：[null]		    
	    },
		//设置图表主标题
	    title:{
	    	text:''//将主标题文本内容设为''或null，即不显示主标题，默认为："Chart title"
	    },
	    xAxis: {
	        min:0,//设置x轴上最小从哪个x值开始显示，默认为：null
	        max:11,//设置x轴上最大显示到哪个x值，默认为：null
	        //设置x轴类别标签项
			labels:{
	        	enabled:false//设置是否显示x轴类别标签，默认为：true
	        },
	        tickLength :0,//设置x轴刻度标签的长度，默认为：5px
	        tickWidth:0,//设置x轴刻度标签的宽度，默认为：1px
	        lineWidth:0//设置x轴轴线的宽度，默认为：1px
	    },   
	    yAxis:{
			//设置y轴图表标题
	    	title:{
	    		text:''//将主标题文本内容设为''或null，即不显示主标题，默认为："Y-values".
	    	},
			 //设置y轴类别标签项
	    	labels:{
	        	enabled:false//设置是否显示y轴值标签，默认为：true
	        },
	        startOnTick :false,//设置当y轴其上限不足一个y轴显示单位时，是否向上补满一个y轴显示单位
	        endOnTick:false,//设置当y轴其下限不足一个y轴显示单位时，是否向下补满一个y轴显示单位
	        maxPadding:0,//设置y值最大的数据点与绘图区域上边缘之间的间距，默认为：0.05，即5px
	        minPadding:0,//设置y值最小的数据点与绘图区域下边缘之间的间距，默认为：0.05，即5px
	    	gridLineWidth:0//设置y轴网格线的宽度，默认为：1px
	    },
		//设置图例项
	    legend:{
	    	enabled:false//设置是否显示图例区域，默认为：true
	    },
		//设置版权及链接项
	    credits:{
	    	enabled:false//设置是否显示设置版权及链接区域，默认为：true
	    },
	    tooltip: {
			enabled : false
        },
		plotOptions: {
			series: {
				marker: {
					radius: 0  //曲线点半径，默认是4
				},
				color: color
			}
		},
	    series: [{
	        data: dataList
	    }]
	});
}

// 针对工具集上面的柱状图做的定制
function renderToolbarChart(chartid, charttype, categories, datalist, pointWidth) {
	var colorList = ['#FEB0C8', '#A15C82', '#FFBC8B', '#B54633', '#AD4952', '#FFB18F', '#FFBC8B', '#F63832'];
	var serieslist = [];
	for(var i=0;i<categories.length;i++) {
		serieslist.push({
			name : categories[i],
			y : datalist[i],
			color : colorList[i]
		});
	}
	$('#' + chartid).highcharts({
		chart : {
			type : charttype,
			width: 500,
			height: 230
		},
		credits:{
	    	enabled:false//设置是否显示设置版权及链接区域，默认为：true
	    },
		title : {
			text : ' kg CO2',
			align : 'right'
		},
		xAxis : {
			categories : categories,
			gridLineWidth : 2,
			gridLineDashStyle : 'longdash'
		},
		yAxis : {
			min : 0,
			title : {
				text : ''
			},
			gridLineWidth : 0
		},
		legend : {
			enabled : false
		},
		plotOptions : {
			column : {
				pointWidth : pointWidth // 控制柱状图的宽窄
			}
		},
		tooltip : {
			headerFormat : '<span style="font-size:10px">{point.key}：<b>{point.y:.1f}</b></span>',
			pointFormat : '',
			footerFormat : ''
		},
		series : [{
			name: '',
			data: serieslist
		}]
	});
}