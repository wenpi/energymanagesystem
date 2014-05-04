package com.managementsystem.energy.portlet.preferenceinfo;

/**
 * 首选项信息
 * */
public class DoubleChartsPreferenceInfo implements java.io.Serializable {
	private static final long serialVersionUID = 3786256156035845185L;
	
	private String hours = "0"; // 默认为0，放首选项中为了方便配置程序是否需要增加八小时
	/**
	 * 图表视图选择的id、name、ispd
	 */
	private String chart_name1;
	private String chart_name2;
	private String chart_name3;
	private String chart_name4;
	private String chart_name5;
	private String chart_name6;
	private String chart_name7;
	private String chart_name8;
	private String chart_name9;
	
	private String chart_id1;
	private String chart_id2;
	private String chart_id3;
	private String chart_id4;
	private String chart_id5;
	private String chart_id6;
	private String chart_id7;
	private String chart_id8;
	private String chart_id9;
	
	private String chart_ispd1;
	private String chart_ispd2;
	private String chart_ispd3;
	private String chart_ispd4;
	private String chart_ispd5;
	private String chart_ispd6;
	private String chart_ispd7;
	private String chart_ispd8;
	private String chart_ispd9;

	/**
	 * 模块显示标题
	 */
	private String formTitle;
	/**
	 * 视图选择（图形视图、表格视图）
	 */
	private String chooseView;
	/**
	 * 图表说明标题及描述
	 */
	private String title1;
	private String title2;
	private String title3;
	private String title4;
	private String title5;
	private String title6;
	private String title7;
	
	private String description1;
	private String description2;
	private String description3;
	private String description4;
	private String description5;
	private String description6;
	private String description7;
	/**
	 * 图例说明区域宽度
	 */
	private String legendWidth;
	/**
	 * 图表说明区域背景
	 */
	private String bgColor;
	/**
	 * 默认时间
	 */
	private String defaultTime;
	/**
	 * 图表标题
	 */
	private String chartTitle1;
	private String chartTitle2;
	private String chartTitle3;
	private String chartTitle4;
	private String chartTitle5;
	private String chartTitle6;
	private String chartTitle7;
	private String chartTitle8;
	private String chartTitle9;
	/**
	 *图表绘图区域背景颜色 
	 */
	private String c_bgColor;
	/**
	 * 连接线宽度
	 */
	private String connLineWidth;
	/**
	 * 图例列表
	 */
	private String chartLegends1;
	private String chartLegends2;
	private String chartLegends3;
	private String chartLegends4;
	private String chartLegends5;
	private String chartLegends6;
	private String chartLegends7;
	private String chartLegends8;
	private String chartLegends9;
	/**
	 * 数据列颜色列表
	 */
	private String chartColors1;
	private String chartColors2;
	private String chartColors3;
	private String chartColors4;
	private String chartColors5;
	private String chartColors6;
	private String chartColors7;
	private String chartColors8;
	private String chartColors9;
	/**
	 * 是否显示图例说明
	 */	
	private String showLegend;
	/**
	 * 保留小数位数
	 */
	private String decimals;
	/**
	 * X轴显示间隔
	 */
	private String xStep;
	/**
	 *网格线样式
	 */
	private String gridLineStyle;
	/**
	 * 图表类型
	 */
	private String chartType1;
	private String chartType2;
	private String chartType3;
	/**
	 * 是否显示X轴网格线
	 */
	private String showXGridLine;
	/**
	 * 是否显示Y轴网格线
	 */
	private String showYGridLine;
	/**
	 * Y轴标题
	 */
	private String yLeftTitle1;
	private String yLeftTitle2;
	private String yLeftTitle3;
	private String yLeftTitle4;
	private String yLeftTitle5;
	private String yLeftTitle6;
	private String yLeftTitle7;
	
	private String yRightTitle1;
	private String yRightTitle2;
	private String yRightTitle3;
	private String yRightTitle4;
	private String yRightTitle5;
	private String yRightTitle6;
	private String yRightTitle7;
	/**
	 * Y轴单位
	 */
	private String ySymbol1;
	private String ySymbol2;
	private String ySymbol3;
	private String ySymbol4;
	private String ySymbol5;
	private String ySymbol6;
	private String ySymbol7;
	/**
	 * 曲线点半径列表
	 */
	private String radiusList;
	/**
	 * 曲线点样式
	 */
	private String symbol1;
	private String symbol2;
	private String symbol3;
	private String symbol4;
	private String symbol5;
	private String symbol6;
	private String symbol7;
	/**
	 * Y轴数据列表
	 */
	private String yAxisList;
	/**
	 * 数据点填充颜色列表
	 */
	private String c_fillColors;
	/**
	 * 线宽
	 */
	private String lineWidth;
	/**
	 * 乘数
	 */
	private String form_mul;
	/**
	 * 图例展示方式
	 */
	private String legendLayout1;
	private String legendLayout2;
	private String legendLayout3;
	private String legendLayout4;
	/**
	 * 图例对齐方式
	 */
	private String legendAlign1;
	private String legendAlign2;
	private String legendAlign3;
	private String legendAlign4;
	/**
	 * 数据标签字体颜色
	 */
	private String wordColor;
	/**
	 * 数据标签与饼图之间的闹中间隔
	 */
	private String distance;
	/**
	 * 饼图内环大小
	 */
	private String innerSize1;
	private String innerSize2;
	private String innerSize3;
	private String innerSize4;
	private String innerSize5;
	private String innerSize6;
	private String innerSize7;
	/**
	 *饼图输出项 
	 */
	private String itemName1;
	private String itemName2;
	private String itemName3;
	private String itemName4;
	private String itemName5;
	private String itemName6;
	private String itemName7;
	/**
	 * 导出excel列头名称
	 */
	private String expColumnName1;
	private String expColumnName2;
	private String expColumnName3;
	private String expColumnName4;
	private String expColumnName5;
	private String expColumnName6;
	private String expColumnName7;
	/**
	 * 网格视图name,id,ispd信息
	 */
	private String form_name1;
	private String form_name2;
	private String form_name3;
	private String form_name4;
	private String form_name5;
	private String form_name6;
	private String form_name7;
	
	private String form_id1;
	private String form_id2;
	private String form_id3;
	private String form_id4;
	private String form_id5;
	private String form_id6;
	private String form_id7;
	
	private String form_ispd1;
	private String form_ispd2;
	private String form_ispd3;
	private String form_ispd4;
	private String form_ispd5;
	private String form_ispd6;
	private String form_ispd7;
	/**
	 * 网格视图day类型特有列
	 */
	private String dayColumn;
	/**
	 * 网格视图是否显示建筑
	 */
	private String showLegendForm;
	/**
	 * 网格视图公用列信息
	 */
	private String commonColumn1;
	private String commonColumn2;
	private String commonColumn3;
	private String commonColumn4;
	private String commonColumn5;
	private String commonColumn6;
	private String commonColumn7;
	public String getHours() {
		return hours;
	}
	public void setHours(String hours) {
		this.hours = hours;
	}
	public String getChart_name1() {
		return chart_name1;
	}
	public void setChart_name1(String chart_name1) {
		this.chart_name1 = chart_name1;
	}
	public String getChart_name2() {
		return chart_name2;
	}
	public void setChart_name2(String chart_name2) {
		this.chart_name2 = chart_name2;
	}
	public String getChart_name3() {
		return chart_name3;
	}
	public void setChart_name3(String chart_name3) {
		this.chart_name3 = chart_name3;
	}
	public String getChart_name4() {
		return chart_name4;
	}
	public void setChart_name4(String chart_name4) {
		this.chart_name4 = chart_name4;
	}
	public String getChart_name5() {
		return chart_name5;
	}
	public void setChart_name5(String chart_name5) {
		this.chart_name5 = chart_name5;
	}
	public String getChart_name6() {
		return chart_name6;
	}
	public void setChart_name6(String chart_name6) {
		this.chart_name6 = chart_name6;
	}
	public String getChart_name7() {
		return chart_name7;
	}
	public void setChart_name7(String chart_name7) {
		this.chart_name7 = chart_name7;
	}
	public String getChart_name8() {
		return chart_name8;
	}
	public void setChart_name8(String chart_name8) {
		this.chart_name8 = chart_name8;
	}
	public String getChart_name9() {
		return chart_name9;
	}
	public void setChart_name9(String chart_name9) {
		this.chart_name9 = chart_name9;
	}
	public String getChart_id1() {
		return chart_id1;
	}
	public void setChart_id1(String chart_id1) {
		this.chart_id1 = chart_id1;
	}
	public String getChart_id2() {
		return chart_id2;
	}
	public void setChart_id2(String chart_id2) {
		this.chart_id2 = chart_id2;
	}
	public String getChart_id3() {
		return chart_id3;
	}
	public void setChart_id3(String chart_id3) {
		this.chart_id3 = chart_id3;
	}
	public String getChart_id4() {
		return chart_id4;
	}
	public void setChart_id4(String chart_id4) {
		this.chart_id4 = chart_id4;
	}
	public String getChart_id5() {
		return chart_id5;
	}
	public void setChart_id5(String chart_id5) {
		this.chart_id5 = chart_id5;
	}
	public String getChart_id6() {
		return chart_id6;
	}
	public void setChart_id6(String chart_id6) {
		this.chart_id6 = chart_id6;
	}
	public String getChart_id7() {
		return chart_id7;
	}
	public void setChart_id7(String chart_id7) {
		this.chart_id7 = chart_id7;
	}
	public String getChart_id8() {
		return chart_id8;
	}
	public void setChart_id8(String chart_id8) {
		this.chart_id8 = chart_id8;
	}
	public String getChart_id9() {
		return chart_id9;
	}
	public void setChart_id9(String chart_id9) {
		this.chart_id9 = chart_id9;
	}
	public String getChart_ispd1() {
		return chart_ispd1;
	}
	public void setChart_ispd1(String chart_ispd1) {
		this.chart_ispd1 = chart_ispd1;
	}
	public String getChart_ispd2() {
		return chart_ispd2;
	}
	public void setChart_ispd2(String chart_ispd2) {
		this.chart_ispd2 = chart_ispd2;
	}
	public String getChart_ispd3() {
		return chart_ispd3;
	}
	public void setChart_ispd3(String chart_ispd3) {
		this.chart_ispd3 = chart_ispd3;
	}
	public String getChart_ispd4() {
		return chart_ispd4;
	}
	public void setChart_ispd4(String chart_ispd4) {
		this.chart_ispd4 = chart_ispd4;
	}
	public String getChart_ispd5() {
		return chart_ispd5;
	}
	public void setChart_ispd5(String chart_ispd5) {
		this.chart_ispd5 = chart_ispd5;
	}
	public String getChart_ispd6() {
		return chart_ispd6;
	}
	public void setChart_ispd6(String chart_ispd6) {
		this.chart_ispd6 = chart_ispd6;
	}
	public String getChart_ispd7() {
		return chart_ispd7;
	}
	public void setChart_ispd7(String chart_ispd7) {
		this.chart_ispd7 = chart_ispd7;
	}
	public String getChart_ispd8() {
		return chart_ispd8;
	}
	public void setChart_ispd8(String chart_ispd8) {
		this.chart_ispd8 = chart_ispd8;
	}
	public String getChart_ispd9() {
		return chart_ispd9;
	}
	public void setChart_ispd9(String chart_ispd9) {
		this.chart_ispd9 = chart_ispd9;
	}
	public String getFormTitle() {
		return formTitle;
	}
	public void setFormTitle(String formTitle) {
		this.formTitle = formTitle;
	}
	public String getChooseView() {
		return chooseView;
	}
	public void setChooseView(String chooseView) {
		this.chooseView = chooseView;
	}
	public String getTitle1() {
		return title1;
	}
	public void setTitle1(String title1) {
		this.title1 = title1;
	}
	public String getTitle2() {
		return title2;
	}
	public void setTitle2(String title2) {
		this.title2 = title2;
	}
	public String getTitle3() {
		return title3;
	}
	public void setTitle3(String title3) {
		this.title3 = title3;
	}
	public String getTitle4() {
		return title4;
	}
	public void setTitle4(String title4) {
		this.title4 = title4;
	}
	public String getTitle5() {
		return title5;
	}
	public void setTitle5(String title5) {
		this.title5 = title5;
	}
	public String getTitle6() {
		return title6;
	}
	public void setTitle6(String title6) {
		this.title6 = title6;
	}
	public String getTitle7() {
		return title7;
	}
	public void setTitle7(String title7) {
		this.title7 = title7;
	}
	public String getDescription1() {
		return description1;
	}
	public void setDescription1(String description1) {
		this.description1 = description1;
	}
	public String getDescription2() {
		return description2;
	}
	public void setDescription2(String description2) {
		this.description2 = description2;
	}
	public String getDescription3() {
		return description3;
	}
	public void setDescription3(String description3) {
		this.description3 = description3;
	}
	public String getDescription4() {
		return description4;
	}
	public void setDescription4(String description4) {
		this.description4 = description4;
	}
	public String getDescription5() {
		return description5;
	}
	public void setDescription5(String description5) {
		this.description5 = description5;
	}
	public String getDescription6() {
		return description6;
	}
	public void setDescription6(String description6) {
		this.description6 = description6;
	}
	public String getDescription7() {
		return description7;
	}
	public void setDescription7(String description7) {
		this.description7 = description7;
	}
	public String getLegendWidth() {
		return legendWidth;
	}
	public void setLegendWidth(String legendWidth) {
		this.legendWidth = legendWidth;
	}
	public String getBgColor() {
		return bgColor;
	}
	public void setBgColor(String bgColor) {
		this.bgColor = bgColor;
	}
	public String getDefaultTime() {
		return defaultTime;
	}
	public void setDefaultTime(String defaultTime) {
		this.defaultTime = defaultTime;
	}
	public String getChartTitle1() {
		return chartTitle1;
	}
	public void setChartTitle1(String chartTitle1) {
		this.chartTitle1 = chartTitle1;
	}
	public String getChartTitle2() {
		return chartTitle2;
	}
	public void setChartTitle2(String chartTitle2) {
		this.chartTitle2 = chartTitle2;
	}
	public String getChartTitle3() {
		return chartTitle3;
	}
	public void setChartTitle3(String chartTitle3) {
		this.chartTitle3 = chartTitle3;
	}
	public String getChartTitle4() {
		return chartTitle4;
	}
	public void setChartTitle4(String chartTitle4) {
		this.chartTitle4 = chartTitle4;
	}
	public String getChartTitle5() {
		return chartTitle5;
	}
	public void setChartTitle5(String chartTitle5) {
		this.chartTitle5 = chartTitle5;
	}
	public String getChartTitle6() {
		return chartTitle6;
	}
	public void setChartTitle6(String chartTitle6) {
		this.chartTitle6 = chartTitle6;
	}
	public String getChartTitle7() {
		return chartTitle7;
	}
	public void setChartTitle7(String chartTitle7) {
		this.chartTitle7 = chartTitle7;
	}
	public String getChartTitle8() {
		return chartTitle8;
	}
	public void setChartTitle8(String chartTitle8) {
		this.chartTitle8 = chartTitle8;
	}
	public String getChartTitle9() {
		return chartTitle9;
	}
	public void setChartTitle9(String chartTitle9) {
		this.chartTitle9 = chartTitle9;
	}
	public String getC_bgColor() {
		return c_bgColor;
	}
	public void setC_bgColor(String c_bgColor) {
		this.c_bgColor = c_bgColor;
	}
	public String getConnLineWidth() {
		return connLineWidth;
	}
	public void setConnLineWidth(String connLineWidth) {
		this.connLineWidth = connLineWidth;
	}
	public String getChartLegends1() {
		return chartLegends1;
	}
	public void setChartLegends1(String chartLegends1) {
		this.chartLegends1 = chartLegends1;
	}
	public String getChartLegends2() {
		return chartLegends2;
	}
	public void setChartLegends2(String chartLegends2) {
		this.chartLegends2 = chartLegends2;
	}
	public String getChartLegends3() {
		return chartLegends3;
	}
	public void setChartLegends3(String chartLegends3) {
		this.chartLegends3 = chartLegends3;
	}
	public String getChartLegends4() {
		return chartLegends4;
	}
	public void setChartLegends4(String chartLegends4) {
		this.chartLegends4 = chartLegends4;
	}
	public String getChartLegends5() {
		return chartLegends5;
	}
	public void setChartLegends5(String chartLegends5) {
		this.chartLegends5 = chartLegends5;
	}
	public String getChartLegends6() {
		return chartLegends6;
	}
	public void setChartLegends6(String chartLegends6) {
		this.chartLegends6 = chartLegends6;
	}
	public String getChartLegends7() {
		return chartLegends7;
	}
	public void setChartLegends7(String chartLegends7) {
		this.chartLegends7 = chartLegends7;
	}
	public String getChartLegends8() {
		return chartLegends8;
	}
	public void setChartLegends8(String chartLegends8) {
		this.chartLegends8 = chartLegends8;
	}
	public String getChartLegends9() {
		return chartLegends9;
	}
	public void setChartLegends9(String chartLegends9) {
		this.chartLegends9 = chartLegends9;
	}
	public String getChartColors1() {
		return chartColors1;
	}
	public void setChartColors1(String chartColors1) {
		this.chartColors1 = chartColors1;
	}
	public String getChartColors2() {
		return chartColors2;
	}
	public void setChartColors2(String chartColors2) {
		this.chartColors2 = chartColors2;
	}
	public String getChartColors3() {
		return chartColors3;
	}
	public void setChartColors3(String chartColors3) {
		this.chartColors3 = chartColors3;
	}
	public String getChartColors4() {
		return chartColors4;
	}
	public void setChartColors4(String chartColors4) {
		this.chartColors4 = chartColors4;
	}
	public String getChartColors5() {
		return chartColors5;
	}
	public void setChartColors5(String chartColors5) {
		this.chartColors5 = chartColors5;
	}
	public String getChartColors6() {
		return chartColors6;
	}
	public void setChartColors6(String chartColors6) {
		this.chartColors6 = chartColors6;
	}
	public String getChartColors7() {
		return chartColors7;
	}
	public void setChartColors7(String chartColors7) {
		this.chartColors7 = chartColors7;
	}
	public String getChartColors8() {
		return chartColors8;
	}
	public void setChartColors8(String chartColors8) {
		this.chartColors8 = chartColors8;
	}
	public String getChartColors9() {
		return chartColors9;
	}
	public void setChartColors9(String chartColors9) {
		this.chartColors9 = chartColors9;
	}
	public String getShowLegend() {
		return showLegend;
	}
	public void setShowLegend(String showLegend) {
		this.showLegend = showLegend;
	}
	public String getDecimals() {
		return decimals;
	}
	public void setDecimals(String decimals) {
		this.decimals = decimals;
	}
	public String getxStep() {
		return xStep;
	}
	public void setxStep(String xStep) {
		this.xStep = xStep;
	}
	public String getGridLineStyle() {
		return gridLineStyle;
	}
	public void setGridLineStyle(String gridLineStyle) {
		this.gridLineStyle = gridLineStyle;
	}
	public String getChartType1() {
		return chartType1;
	}
	public void setChartType1(String chartType1) {
		this.chartType1 = chartType1;
	}
	public String getChartType2() {
		return chartType2;
	}
	public void setChartType2(String chartType2) {
		this.chartType2 = chartType2;
	}
	public String getChartType3() {
		return chartType3;
	}
	public void setChartType3(String chartType3) {
		this.chartType3 = chartType3;
	}
	public String getShowXGridLine() {
		return showXGridLine;
	}
	public void setShowXGridLine(String showXGridLine) {
		this.showXGridLine = showXGridLine;
	}
	public String getShowYGridLine() {
		return showYGridLine;
	}
	public void setShowYGridLine(String showYGridLine) {
		this.showYGridLine = showYGridLine;
	}
	public String getyLeftTitle1() {
		return yLeftTitle1;
	}
	public void setyLeftTitle1(String yLeftTitle1) {
		this.yLeftTitle1 = yLeftTitle1;
	}
	public String getyLeftTitle2() {
		return yLeftTitle2;
	}
	public void setyLeftTitle2(String yLeftTitle2) {
		this.yLeftTitle2 = yLeftTitle2;
	}
	public String getyLeftTitle3() {
		return yLeftTitle3;
	}
	public void setyLeftTitle3(String yLeftTitle3) {
		this.yLeftTitle3 = yLeftTitle3;
	}
	public String getyLeftTitle4() {
		return yLeftTitle4;
	}
	public void setyLeftTitle4(String yLeftTitle4) {
		this.yLeftTitle4 = yLeftTitle4;
	}
	public String getyLeftTitle5() {
		return yLeftTitle5;
	}
	public void setyLeftTitle5(String yLeftTitle5) {
		this.yLeftTitle5 = yLeftTitle5;
	}
	public String getyLeftTitle6() {
		return yLeftTitle6;
	}
	public void setyLeftTitle6(String yLeftTitle6) {
		this.yLeftTitle6 = yLeftTitle6;
	}
	public String getyLeftTitle7() {
		return yLeftTitle7;
	}
	public void setyLeftTitle7(String yLeftTitle7) {
		this.yLeftTitle7 = yLeftTitle7;
	}
	public String getyRightTitle1() {
		return yRightTitle1;
	}
	public void setyRightTitle1(String yRightTitle1) {
		this.yRightTitle1 = yRightTitle1;
	}
	public String getyRightTitle2() {
		return yRightTitle2;
	}
	public void setyRightTitle2(String yRightTitle2) {
		this.yRightTitle2 = yRightTitle2;
	}
	public String getyRightTitle3() {
		return yRightTitle3;
	}
	public void setyRightTitle3(String yRightTitle3) {
		this.yRightTitle3 = yRightTitle3;
	}
	public String getyRightTitle4() {
		return yRightTitle4;
	}
	public void setyRightTitle4(String yRightTitle4) {
		this.yRightTitle4 = yRightTitle4;
	}
	public String getyRightTitle5() {
		return yRightTitle5;
	}
	public void setyRightTitle5(String yRightTitle5) {
		this.yRightTitle5 = yRightTitle5;
	}
	public String getyRightTitle6() {
		return yRightTitle6;
	}
	public void setyRightTitle6(String yRightTitle6) {
		this.yRightTitle6 = yRightTitle6;
	}
	public String getyRightTitle7() {
		return yRightTitle7;
	}
	public void setyRightTitle7(String yRightTitle7) {
		this.yRightTitle7 = yRightTitle7;
	}
	public String getySymbol1() {
		return ySymbol1;
	}
	public void setySymbol1(String ySymbol1) {
		this.ySymbol1 = ySymbol1;
	}
	public String getySymbol2() {
		return ySymbol2;
	}
	public void setySymbol2(String ySymbol2) {
		this.ySymbol2 = ySymbol2;
	}
	public String getySymbol3() {
		return ySymbol3;
	}
	public void setySymbol3(String ySymbol3) {
		this.ySymbol3 = ySymbol3;
	}
	public String getySymbol4() {
		return ySymbol4;
	}
	public void setySymbol4(String ySymbol4) {
		this.ySymbol4 = ySymbol4;
	}
	public String getySymbol5() {
		return ySymbol5;
	}
	public void setySymbol5(String ySymbol5) {
		this.ySymbol5 = ySymbol5;
	}
	public String getySymbol6() {
		return ySymbol6;
	}
	public void setySymbol6(String ySymbol6) {
		this.ySymbol6 = ySymbol6;
	}
	public String getySymbol7() {
		return ySymbol7;
	}
	public void setySymbol7(String ySymbol7) {
		this.ySymbol7 = ySymbol7;
	}
	public String getRadiusList() {
		return radiusList;
	}
	public void setRadiusList(String radiusList) {
		this.radiusList = radiusList;
	}
	public String getSymbol1() {
		return symbol1;
	}
	public void setSymbol1(String symbol1) {
		this.symbol1 = symbol1;
	}
	public String getSymbol2() {
		return symbol2;
	}
	public void setSymbol2(String symbol2) {
		this.symbol2 = symbol2;
	}
	public String getSymbol3() {
		return symbol3;
	}
	public void setSymbol3(String symbol3) {
		this.symbol3 = symbol3;
	}
	public String getSymbol4() {
		return symbol4;
	}
	public void setSymbol4(String symbol4) {
		this.symbol4 = symbol4;
	}
	public String getSymbol5() {
		return symbol5;
	}
	public void setSymbol5(String symbol5) {
		this.symbol5 = symbol5;
	}
	public String getSymbol6() {
		return symbol6;
	}
	public void setSymbol6(String symbol6) {
		this.symbol6 = symbol6;
	}
	public String getSymbol7() {
		return symbol7;
	}
	public void setSymbol7(String symbol7) {
		this.symbol7 = symbol7;
	}
	public String getyAxisList() {
		return yAxisList;
	}
	public void setyAxisList(String yAxisList) {
		this.yAxisList = yAxisList;
	}
	public String getC_fillColors() {
		return c_fillColors;
	}
	public void setC_fillColors(String c_fillColors) {
		this.c_fillColors = c_fillColors;
	}
	public String getLineWidth() {
		return lineWidth;
	}
	public void setLineWidth(String lineWidth) {
		this.lineWidth = lineWidth;
	}
	public String getForm_mul() {
		return form_mul;
	}
	public void setForm_mul(String form_mul) {
		this.form_mul = form_mul;
	}
	public String getLegendLayout1() {
		return legendLayout1;
	}
	public void setLegendLayout1(String legendLayout1) {
		this.legendLayout1 = legendLayout1;
	}
	public String getLegendLayout2() {
		return legendLayout2;
	}
	public void setLegendLayout2(String legendLayout2) {
		this.legendLayout2 = legendLayout2;
	}
	public String getLegendLayout3() {
		return legendLayout3;
	}
	public void setLegendLayout3(String legendLayout3) {
		this.legendLayout3 = legendLayout3;
	}
	public String getLegendLayout4() {
		return legendLayout4;
	}
	public void setLegendLayout4(String legendLayout4) {
		this.legendLayout4 = legendLayout4;
	}
	public String getLegendAlign1() {
		return legendAlign1;
	}
	public void setLegendAlign1(String legendAlign1) {
		this.legendAlign1 = legendAlign1;
	}
	public String getLegendAlign2() {
		return legendAlign2;
	}
	public void setLegendAlign2(String legendAlign2) {
		this.legendAlign2 = legendAlign2;
	}
	public String getLegendAlign3() {
		return legendAlign3;
	}
	public void setLegendAlign3(String legendAlign3) {
		this.legendAlign3 = legendAlign3;
	}
	public String getLegendAlign4() {
		return legendAlign4;
	}
	public void setLegendAlign4(String legendAlign4) {
		this.legendAlign4 = legendAlign4;
	}
	public String getWordColor() {
		return wordColor;
	}
	public void setWordColor(String wordColor) {
		this.wordColor = wordColor;
	}
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public String getInnerSize1() {
		return innerSize1;
	}
	public void setInnerSize1(String innerSize1) {
		this.innerSize1 = innerSize1;
	}
	public String getInnerSize2() {
		return innerSize2;
	}
	public void setInnerSize2(String innerSize2) {
		this.innerSize2 = innerSize2;
	}
	public String getInnerSize3() {
		return innerSize3;
	}
	public void setInnerSize3(String innerSize3) {
		this.innerSize3 = innerSize3;
	}
	public String getInnerSize4() {
		return innerSize4;
	}
	public void setInnerSize4(String innerSize4) {
		this.innerSize4 = innerSize4;
	}
	public String getInnerSize5() {
		return innerSize5;
	}
	public void setInnerSize5(String innerSize5) {
		this.innerSize5 = innerSize5;
	}
	public String getInnerSize6() {
		return innerSize6;
	}
	public void setInnerSize6(String innerSize6) {
		this.innerSize6 = innerSize6;
	}
	public String getInnerSize7() {
		return innerSize7;
	}
	public void setInnerSize7(String innerSize7) {
		this.innerSize7 = innerSize7;
	}
	public String getItemName1() {
		return itemName1;
	}
	public void setItemName1(String itemName1) {
		this.itemName1 = itemName1;
	}
	public String getItemName2() {
		return itemName2;
	}
	public void setItemName2(String itemName2) {
		this.itemName2 = itemName2;
	}
	public String getItemName3() {
		return itemName3;
	}
	public void setItemName3(String itemName3) {
		this.itemName3 = itemName3;
	}
	public String getItemName4() {
		return itemName4;
	}
	public void setItemName4(String itemName4) {
		this.itemName4 = itemName4;
	}
	public String getItemName5() {
		return itemName5;
	}
	public void setItemName5(String itemName5) {
		this.itemName5 = itemName5;
	}
	public String getItemName6() {
		return itemName6;
	}
	public void setItemName6(String itemName6) {
		this.itemName6 = itemName6;
	}
	public String getItemName7() {
		return itemName7;
	}
	public void setItemName7(String itemName7) {
		this.itemName7 = itemName7;
	}
	public String getExpColumnName1() {
		return expColumnName1;
	}
	public void setExpColumnName1(String expColumnName1) {
		this.expColumnName1 = expColumnName1;
	}
	public String getExpColumnName2() {
		return expColumnName2;
	}
	public void setExpColumnName2(String expColumnName2) {
		this.expColumnName2 = expColumnName2;
	}
	public String getExpColumnName3() {
		return expColumnName3;
	}
	public void setExpColumnName3(String expColumnName3) {
		this.expColumnName3 = expColumnName3;
	}
	public String getExpColumnName4() {
		return expColumnName4;
	}
	public void setExpColumnName4(String expColumnName4) {
		this.expColumnName4 = expColumnName4;
	}
	public String getExpColumnName5() {
		return expColumnName5;
	}
	public void setExpColumnName5(String expColumnName5) {
		this.expColumnName5 = expColumnName5;
	}
	public String getExpColumnName6() {
		return expColumnName6;
	}
	public void setExpColumnName6(String expColumnName6) {
		this.expColumnName6 = expColumnName6;
	}
	public String getExpColumnName7() {
		return expColumnName7;
	}
	public void setExpColumnName7(String expColumnName7) {
		this.expColumnName7 = expColumnName7;
	}
	public String getForm_name1() {
		return form_name1;
	}
	public void setForm_name1(String form_name1) {
		this.form_name1 = form_name1;
	}
	public String getForm_name2() {
		return form_name2;
	}
	public void setForm_name2(String form_name2) {
		this.form_name2 = form_name2;
	}
	public String getForm_name3() {
		return form_name3;
	}
	public void setForm_name3(String form_name3) {
		this.form_name3 = form_name3;
	}
	public String getForm_name4() {
		return form_name4;
	}
	public void setForm_name4(String form_name4) {
		this.form_name4 = form_name4;
	}
	public String getForm_name5() {
		return form_name5;
	}
	public void setForm_name5(String form_name5) {
		this.form_name5 = form_name5;
	}
	public String getForm_name6() {
		return form_name6;
	}
	public void setForm_name6(String form_name6) {
		this.form_name6 = form_name6;
	}
	public String getForm_name7() {
		return form_name7;
	}
	public void setForm_name7(String form_name7) {
		this.form_name7 = form_name7;
	}
	public String getForm_id1() {
		return form_id1;
	}
	public void setForm_id1(String form_id1) {
		this.form_id1 = form_id1;
	}
	public String getForm_id2() {
		return form_id2;
	}
	public void setForm_id2(String form_id2) {
		this.form_id2 = form_id2;
	}
	public String getForm_id3() {
		return form_id3;
	}
	public void setForm_id3(String form_id3) {
		this.form_id3 = form_id3;
	}
	public String getForm_id4() {
		return form_id4;
	}
	public void setForm_id4(String form_id4) {
		this.form_id4 = form_id4;
	}
	public String getForm_id5() {
		return form_id5;
	}
	public void setForm_id5(String form_id5) {
		this.form_id5 = form_id5;
	}
	public String getForm_id6() {
		return form_id6;
	}
	public void setForm_id6(String form_id6) {
		this.form_id6 = form_id6;
	}
	public String getForm_id7() {
		return form_id7;
	}
	public void setForm_id7(String form_id7) {
		this.form_id7 = form_id7;
	}
	public String getForm_ispd1() {
		return form_ispd1;
	}
	public void setForm_ispd1(String form_ispd1) {
		this.form_ispd1 = form_ispd1;
	}
	public String getForm_ispd2() {
		return form_ispd2;
	}
	public void setForm_ispd2(String form_ispd2) {
		this.form_ispd2 = form_ispd2;
	}
	public String getForm_ispd3() {
		return form_ispd3;
	}
	public void setForm_ispd3(String form_ispd3) {
		this.form_ispd3 = form_ispd3;
	}
	public String getForm_ispd4() {
		return form_ispd4;
	}
	public void setForm_ispd4(String form_ispd4) {
		this.form_ispd4 = form_ispd4;
	}
	public String getForm_ispd5() {
		return form_ispd5;
	}
	public void setForm_ispd5(String form_ispd5) {
		this.form_ispd5 = form_ispd5;
	}
	public String getForm_ispd6() {
		return form_ispd6;
	}
	public void setForm_ispd6(String form_ispd6) {
		this.form_ispd6 = form_ispd6;
	}
	public String getForm_ispd7() {
		return form_ispd7;
	}
	public void setForm_ispd7(String form_ispd7) {
		this.form_ispd7 = form_ispd7;
	}
	public String getDayColumn() {
		return dayColumn;
	}
	public void setDayColumn(String dayColumn) {
		this.dayColumn = dayColumn;
	}
	public String getShowLegendForm() {
		return showLegendForm;
	}
	public void setShowLegendForm(String showLegendForm) {
		this.showLegendForm = showLegendForm;
	}
	public String getCommonColumn1() {
		return commonColumn1;
	}
	public void setCommonColumn1(String commonColumn1) {
		this.commonColumn1 = commonColumn1;
	}
	public String getCommonColumn2() {
		return commonColumn2;
	}
	public void setCommonColumn2(String commonColumn2) {
		this.commonColumn2 = commonColumn2;
	}
	public String getCommonColumn3() {
		return commonColumn3;
	}
	public void setCommonColumn3(String commonColumn3) {
		this.commonColumn3 = commonColumn3;
	}
	public String getCommonColumn4() {
		return commonColumn4;
	}
	public void setCommonColumn4(String commonColumn4) {
		this.commonColumn4 = commonColumn4;
	}
	public String getCommonColumn5() {
		return commonColumn5;
	}
	public void setCommonColumn5(String commonColumn5) {
		this.commonColumn5 = commonColumn5;
	}
	public String getCommonColumn6() {
		return commonColumn6;
	}
	public void setCommonColumn6(String commonColumn6) {
		this.commonColumn6 = commonColumn6;
	}
	public String getCommonColumn7() {
		return commonColumn7;
	}
	public void setCommonColumn7(String commonColumn7) {
		this.commonColumn7 = commonColumn7;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
