// 生成双y轴图表
function autoRenderToMoreCharts(chartid, charttype, bgcolor, select_names,
		step, centertitle, gridLineDashStyle, chartSymbolList, lineWidth,
		connectLineWidth, yLeftTitle, yRightTitle, showLegend, showXGridLine,
		showYGridLine, chartLegendList, chartColorList, chartDataList,
		chartFillColorList, chartRadiusList, ySymbol, chartYAxisList, cataList) {
	var seriesList = []; // 定义一个数组存放数据
	var LySymbol = "";// 左侧Y轴单位
	var RySymbol = "";// 右侧Y轴单位
	var ctList = charttype.split(",");// 存储图表类别列表
	var legendList = chartLegendList;// 数据列名称列表
	var colorList = chartColorList;// 颜色列表
	var dataList = chartDataList;// 数据信息
	var fillColorList = chartFillColorList;// 填充颜色列表
	var symbolList = chartSymbolList;// 曲线点类型
	var radiusList = chartRadiusList;// 曲线点半径列表
	var yAxisList = chartYAxisList;// Y轴数据列表
	var yLabledFormt = []; // 格式化y轴上的标签

	var j = 0;// 计数
	if (ySymbol != "" && ySymbol.split(",").length > 0) {
		var ySymbolList = ySymbol.split(",");// 读取Y轴单位信息
		LySymbol = ySymbolList[0];
		RySymbol = ySymbolList[1];
	}
	// 保存y轴标签格式化信息
	if (LySymbol != "") {
		yLabledFormt.push({
					formatter : function() {
						return this.value + LySymbol; // Y轴数值后带的符号
					}
				});
	} else {
		yLabledFormt.push({

		});
	}

	// 保存y轴标签格式化信息
	if (RySymbol != "") {
		yLabledFormt.push({
					formatter : function() {
						return this.value + RySymbol; // Y轴数值后带的符号
					}
				});
	} else {
		yLabledFormt.push({

		});
	}

	for (var k = 0; k < dataList.length; k++) {
		seriesList.push({
			type : ctList[j],
			lineWidth : connectLineWidth == "" ? 2 : parseInt(connectLineWidth),// 连接线线宽，为空则默认为2，为0则不显示连接线
			name : legendList[k],
			color : colorList[k],
			marker : {
				lineWidth : parseInt(lineWidth),
				lineColor : colorList[k],
				fillColor : fillColorList[k],
				radius : (radiusList[k] == '' ? 0 : parseInt(radiusList[k])), // 曲线点半径，默认是0
				symbol : (symbolList == '' ? 'circle' : symbolList)
				// 曲线点类型："circle", "square", "diamond",
				// "triangle","triangle-down"，默认是"circle"
			},
			data : dataList[k],
			yAxis : yAxisList[k]
		});
		if (select_names == 1) {
			j = 0;
		} else {
			if (j < ctList.length - 1) {
				++j;
			} else {
				j = 0;
			}
		}
	}

	$('#' + chartid).highcharts({
		chart : {
			backgroundColor : (bgcolor == '' ? "#FFFFFF" : bgcolor),// 背景色：整个表
			marginTop : 28
		},
		title : {
			text : '<span style="font-size:14px;">' + centertitle + '</span>'
		},
		xAxis : {
			gridLineDashStyle : (gridLineDashStyle == ''
					? 'LongDash'
					: gridLineDashStyle),// 网格线样式
			gridLineWidth : parseInt(showXGridLine), // 设置网络线线宽
			labels : {
				step : parseInt(step)
			},
			tickmarkPlacement : 'between',// X轴上标签的位置
			categories : cataList
		},
		credits : {
			enabled : false
		},
		yAxis : [{
			lineWidth : 1,
			gridLineDashStyle : (gridLineDashStyle == ''
					? 'LongDash'
					: gridLineDashStyle),// 网格线样式
			gridLineWidth : parseInt(showYGridLine),// 设置网络线线宽
			title : {
				text : '<span style="color:#7F7F7F;font-size:12px;">'
						+ yLeftTitle + '</span>'
			},
			labels : yLabledFormt[0]
		}, {
			lineWidth : 1,
			gridLineWidth : 0,// 设置网络线线宽
			opposite : true,
			title : {
				text : '<span style="color:#7F7F7F;font-size:12px;">'
						+ yRightTitle + '</span>',
				rotation : 270
			},
			labels : yLabledFormt[1]
		}],

		legend : {
			enabled : showLegend
		},
		tooltip : {
			crosshairs : true,
			shared : true
		},
		series : seriesList
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
// labelDistance表示图表中文字标签与饼图之间的间距
// connectionLine表示饼图中连接线的宽度
function autoRenderToPieChartsAndLegend(chartid, charttype, bgcolor,
		categories, colorsArr, datas, legendLayout, legendAlign, wordColor,
		labelDistance, connectionLine, centerTitle) {
	var cates = categories, cArr = colorsArr, data = datas;
	var dataArrayList = [];

	try {

		// 循环添加数据
		for (var i = 0; i < datas.length; i++) {
			dataArrayList.push({
						name : cates[i],
						y : data[i],
						color : cArr[i]
					});
		}
	} catch (e) {
	}

	$('#' + chartid).highcharts({
		chart : {
			plotShadow : false,
			backgroundColor : (bgcolor == '' ? "#FFFFFF" : bgcolor)
			// 背景色：整个表
		},
		title : {
			text : centerTitle
		},
		credits : {
			enabled : false
		},
		tooltip : {
			pointFormat : '<b>{point.y}%</b>'
		},
		plotOptions : {
			pie : {
				size : '90%',
				innerSize : '50%',
				allowPointSelect : true,
				cursor : 'pointer',
				showInLegend : true,
				borderWidth : 0,// 饼图边框
				dataLabels : {
					connectorWidth : (connectionLine == ""
							? 1
							: parseInt(connectionLine))
					// 设置连线是否隐藏
				}
			}
		},
		legend : {
			layout : (legendLayout == '' ? 'vertical' : legendLayout),
			align : (legendAlign == '' ? 'right' : legendAlign),
			verticalAlign : 'middle',
			width : 100,
			itemStyle : {
//				fontSize : '14px',
				color : '#A4AAC0'
			},
			itemMarginTop : 5,
			itemMarginBottom : 5,
			borderWidth : 0
		},
		series : [{
					type : charttype,
					data : dataArrayList,
					dataLabels : {
						formatter : function() {
							return this.y + "%";
						},
						color : (wordColor == '' ? '#1536E0' : wordColor), // 图表中的字体颜色
						distance : (labelDistance == ''
								? 15
								: parseInt(labelDistance))
						// 图表中显示到文字对应在图表中的位置
					}
				}]
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
// yStep表示Y轴刻度标记的间隔
// cataList表示X轴显示列表
function autoRenderToTwoChart(chartid, charttype, xStep, chartTitle,
		gridLineDashStyle, lineWidth, yLeftTitle, yRightTitle, showLegend,
		showXGridLine, showYGridLine, chartLegendList, chartColorList,
		chartDataList, chartFillColorList, chartRadiusList, chartSymbolList,
		chartYAxisList, yStep, cataList) {
	var seriesList = []; // 定义一个数组存放数据
	var ySteps = [];
	if (yStep == undefined) {
		ySteps[0] = '';
		ySteps[1] = '';
	} else {
		ySteps = yStep.split(",");
	}

	var legendList = chartLegendList, colorList = chartColorList, dataList = chartDataList, symbolList = chartSymbolList, yAxisList = chartYAxisList, fillColorList = chartFillColorList, radiusList = chartRadiusList;
	for (var k = 0; k < dataList.length; k++) {
		seriesList.push({
					name : legendList[k],
					color : colorList[k],
					marker : {
						lineWidth : parseInt(lineWidth),
						lineColor : colorList[k],
						fillColor : fillColorList[k],
						radius : radiusList[k], // 曲线点半径，默认是4
						symbol : (symbolList[k] == ''
								? 'circle'
								: symbolList[k])
						// 曲线点类型："circle", "square", "diamond",
						// "triangle","triangle-down"，默认是"circle"
					},
					data : dataList[k],
					yAxis : yAxisList[k]
				});
	}

	$('#' + chartid).highcharts({
		chart : {
			type : charttype,
			marginTop : 20
		},
		title : {
			text : '<span style="font-size:14px;">' + chartTitle + '</span>'
		},
		credits : {
			enabled : false
		},
		xAxis : {
			labels : {
				step : xStep
				// 4就是x轴显示的间隔
			},
			categories : cataList,
			gridLineDashStyle : (gridLineDashStyle == ''
					? 'LongDash'
					: gridLineDashStyle),// 网格线样式
			gridLineWidth : parseInt(showXGridLine)
			// 设置网络线线宽
		},
		yAxis : [{
			lineWidth : 1,
			tickInterval : (ySteps[0] == '' ? null : parseInt(ySteps[0])),
			gridLineDashStyle : (gridLineDashStyle == ''
					? 'LongDash'
					: gridLineDashStyle),// 网格线样式
			gridLineWidth : parseInt(showYGridLine), // 设置网络线线宽
			title : {
				text : '<span style="color:#7F7F7F;font-size:12px;">'
						+ yLeftTitle + '</span>'
			}
		}, {
			lineWidth : 1,
			tickInterval : (ySteps.length < 2 ? null : parseInt(ySteps[1])),
			gridLineWidth : 0,// 设置网络线线宽
			opposite : true,
			title : {
				text : '<span style="color:#7F7F7F;font-size:12px;">'
						+ yRightTitle + '</span>',
				rotation : 270
			}
		}],
		legend : {
			enabled : showLegend
		},
		tooltip : {
			crosshairs : true,
			shared : true
		},
		series : seriesList
	});
}

// 渲染堆叠图
// chartId渲染id
// chartType图表类型
// bgcolor图表背景颜色
// chartTitle图表标题
// titleColor图表标题颜色
// titleAlign图表标题水平对齐方式
// unit提示框中的后缀
// gridLineDashStyle网格线风格
// showLegend是否显示图例说明
// showXGridLine是否显示X轴上网格线
// showYGridLine是否显示Y轴上网络线
// chartColorList图表数据列颜色列表
function autoRenderToStackChart(chartId, chartType, bgcolor, chartTitle,
		titleColor, titleAlign, unit, gridLineDashStyle, showLegend,
		showXGridLine, showYGridLine, chartColorList, catalist, datalist1,
		datalist2) {
	$('#' + chartId).highcharts({
		chart : {// 基本表
			type : chartType,// 图表样式
			backgroundColor : (bgcolor == '' ? "#394264" : bgcolor)
			// 背景色：整个表
		},
		credits : {// 版权及超链接
			enabled : false
		},
		exporting : {// 导出表
			enabled : false
		},
		title : {// 表标题
			text : chartTitle,
			align : (titleAlign == '' ? "left" : titleAlign),// 标题位置
			style : {// 标题字体设置
				color : (titleColor == '' ? "#FFFFFF" : titleColor),
				fontFamily : "微软雅黑",
				fontSize : '22px'
			},
			margin : 30,
			x : 10,
			y : 30
		},
		xAxis : {
			categories : catalist,// x轴坐标在tooltip中的显示
			lineColor : '#616883',// x轴线颜色
			gridLineDashStyle : (gridLineDashStyle == ''
					? 'solid'
					: gridLineDashStyle),// 网格线样式
			gridLineWidth : parseInt(showXGridLine), // 设置网络线线宽
			tickWidth : 0,
			labels : {
				style : {
					color : '8187A2'
				}
			}
		},
		yAxis : {
			title : {// y轴标题
				enabled : false
			},
			labels : {
				style : {
					color : '#9CA1B2'
				}
			},
			gridLineDashStyle : (gridLineDashStyle == ''
					? 'solid'
					: gridLineDashStyle),// 网格线样式
			gridLineWidth : parseInt(showYGridLine), // 设置网络线线宽
			lineWidth : (parseInt(showXGridLine)),// 根据X轴上网络线的显示情况，来确定是否显示Y轴线
			gridLineColor : '#616883' // 网格横线颜色
		},
		tooltip : {
			shared : true,
			valueSuffix : (unit == '' ? 'kW' : unit)
		},
		legend : {
			enabled : showLegend,
			borderWidth : 0,
			itemStyle : {
				color : '#8187A2'
			}
		},
		colors : (chartColorList.length == 0 || chartColorList == '' ? [
				'#11A8AB', '#5CECEF'] : chartColorList),// 柱色
		plotOptions : {
			column : {
				stacking : 'normal',// 设置可以让柱形图相叠
				shadow : false
				// 去阴影
			},
			series : {
				pointWidth : 25,
				borderColor : '#00AF52'
			}
		},

		series : [{
					name : '开启台数',// 数据名：显示在tooltip第一行
					data : datalist1
//				}, {
//					name : '总开启功率',// 数据名：显示在tooltip第一行
//					data : datalist2
				}]
	});
};

// 渲染报表图形带图例
// chartid表示要渲染的id
// charttype表示要渲染的图形
// bgcolor图表背景颜色
// chartTitle图表标题
// titleColor图表标题颜色
// categories表示要显示的图例列表
// colorsArr表示要要显示的图例颜色列表
// datas表示要显示的数据列表
// showLegend是否显示图例说明
// legendLayout表示图例的布局是水平horizontal和垂直vertical
// legendAlign表示图例的对齐方式（left/center/right）
// labelDistance表示图表中文字标签与饼图之间的间距
// connectionLine表示饼图中连接线的宽度
// wordColor表示显示在图表中的文字的颜色

function autoRenderToPieCharts(chartid, charttype, bgcolor, chartTitle,
		titleColor, categories, colorsArr, datas, showLegend, legendLayout,
		legendAlign, labelDistance, connectionLineWidth, wordColor) {
	var cates = categories, cArr = colorsArr, data = datas;
	var dataArrayList = [];
	try {

		// 循环添加数据
		for (var i = 0; i < datas.length; i++) {
			dataArrayList.push({
						name : cates[i],
						y : data[i],
						color : cArr[i]
					});
		}
	} catch (e) {
	}

	$('#' + chartid).highcharts({
		chart : {// 基本表
			type : charttype,// 格式：线形，柱形，饼形等
			backgroundColor : (bgcolor == '' ? "#394264" : bgcolor)
			// 背景色：整个表
		},
		title : {// 表标题
			text : chartTitle,
			align : "left",// 标题位置
			style : {// 标题字体设置
				color : (titleColor == '' ? "#FFFFFF" : titleColor),
				fontFamily : "微软雅黑",
				fontSize : '22px'
			},
			margin : 20,
			x : 10,
			y : 30
		},
		credits : {
			enabled : false
		},
		tooltip : {
			pointFormat : '<b>{point.y}%</b>'
		},
		plotOptions : {
			pie : {
				size : '90%',
				innerSize : '50%',
				allowPointSelect : true,
				cursor : 'pointer',
				showInLegend : true,
				borderWidth : 0,
				dataLabels : {
					connectorWidth : (connectionLineWidth == ''
							? 1
							: connectionLineWidth),// 设置连线是否隐藏
					connectorPadding : 0
					// 数据标签与数据标签连接线之间的距离
				}
			}
		},
		legend : {
			enabled : showLegend,
			margin : 0,// 与绘图区之间的间距
			layout : (legendLayout == '' ? 'vertical' : legendLayout),
			align : (legendAlign == '' ? 'right' : legendAlign),
			verticalAlign : 'middle',
			itemStyle : {
				fontSize : '8px',
				color : '#A4AAC0'
			},
			symbolWidth : 5, // 图例图示的宽度
			itemMarginTop : 10,
			borderWidth : 0,
			y : 20
		},
		series : [{
					type : charttype,
					data : dataArrayList,
					dataLabels : {
						formatter : function() {
							return this.y + "%";
						},
						color : (wordColor == '' ? 'white' : wordColor), // 图表中的字体颜色
						distance : (labelDistance == '' ? 10 : labelDistance)
						// 图表中显示到文字对应在图表中的位置
					}
				}]
	});
}

// 渲染报表图形带图例
// chartid表示要渲染的id
// charttype表示要渲染的图形
// bgcolor图表背景颜色
// chartTitle图表标题
// innerSize图表内环大小
// categories表示要显示的图例列表
// colorsArr表示要要显示的图例颜色列表
// datas表示要显示的数据列表
// showLegend是否显示图例说明
// legendWidth表示图例说明区域的宽度
// legendLayout表示图例的布局是水平horizontal和垂直vertical
// legendAlign表示图例的对齐方式（left/center/right）
// labelDistance表示图表中文字标签与饼图之间的间距
// connectionLine表示饼图中连接线的宽度
// wordColor表示显示在图表中的文字的颜色

function autoRenderToPieChart(chartid, charttype, bgcolor, chartTitle,
		innerSize, categories, colorsArr, datas, showLegend, legendWidth,
		legendLayout, legendAlign, labelDistance, connectLineWidth, wordColor) {
	var cates = categories, cArr = colorsArr, data = datas;
	var dataArrayList = [];
	try {

		// 循环添加数据
		for (var i = 0; i < datas.length; i++) {
			dataArrayList.push({
						name : cates[i],
						y : data[i],
						color : cArr[i]
					});
		}
	} catch (e) {
	}

	$('#' + chartid).highcharts({
		chart : {// 基本表
			type : charttype,// 格式：线形，柱形，饼形等
			backgroundColor : (bgcolor == '' ? "#FFFFFF" : bgcolor),// 背景色：整个表
			marginLeft : -80,
			marginRight : 0,
			marginBottom : 30
		},
		title : {// 表标题
			text : '<span style="font-size:14px;">' + chartTitle + '</span>'
		},
		credits : {
			enabled : false
		},
		tooltip : {
			pointFormat : '<b>{point.y}%</b>'
		},
		plotOptions : {
			pie : {
				size : '100%',
				innerSize : (innerSize == '%' ? '60%' : innerSize),
				allowPointSelect : true,
				cursor : 'pointer',
				showInLegend : true,
				borderWidth : 0,
				dataLabels : {
					connectorWidth : (connectLineWidth == ""
							? 1
							: parseInt(connectLineWidth)),// 设置连线宽度，默认为2
					connectorPadding : 0
					// 数据标签与数据标签连接线之间的距离
				}
			}
		},
		legend : {
			enabled : showLegend,
			margin : 0,// 与绘图区之间的间距
			layout : (legendLayout == '' ? 'vertical' : legendLayout),
			align : (legendAlign == '' ? 'right' : legendAlign),
			verticalAlign : 'middle',
			itemStyle : {
				fontSize : '8px',
				color : '#A4AAC0'
			},
			symbolWidth : 5, // 图例图示的宽度
			itemMarginTop : 5,
			itemMarginBottom : 5,
			borderWidth : 0,
			width : (legendWidth == '' ? 80 : legendWidth)
		},
		series : [{
					type : charttype,
					data : dataArrayList,
					dataLabels : {
						formatter : function() {
							return this.y + "%";
						},
						color : (wordColor == '' ? 'white' : wordColor), // 图表中的字体颜色
						distance : (labelDistance == ''
								? 10
								: parseInt(labelDistance))
						// 图表中显示到文字对应在图表中的位置
					}
				}]
	});
}

/*
 * 生成双y轴图表，可配x、y轴标签颜色，网格线颜色、y轴轴线宽度等信息
 */
function autoRenderToMixCharts(chartid, charttype, bgcolor, select_names, step,
		centertitle, gridLineDashStyle, gridLineColor, chartSymbolList,
		symbolWidth, lineWidth, connectLineWidth, yLeftTitle, yRightTitle,
		leftTitleColor, rightTitleColor, showLegend, showXGridLine,
		showYGridLine, xColor, yColor, yWidth, xLabelColor, yLabelColor,
		chartLegendList, legendColor, chartColorList, chartDataList,
		chartFillColorList, chartRadiusList, ySymbol, chartYAxisList, cataList) {
	var seriesList = []; // 定义一个数组存放数据
	var LySymbol = "";// 左侧Y轴单位
	var RySymbol = "";// 右侧Y轴单位
	var ctList = charttype.split(",");// 存储图表类别列表
	var legendList = chartLegendList;// 数据列名称列表
	var colorList = chartColorList;// 颜色列表
	var dataList = chartDataList;// 数据信息
	var fillColorList = chartFillColorList;// 填充颜色列表
	var symbolList = chartSymbolList;// 曲线点类型
	var radiusList = chartRadiusList;// 曲线点半径列表
	var yAxisList = chartYAxisList;// Y轴数据列表
	var yLabledFormt = []; // 格式化y轴上的标签

	var j = 0;// 计数
	if (ySymbol != "" && ySymbol.split(",").length > 0) {
		var ySymbolList = ySymbol.split(",");// 读取Y轴单位信息
		LySymbol = ySymbolList[0];
		RySymbol = ySymbolList[1];
	}
	// 保存y轴标签格式化信息
	if (LySymbol != "") {
		yLabledFormt.push({
					formatter : function() {
						return this.value + LySymbol; // Y轴数值后带的符号
					},
					style : {
						color : (yLabelColor == '' ? '#FFFFFF' : yLabelColor)
						// Y轴标签字体颜色
					}
				});
	} else {
		yLabledFormt.push({
					style : {
						color : (yLabelColor == '' ? '#FFFFFF' : yLabelColor)
						// Y轴标签字体颜色
					}
				});
	}

	// 保存y轴标签格式化信息
	if (RySymbol != "") {
		yLabledFormt.push({
					formatter : function() {
						return this.value + RySymbol; // Y轴数值后带的符号
					},
					style : {
						color : (yLabelColor == '' ? '#FFFFFF' : yLabelColor)
						// Y轴标签字体颜色
					}
				});
	} else {
		yLabledFormt.push({
					style : {
						color : (yLabelColor == '' ? '#FFFFFF' : yLabelColor)
						// Y轴标签字体颜色
					}
				});
	}

	for (var k = 0; k < dataList.length; k++) {
		seriesList.push({
			type : ctList[j],
			lineWidth : connectLineWidth == "" ? 2 : parseInt(connectLineWidth),// 连接线线宽，为空则默认为2，为0则不显示连接线
			name : legendList[k],
			color : colorList[k],
			marker : {
				lineWidth : parseInt(lineWidth),
				lineColor : colorList[k],
				fillColor : fillColorList[k],
				radius : (radiusList[k] == '' ? 0 : parseInt(radiusList[k])), // 曲线点半径，默认是0
				symbol : (symbolList == '' ? 'circle' : symbolList)
				// 曲线点类型："circle", "square", "diamond",
				// "triangle","triangle-down"，默认是"circle"
			},
			data : dataList[k],
			yAxis : yAxisList[k]
		});
		if (select_names == 1) {
			j = 0;
		} else {
			if (j < ctList.length - 1) {
				++j;
			} else {
				j = 0;
			}
		}
	}

	$('#' + chartid).highcharts({
		chart : {
			backgroundColor : (bgcolor == '' ? "#FFFFFF" : bgcolor),// 背景色：整个表
			spacingRight : 0,
			spacingLeft : 0
		},
		title : {
			text : '<span style="font-size:14px;color:#FFFFFF">' + centertitle
					+ '</span>'
		},
		xAxis : {
			lineColor : (yColor == '' ? '#7E838A' : yColor), // Y轴轴线颜色
			gridLineDashStyle : (gridLineDashStyle == ''
					? 'line'
					: gridLineDashStyle),// 网格线样式
			gridLineColor : (gridLineColor == '' ? '#7E838A' : gridLineColor),// 网格线颜色
			gridLineWidth : parseInt(showXGridLine), // 设置网络线线宽
			labels : {
				step : parseInt(step),
				style : {
					color : (xLabelColor == '' ? '#FFFFFF' : xLabelColor)
					// X轴标签字体颜色
				}
			},
			tickmarkPlacement : 'between',// X轴上标签的位置
			categories : cataList
		},
		credits : {
			enabled : false
		},
		yAxis : [{
			lineWidth : (yWidth[0] == '' ? 1 : yWidth[0]), // Y轴轴线宽度
			lineColor : (yColor == '' ? '#7E838A' : yColor), // Y轴轴线颜色
			gridLineDashStyle : (gridLineDashStyle == ''
					? 'line'
					: gridLineDashStyle),// 网格线样式
			gridLineColor : (gridLineColor == '' ? '#7E838A' : gridLineColor),// 网格线颜色
			gridLineWidth : parseInt(showYGridLine),// 设置网络线线宽
			title : {
				text : '<span style="color:'
						+ (leftTitleColor == '' ? '#FFFFFF' : leftTitleColor)
						+ ';font-size:12px;">' + yLeftTitle + '</span>'
			},
			labels : yLabledFormt[0]
		}, {
			lineWidth : (yWidth[1] == '' ? 1 : yWidth[0]), // Y轴轴线宽度
			lineColor : (yColor == '' ? '#7E838A' : yColor), // Y轴轴线颜色
			gridLineWidth : 0,// 设置网络线线宽
			opposite : true,
			title : {
				text : '<span style="color:'
						+ (rightTitleColor == '' ? '#FFFFFF' : rightTitleColor)
						+ ';font-size:12px;">' + yRightTitle + '</span>',
				rotation : 270
			},
			labels : yLabledFormt[1]
		}],
		plotOptions : {
			series : {
				borderWidth : 0
				// 数据列边框宽度
			}
		},
		legend : {
			enabled : showLegend,
			symbolWidth : (symbolWidth == '' ? 5 : symbolWidth), // 图例图示的宽度
			margin : 0, // 图例说明区域与绘图区域之间的间隔
			borderWidth : 0, // 图例说明边框宽度
			itemStyle : {
				color : (legendColor == '' ? '#FFFFFF' : legendColor)
				// 图例说明字体颜色
			}
		},
		tooltip : {
			crosshairs : true,
			shared : true
		},
		series : seriesList
	});
}