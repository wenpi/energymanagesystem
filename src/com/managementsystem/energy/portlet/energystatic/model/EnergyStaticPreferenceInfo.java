package com.managementsystem.energy.portlet.energystatic.model;

import java.io.Serializable;

/**
 * 存储能耗统计和能效分析首选项信息 
 * @author: zhangtianle
 */
public class EnergyStaticPreferenceInfo implements Serializable {

	private static final long serialVersionUID = -2404578964137287842L;

	private String isShowLoadRate; // 是否显示负载率，block/none
	private String isShowWindPressure; // 是否显示运行风量、风压，block/none
	private String itemName;
	/**
	 * 导出excel列头名称
	 */
	private String expColumnName;
	private String expColumnName1;
	private String expColumnName2;
	private String expColumnName3;
	private String expColumnName4;
	private String expColumnName5;
	private String expColumnName6;
	/**
	 * 保留小数位数
	 */
	private String decimals;
	private String decimals1;
	private String decimals2;
	private String decimals3;
	private String decimals4;
	private String decimals5;
	private String decimals6;
	/**
	 * 默认时间
	 */
	private String defaulttime;
	private String defaulttime1;
	private String defaulttime2;
	private String defaulttime3;
	private String defaulttime4;
	private String defaulttime5;
	private String defaulttime6;
	/**
	 * 求值的name/id/ispd
	 */
	private String valuename;
	private String valueid;
	private String valueispd;

	/**
	 * 描述
	 */
	private String description;
	private String description_1;
	private String description_2;
	private String description_3;
	private String description_4;
	private String description_5;
	private String description_6;

	private String description_1_2;
	private String description_1_3;
	private String description_2_2;
	private String description_2_3;
	private String description_3_2;
	private String description_3_3;
	private String description_4_2;
	private String description_4_3;
	private String description_5_2;
	private String description_5_3;
	private String description_6_2;
	private String description_6_3;
	/**
	 * 图表背景颜色
	 * */
	private String backgroundColor;
	private String backgroundColor_1;
	private String backgroundColor_2;
	private String backgroundColor_3;
	private String backgroundColor_4;
	private String backgroundColor_5;
	private String backgroundColor_6;
	/**
	 * 图表类型
	 * */
	private String chartType;
	private String chartType_1;
	private String chartType_2;
	private String chartType_3;
	private String chartType_4;
	private String chartType_5;
	private String chartType_6;

	private String chartType_1_1;
	private String chartType_2_1;
	private String chartType_3_1;
	private String chartType_4_1;
	private String chartType_5_1;
	private String chartType_6_1;
	private String chartType_1_2;
	private String chartType_2_2;
	private String chartType_3_2;
	private String chartType_4_2;
	private String chartType_5_2;
	private String chartType_6_2;

	/**
	 * 图表图例列表
	 */
	private String chartLegendList;
	private String chartLegendList_1;
	private String chartLegendList_2;
	private String chartLegendList_3;
	private String chartLegendList_4;
	private String chartLegendList_5;
	private String chartLegendList_6;
	/**
	 * 图表相关属性，依次是参考图例名称、参考颜色
	 */
	private String referenceLegend;
	private String referenceLegend_2;
	private String referenceLegend_4;
	private String referenceLegend_5;
	private String referenceLegend_6;

	private String referenceColor;
	private String referenceColor_2;
	private String referenceColor_4;
	private String referenceColor_5;
	private String referenceColor_6;

	/**
	 * 图表颜色列表
	 */
	private String chartColorList;
	private String chartColorList_1;
	private String chartColorList_2;
	private String chartColorList_3;
	private String chartColorList_4;
	private String chartColorList_5;
	private String chartColorList_6;
	/**
	 * 图表数据列表
	 */
	private String chartDataList_2;
	private String chartDataList_5;
	/**
	 * 标题
	 */
	private String title;
	private String title1;
	private String title2;
	private String title3;
	private String title4;
	private String title5;
	private String title6;
	private String leftTitle;
	/**
	 * 是否显示图例
	 */
	private String showLegend;
	private String showLegend_1;
	private String showLegend_2;
	private String showLegend_3;
	private String showLegend_4;
	private String showLegend_5;
	private String showLegend_6;
	/**
	 * X轴显示的间隔
	 */
	private String xStep;
	private String xStep_1;
	private String xStep_2;
	private String xStep_3;
	private String xStep_4;
	private String xStep_5;
	private String xStep_6;

	/**
	 * Y轴左侧显示的标题
	 */
	private String yLeftTitle;
	private String yLeftTitle_1;
	private String yLeftTitle_2;
	private String yLeftTitle_3;
	private String yLeftTitle_4;
	private String yLeftTitle_5;
	private String yLeftTitle_6;
	/**
	 * Y轴右侧显示的标题
	 */
	private String yRightTitle;
	private String yRightTitle_1;
	private String yRightTitle_2;
	private String yRightTitle_3;
	private String yRightTitle_4;
	private String yRightTitle_5;
	private String yRightTitle_6;
	/**
	 * 线颜色
	 */
	private String lineColor;
	/**
	 * 图表提示栏字体颜色
	 */
	private String chartToolTipColor;
	/**
	 * 图表提示栏文字
	 */
	private String chartToolTipTitle;
	/**
	 * 图表提示栏单位
	 */
	private String chartTipUnit;

	/**
	 * 图表中线的样式
	 */
	private String gridLineDashStyle;

	/**
	 * 网格线颜色
	 */
	private String gridLineColor;
	/**
	 * 曲线点半径列表
	 */
	private String chartRadiusList;
	private String chartRadiusList_1;
	private String chartRadiusList_2;
	private String chartRadiusList_3;
	private String chartRadiusList_4;
	private String chartRadiusList_5;
	private String chartRadiusList_6;

	/**
	 * 曲线点类型列表
	 */
	private String chartSymbolList;
	/**
	 * 双Y轴顺序列表（0,1）
	 */
	private String chartYAxisList;
	/**
	 * 图表填充颜色列表
	 */
	private String chartFillColorList;
	private String chartFillColorList_1;
	private String chartFillColorList_2;
	private String chartFillColorList_3;
	private String chartFillColorList_4;
	private String chartFillColorList_5;
	private String chartFillColorList_6;
	/**
	 * 数据单位
	 */
	private String ySymbol4;
	private String ySymbol5;
	/**
	 * 图例位置
	 */
	private String chartLegendLayout_2;
	private String chartLegendLayout_5;
	/**
	 * 图例水平位置
	 */
	private String chartLegendAlign_2;
	private String chartLegendAlign_5;
	/**
	 * 图表居中标题
	 */
	private String centerTitle;
	private String centerTitle_1;
	private String centerTitle_2;
	private String centerTitle_3;
	private String centerTitle_4;
	private String centerTitle_5;
	private String centerTitle_6;

	/**
	 * 连接线宽度
	 */
	private String connectLineWidth;
	private String connectLineWidth_1;
	private String connectLineWidth_2;
	private String connectLineWidth_3;
	private String connectLineWidth_4;
	private String connectLineWidth_5;
	private String connectLineWidth_6;
	/**
	 * 线宽1
	 */
	private String lineWidth;
	private String lineWidth_1;
	private String lineWidth_2;
	private String lineWidth_3;
	private String lineWidth_4;
	private String lineWidth_5;
	private String lineWidth_6;
	/**
	 * 曲线点的类型
	 */
	private String symbol;
	private String symbol1;
	private String symbol2;
	private String symbol3;
	private String symbol4;
	private String symbol5;
	private String symbol6;

	/**
	 * Y轴数值后带的符号
	 */
	private String ySymbol;
	private String ySymbol2;
	private String ySymbol6;
	/**
	 * 选择name和id
	 */
	private String choose_name;
	private String choose_name1;
	private String choose_name2;
	private String choose_name3;
	private String choose_name4;
	private String choose_name5;
	private String choose_name6;
	private String choose_id;
	private String choose_id1;
	private String choose_id2;
	private String choose_id3;
	private String choose_id4;
	private String choose_id5;
	private String choose_id6;

	/**
	 * 图表中的设置属性
	 */
	private String attribute;// 参数的属性
	private String tspan;// 时间间隔
	private String ispd;// 判断参数是否为统计量
	private String ispd1;
	private String ispd2;
	private String ispd3;
	private String ispd4;
	private String ispd5;
	private String ispd6;

	private String multiplier; // 乘数

	private String referencevalue; // 参考值
	private String referencevalue2; // 参考值
	private String referencevalue4; // 参考值
	private String referencevalue5; // 参考值
	private String referencevalue6; // 参考值

	private String hours = "0"; // 默认为0，放首选项中为了方便配置程序是否需要增加八小时

	public String getHours() {
		return hours;
	}

	public void setHours(String hours) {
		this.hours = hours;
	}

	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}

	public String getTspan() {
		return tspan;
	}

	public void setTspan(String tspan) {
		this.tspan = tspan;
	}

	public String getIspd() {
		return ispd;
	}

	public void setIspd(String ispd) {
		this.ispd = ispd;
	}

	public String getChoose_name() {
		return choose_name;
	}

	public void setChoose_name(String choose_name) {
		this.choose_name = choose_name;
	}

	public String getChoose_id() {
		return choose_id;
	}

	public void setChoose_id(String choose_id) {
		this.choose_id = choose_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription_1() {
		return description_1;
	}

	public void setDescription_1(String description_1) {
		this.description_1 = description_1;
	}

	public String getDescription_2() {
		return description_2;
	}

	public void setDescription_2(String description_2) {
		this.description_2 = description_2;
	}

	public String getDescription_3() {
		return description_3;
	}

	public void setDescription_3(String description_3) {
		this.description_3 = description_3;
	}

	public String getDescription_4() {
		return description_4;
	}

	public void setDescription_4(String description_4) {
		this.description_4 = description_4;
	}

	public String getDescription_5() {
		return description_5;
	}

	public void setDescription_5(String description_5) {
		this.description_5 = description_5;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getBackgroundColor_1() {
		return backgroundColor_1;
	}

	public void setBackgroundColor_1(String backgroundColor_1) {
		this.backgroundColor_1 = backgroundColor_1;
	}

	public String getBackgroundColor_2() {
		return backgroundColor_2;
	}

	public void setBackgroundColor_2(String backgroundColor_2) {
		this.backgroundColor_2 = backgroundColor_2;
	}

	public String getBackgroundColor_3() {
		return backgroundColor_3;
	}

	public void setBackgroundColor_3(String backgroundColor_3) {
		this.backgroundColor_3 = backgroundColor_3;
	}

	public String getBackgroundColor_4() {
		return backgroundColor_4;
	}

	public void setBackgroundColor_4(String backgroundColor_4) {
		this.backgroundColor_4 = backgroundColor_4;
	}

	public String getBackgroundColor_5() {
		return backgroundColor_5;
	}

	public void setBackgroundColor_5(String backgroundColor_5) {
		this.backgroundColor_5 = backgroundColor_5;
	}

	public String getChartType() {
		return chartType;
	}

	public void setChartType(String chartType) {
		this.chartType = chartType;
	}

	public String getChartType_1() {
		return chartType_1;
	}

	public void setChartType_1(String chartType_1) {
		this.chartType_1 = chartType_1;
	}

	public String getChartType_2() {
		return chartType_2;
	}

	public void setChartType_2(String chartType_2) {
		this.chartType_2 = chartType_2;
	}

	public String getChartType_3() {
		return chartType_3;
	}

	public void setChartType_3(String chartType_3) {
		this.chartType_3 = chartType_3;
	}

	public String getChartType_4() {
		return chartType_4;
	}

	public void setChartType_4(String chartType_4) {
		this.chartType_4 = chartType_4;
	}

	public String getChartType_5() {
		return chartType_5;
	}

	public void setChartType_5(String chartType_5) {
		this.chartType_5 = chartType_5;
	}

	public String getChartLegendList() {
		return chartLegendList;
	}

	public void setChartLegendList(String chartLegendList) {
		this.chartLegendList = chartLegendList;
	}

	public String getChartColorList() {
		return chartColorList;
	}

	public void setChartColorList(String chartColorList) {
		this.chartColorList = chartColorList;
	}

	public String getChartColorList_1() {
		return chartColorList_1;
	}

	public void setChartColorList_1(String chartColorList_1) {
		this.chartColorList_1 = chartColorList_1;
	}

	public String getChartColorList_2() {
		return chartColorList_2;
	}

	public void setChartColorList_2(String chartColorList_2) {
		this.chartColorList_2 = chartColorList_2;
	}

	public String getChartColorList_3() {
		return chartColorList_3;
	}

	public void setChartColorList_3(String chartColorList_3) {
		this.chartColorList_3 = chartColorList_3;
	}

	public String getChartColorList_4() {
		return chartColorList_4;
	}

	public void setChartColorList_4(String chartColorList_4) {
		this.chartColorList_4 = chartColorList_4;
	}

	public String getChartColorList_5() {
		return chartColorList_5;
	}

	public void setChartColorList_5(String chartColorList_5) {
		this.chartColorList_5 = chartColorList_5;
	}

	public String getChartDataList_2() {
		return chartDataList_2;
	}

	public void setChartDataList_2(String chartDataList_2) {
		this.chartDataList_2 = chartDataList_2;
	}

	public String getChartDataList_5() {
		return chartDataList_5;
	}

	public void setChartDataList_5(String chartDataList_5) {
		this.chartDataList_5 = chartDataList_5;
	}

	public String getLeftTitle() {
		return leftTitle;
	}

	public void setLeftTitle(String leftTitle) {
		this.leftTitle = leftTitle;
	}

	public String getShowLegend() {
		return showLegend;
	}

	public void setShowLegend(String showLegend) {
		this.showLegend = showLegend;
	}

	public String getxStep() {
		return xStep;
	}

	public void setxStep(String xStep) {
		this.xStep = xStep;
	}

	public String getxStep_1() {
		return xStep_1;
	}

	public void setxStep_1(String xStep_1) {
		this.xStep_1 = xStep_1;
	}

	public String getxStep_2() {
		return xStep_2;
	}

	public void setxStep_2(String xStep_2) {
		this.xStep_2 = xStep_2;
	}

	public String getxStep_3() {
		return xStep_3;
	}

	public void setxStep_3(String xStep_3) {
		this.xStep_3 = xStep_3;
	}

	public String getxStep_4() {
		return xStep_4;
	}

	public void setxStep_4(String xStep_4) {
		this.xStep_4 = xStep_4;
	}

	public String getxStep_5() {
		return xStep_5;
	}

	public void setxStep_5(String xStep_5) {
		this.xStep_5 = xStep_5;
	}

	public String getyLeftTitle() {
		return yLeftTitle;
	}

	public void setyLeftTitle(String yLeftTitle) {
		this.yLeftTitle = yLeftTitle;
	}

	public String getyLeftTitle_1() {
		return yLeftTitle_1;
	}

	public void setyLeftTitle_1(String yLeftTitle_1) {
		this.yLeftTitle_1 = yLeftTitle_1;
	}

	public String getyLeftTitle_2() {
		return yLeftTitle_2;
	}

	public void setyLeftTitle_2(String yLeftTitle_2) {
		this.yLeftTitle_2 = yLeftTitle_2;
	}

	public String getyLeftTitle_3() {
		return yLeftTitle_3;
	}

	public void setyLeftTitle_3(String yLeftTitle_3) {
		this.yLeftTitle_3 = yLeftTitle_3;
	}

	public String getyLeftTitle_4() {
		return yLeftTitle_4;
	}

	public void setyLeftTitle_4(String yLeftTitle_4) {
		this.yLeftTitle_4 = yLeftTitle_4;
	}

	public String getyLeftTitle_5() {
		return yLeftTitle_5;
	}

	public void setyLeftTitle_5(String yLeftTitle_5) {
		this.yLeftTitle_5 = yLeftTitle_5;
	}

	public String getyRightTitle() {
		return yRightTitle;
	}

	public void setyRightTitle(String yRightTitle) {
		this.yRightTitle = yRightTitle;
	}

	public String getyRightTitle_1() {
		return yRightTitle_1;
	}

	public void setyRightTitle_1(String yRightTitle_1) {
		this.yRightTitle_1 = yRightTitle_1;
	}

	public String getyRightTitle_2() {
		return yRightTitle_2;
	}

	public void setyRightTitle_2(String yRightTitle_2) {
		this.yRightTitle_2 = yRightTitle_2;
	}

	public String getyRightTitle_3() {
		return yRightTitle_3;
	}

	public void setyRightTitle_3(String yRightTitle_3) {
		this.yRightTitle_3 = yRightTitle_3;
	}

	public String getyRightTitle_4() {
		return yRightTitle_4;
	}

	public void setyRightTitle_4(String yRightTitle_4) {
		this.yRightTitle_4 = yRightTitle_4;
	}

	public String getyRightTitle_5() {
		return yRightTitle_5;
	}

	public void setyRightTitle_5(String yRightTitle_5) {
		this.yRightTitle_5 = yRightTitle_5;
	}

	public String getLineColor() {
		return lineColor;
	}

	public void setLineColor(String lineColor) {
		this.lineColor = lineColor;
	}

	public String getChartToolTipColor() {
		return chartToolTipColor;
	}

	public void setChartToolTipColor(String chartToolTipColor) {
		this.chartToolTipColor = chartToolTipColor;
	}

	public String getChartToolTipTitle() {
		return chartToolTipTitle;
	}

	public void setChartToolTipTitle(String chartToolTipTitle) {
		this.chartToolTipTitle = chartToolTipTitle;
	}

	public String getChartTipUnit() {
		return chartTipUnit;
	}

	public void setChartTipUnit(String chartTipUnit) {
		this.chartTipUnit = chartTipUnit;
	}

	public String getGridLineDashStyle() {
		return gridLineDashStyle;
	}

	public void setGridLineDashStyle(String gridLineDashStyle) {
		this.gridLineDashStyle = gridLineDashStyle;
	}

	public String getChartRadiusList() {
		return chartRadiusList;
	}

	public void setChartRadiusList(String chartRadiusList) {
		this.chartRadiusList = chartRadiusList;
	}

	public String getChartSymbolList() {
		return chartSymbolList;
	}

	public void setChartSymbolList(String chartSymbolList) {
		this.chartSymbolList = chartSymbolList;
	}

	public String getChartYAxisList() {
		return chartYAxisList;
	}

	public void setChartYAxisList(String chartYAxisList) {
		this.chartYAxisList = chartYAxisList;
	}

	public String getChartFillColorList() {
		return chartFillColorList;
	}

	public void setChartFillColorList(String chartFillColorList) {
		this.chartFillColorList = chartFillColorList;
	}

	public String getCenterTitle() {
		return centerTitle;
	}

	public void setCenterTitle(String centerTitle) {
		this.centerTitle = centerTitle;
	}

	public String getCenterTitle_1() {
		return centerTitle_1;
	}

	public void setCenterTitle_1(String centerTitle_1) {
		this.centerTitle_1 = centerTitle_1;
	}

	public String getCenterTitle_2() {
		return centerTitle_2;
	}

	public void setCenterTitle_2(String centerTitle_2) {
		this.centerTitle_2 = centerTitle_2;
	}

	public String getCenterTitle_3() {
		return centerTitle_3;
	}

	public void setCenterTitle_3(String centerTitle_3) {
		this.centerTitle_3 = centerTitle_3;
	}

	public String getCenterTitle_4() {
		return centerTitle_4;
	}

	public void setCenterTitle_4(String centerTitle_4) {
		this.centerTitle_4 = centerTitle_4;
	}

	public String getCenterTitle_5() {
		return centerTitle_5;
	}

	public void setCenterTitle_5(String centerTitle_5) {
		this.centerTitle_5 = centerTitle_5;
	}

	public String getLineWidth() {
		return lineWidth;
	}

	public void setLineWidth(String lineWidth) {
		this.lineWidth = lineWidth;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public String getySymbol() {
		return ySymbol;
	}

	public void setySymbol(String ySymbol) {
		this.ySymbol = ySymbol;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getDescription_6() {
		return description_6;
	}

	public void setDescription_6(String description_6) {
		this.description_6 = description_6;
	}

	public String getBackgroundColor_6() {
		return backgroundColor_6;
	}

	public void setBackgroundColor_6(String backgroundColor_6) {
		this.backgroundColor_6 = backgroundColor_6;
	}

	public String getChartType_6() {
		return chartType_6;
	}

	public void setChartType_6(String chartType_6) {
		this.chartType_6 = chartType_6;
	}

	public String getChartType_1_1() {
		return chartType_1_1;
	}

	public void setChartType_1_1(String chartType_1_1) {
		this.chartType_1_1 = chartType_1_1;
	}

	public String getChartType_2_1() {
		return chartType_2_1;
	}

	public void setChartType_2_1(String chartType_2_1) {
		this.chartType_2_1 = chartType_2_1;
	}

	public String getChartType_3_1() {
		return chartType_3_1;
	}

	public void setChartType_3_1(String chartType_3_1) {
		this.chartType_3_1 = chartType_3_1;
	}

	public String getChartType_4_1() {
		return chartType_4_1;
	}

	public void setChartType_4_1(String chartType_4_1) {
		this.chartType_4_1 = chartType_4_1;
	}

	public String getChartType_5_1() {
		return chartType_5_1;
	}

	public void setChartType_5_1(String chartType_5_1) {
		this.chartType_5_1 = chartType_5_1;
	}

	public String getChartType_6_1() {
		return chartType_6_1;
	}

	public void setChartType_6_1(String chartType_6_1) {
		this.chartType_6_1 = chartType_6_1;
	}

	public String getChartType_1_2() {
		return chartType_1_2;
	}

	public void setChartType_1_2(String chartType_1_2) {
		this.chartType_1_2 = chartType_1_2;
	}

	public String getChartType_2_2() {
		return chartType_2_2;
	}

	public void setChartType_2_2(String chartType_2_2) {
		this.chartType_2_2 = chartType_2_2;
	}

	public String getChartType_3_2() {
		return chartType_3_2;
	}

	public void setChartType_3_2(String chartType_3_2) {
		this.chartType_3_2 = chartType_3_2;
	}

	public String getChartType_4_2() {
		return chartType_4_2;
	}

	public void setChartType_4_2(String chartType_4_2) {
		this.chartType_4_2 = chartType_4_2;
	}

	public String getChartType_5_2() {
		return chartType_5_2;
	}

	public void setChartType_5_2(String chartType_5_2) {
		this.chartType_5_2 = chartType_5_2;
	}

	public String getChartType_6_2() {
		return chartType_6_2;
	}

	public void setChartType_6_2(String chartType_6_2) {
		this.chartType_6_2 = chartType_6_2;
	}

	public String getChartColorList_6() {
		return chartColorList_6;
	}

	public void setChartColorList_6(String chartColorList_6) {
		this.chartColorList_6 = chartColorList_6;
	}

	public String getxStep_6() {
		return xStep_6;
	}

	public void setxStep_6(String xStep_6) {
		this.xStep_6 = xStep_6;
	}

	public String getyLeftTitle_6() {
		return yLeftTitle_6;
	}

	public void setyLeftTitle_6(String yLeftTitle_6) {
		this.yLeftTitle_6 = yLeftTitle_6;
	}

	public String getyRightTitle_6() {
		return yRightTitle_6;
	}

	public void setyRightTitle_6(String yRightTitle_6) {
		this.yRightTitle_6 = yRightTitle_6;
	}

	public String getCenterTitle_6() {
		return centerTitle_6;
	}

	public void setCenterTitle_6(String centerTitle_6) {
		this.centerTitle_6 = centerTitle_6;
	}

	public String getLineWidth_1() {
		return lineWidth_1;
	}

	public void setLineWidth_1(String lineWidth_1) {
		this.lineWidth_1 = lineWidth_1;
	}

	public String getLineWidth_2() {
		return lineWidth_2;
	}

	public void setLineWidth_2(String lineWidth_2) {
		this.lineWidth_2 = lineWidth_2;
	}

	public String getLineWidth_3() {
		return lineWidth_3;
	}

	public void setLineWidth_3(String lineWidth_3) {
		this.lineWidth_3 = lineWidth_3;
	}

	public String getLineWidth_4() {
		return lineWidth_4;
	}

	public void setLineWidth_4(String lineWidth_4) {
		this.lineWidth_4 = lineWidth_4;
	}

	public String getLineWidth_5() {
		return lineWidth_5;
	}

	public void setLineWidth_5(String lineWidth_5) {
		this.lineWidth_5 = lineWidth_5;
	}

	public String getLineWidth_6() {
		return lineWidth_6;
	}

	public void setLineWidth_6(String lineWidth_6) {
		this.lineWidth_6 = lineWidth_6;
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

	public String getySymbol2() {
		return ySymbol2;
	}

	public void setySymbol2(String ySymbol2) {
		this.ySymbol2 = ySymbol2;
	}

	public String getySymbol6() {
		return ySymbol6;
	}

	public void setySymbol6(String ySymbol6) {
		this.ySymbol6 = ySymbol6;
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

	public String getReferencevalue2() {
		return referencevalue2;
	}

	public void setReferencevalue2(String referencevalue2) {
		this.referencevalue2 = referencevalue2;
	}

	public String getReferencevalue4() {
		return referencevalue4;
	}

	public void setReferencevalue4(String referencevalue4) {
		this.referencevalue4 = referencevalue4;
	}

	public String getReferencevalue5() {
		return referencevalue5;
	}

	public void setReferencevalue5(String referencevalue5) {
		this.referencevalue5 = referencevalue5;
	}

	public String getReferencevalue6() {
		return referencevalue6;
	}

	public void setReferencevalue6(String referencevalue6) {
		this.referencevalue6 = referencevalue6;
	}

	public String getDecimals() {
		return decimals;
	}

	public void setDecimals(String decimals) {
		this.decimals = decimals;
	}

	public String getDefaulttime() {
		return defaulttime;
	}

	public void setDefaulttime(String defaulttime) {
		this.defaulttime = defaulttime;
	}

	public String getValuename() {
		return valuename;
	}

	public void setValuename(String valuename) {
		this.valuename = valuename;
	}

	public String getValueid() {
		return valueid;
	}

	public void setValueid(String valueid) {
		this.valueid = valueid;
	}

	public String getValueispd() {
		return valueispd;
	}

	public void setValueispd(String valueispd) {
		this.valueispd = valueispd;
	}

	public String getMultiplier() {
		return multiplier;
	}

	public void setMultiplier(String multiplier) {
		this.multiplier = multiplier;
	}

	public String getReferenceLegend() {
		return referenceLegend;
	}

	public void setReferenceLegend(String referenceLegend) {
		this.referenceLegend = referenceLegend;
	}

	public String getReferenceColor() {
		return referenceColor;
	}

	public void setReferenceColor(String referenceColor) {
		this.referenceColor = referenceColor;
	}

	public String getConnectLineWidth() {
		return connectLineWidth;
	}

	public void setConnectLineWidth(String connectLineWidth) {
		this.connectLineWidth = connectLineWidth;
	}

	public String getReferenceLegend_2() {
		return referenceLegend_2;
	}

	public void setReferenceLegend_2(String referenceLegend_2) {
		this.referenceLegend_2 = referenceLegend_2;
	}

	public String getReferenceLegend_4() {
		return referenceLegend_4;
	}

	public void setReferenceLegend_4(String referenceLegend_4) {
		this.referenceLegend_4 = referenceLegend_4;
	}

	public String getReferenceLegend_5() {
		return referenceLegend_5;
	}

	public void setReferenceLegend_5(String referenceLegend_5) {
		this.referenceLegend_5 = referenceLegend_5;
	}

	public String getReferenceLegend_6() {
		return referenceLegend_6;
	}

	public void setReferenceLegend_6(String referenceLegend_6) {
		this.referenceLegend_6 = referenceLegend_6;
	}

	public String getReferenceColor_2() {
		return referenceColor_2;
	}

	public void setReferenceColor_2(String referenceColor_2) {
		this.referenceColor_2 = referenceColor_2;
	}

	public String getReferenceColor_4() {
		return referenceColor_4;
	}

	public void setReferenceColor_4(String referenceColor_4) {
		this.referenceColor_4 = referenceColor_4;
	}

	public String getReferenceColor_5() {
		return referenceColor_5;
	}

	public void setReferenceColor_5(String referenceColor_5) {
		this.referenceColor_5 = referenceColor_5;
	}

	public String getReferenceColor_6() {
		return referenceColor_6;
	}

	public void setReferenceColor_6(String referenceColor_6) {
		this.referenceColor_6 = referenceColor_6;
	}

	public String getChartRadiusList_1() {
		return chartRadiusList_1;
	}

	public void setChartRadiusList_1(String chartRadiusList_1) {
		this.chartRadiusList_1 = chartRadiusList_1;
	}

	public String getChartRadiusList_2() {
		return chartRadiusList_2;
	}

	public void setChartRadiusList_2(String chartRadiusList_2) {
		this.chartRadiusList_2 = chartRadiusList_2;
	}

	public String getChartRadiusList_3() {
		return chartRadiusList_3;
	}

	public void setChartRadiusList_3(String chartRadiusList_3) {
		this.chartRadiusList_3 = chartRadiusList_3;
	}

	public String getChartRadiusList_4() {
		return chartRadiusList_4;
	}

	public void setChartRadiusList_4(String chartRadiusList_4) {
		this.chartRadiusList_4 = chartRadiusList_4;
	}

	public String getChartRadiusList_5() {
		return chartRadiusList_5;
	}

	public void setChartRadiusList_5(String chartRadiusList_5) {
		this.chartRadiusList_5 = chartRadiusList_5;
	}

	public String getChartRadiusList_6() {
		return chartRadiusList_6;
	}

	public void setChartRadiusList_6(String chartRadiusList_6) {
		this.chartRadiusList_6 = chartRadiusList_6;
	}

	public String getChartFillColorList_1() {
		return chartFillColorList_1;
	}

	public void setChartFillColorList_1(String chartFillColorList_1) {
		this.chartFillColorList_1 = chartFillColorList_1;
	}

	public String getChartFillColorList_2() {
		return chartFillColorList_2;
	}

	public void setChartFillColorList_2(String chartFillColorList_2) {
		this.chartFillColorList_2 = chartFillColorList_2;
	}

	public String getChartFillColorList_3() {
		return chartFillColorList_3;
	}

	public void setChartFillColorList_3(String chartFillColorList_3) {
		this.chartFillColorList_3 = chartFillColorList_3;
	}

	public String getChartFillColorList_4() {
		return chartFillColorList_4;
	}

	public void setChartFillColorList_4(String chartFillColorList_4) {
		this.chartFillColorList_4 = chartFillColorList_4;
	}

	public String getChartFillColorList_5() {
		return chartFillColorList_5;
	}

	public void setChartFillColorList_5(String chartFillColorList_5) {
		this.chartFillColorList_5 = chartFillColorList_5;
	}

	public String getChartFillColorList_6() {
		return chartFillColorList_6;
	}

	public void setChartFillColorList_6(String chartFillColorList_6) {
		this.chartFillColorList_6 = chartFillColorList_6;
	}

	public String getConnectLineWidth_1() {
		return connectLineWidth_1;
	}

	public void setConnectLineWidth_1(String connectLineWidth_1) {
		this.connectLineWidth_1 = connectLineWidth_1;
	}

	public String getConnectLineWidth_2() {
		return connectLineWidth_2;
	}

	public void setConnectLineWidth_2(String connectLineWidth_2) {
		this.connectLineWidth_2 = connectLineWidth_2;
	}

	public String getConnectLineWidth_3() {
		return connectLineWidth_3;
	}

	public void setConnectLineWidth_3(String connectLineWidth_3) {
		this.connectLineWidth_3 = connectLineWidth_3;
	}

	public String getConnectLineWidth_4() {
		return connectLineWidth_4;
	}

	public void setConnectLineWidth_4(String connectLineWidth_4) {
		this.connectLineWidth_4 = connectLineWidth_4;
	}

	public String getConnectLineWidth_5() {
		return connectLineWidth_5;
	}

	public void setConnectLineWidth_5(String connectLineWidth_5) {
		this.connectLineWidth_5 = connectLineWidth_5;
	}

	public String getConnectLineWidth_6() {
		return connectLineWidth_6;
	}

	public void setConnectLineWidth_6(String connectLineWidth_6) {
		this.connectLineWidth_6 = connectLineWidth_6;
	}

	public String getExpColumnName() {
		return expColumnName;
	}

	public void setExpColumnName(String expColumnName) {
		this.expColumnName = expColumnName;
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

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getDescription_1_2() {
		return description_1_2;
	}

	public void setDescription_1_2(String description_1_2) {
		this.description_1_2 = description_1_2;
	}

	public String getDescription_1_3() {
		return description_1_3;
	}

	public void setDescription_1_3(String description_1_3) {
		this.description_1_3 = description_1_3;
	}

	public String getDescription_2_2() {
		return description_2_2;
	}

	public void setDescription_2_2(String description_2_2) {
		this.description_2_2 = description_2_2;
	}

	public String getDescription_2_3() {
		return description_2_3;
	}

	public void setDescription_2_3(String description_2_3) {
		this.description_2_3 = description_2_3;
	}

	public String getDescription_3_2() {
		return description_3_2;
	}

	public void setDescription_3_2(String description_3_2) {
		this.description_3_2 = description_3_2;
	}

	public String getDescription_3_3() {
		return description_3_3;
	}

	public void setDescription_3_3(String description_3_3) {
		this.description_3_3 = description_3_3;
	}

	public String getDescription_4_2() {
		return description_4_2;
	}

	public void setDescription_4_2(String description_4_2) {
		this.description_4_2 = description_4_2;
	}

	public String getDescription_4_3() {
		return description_4_3;
	}

	public void setDescription_4_3(String description_4_3) {
		this.description_4_3 = description_4_3;
	}

	public String getShowLegend_1() {
		return showLegend_1;
	}

	public void setShowLegend_1(String showLegend_1) {
		this.showLegend_1 = showLegend_1;
	}

	public String getShowLegend_2() {
		return showLegend_2;
	}

	public void setShowLegend_2(String showLegend_2) {
		this.showLegend_2 = showLegend_2;
	}

	public String getShowLegend_3() {
		return showLegend_3;
	}

	public void setShowLegend_3(String showLegend_3) {
		this.showLegend_3 = showLegend_3;
	}

	public String getShowLegend_4() {
		return showLegend_4;
	}

	public void setShowLegend_4(String showLegend_4) {
		this.showLegend_4 = showLegend_4;
	}

	public String getShowLegend_5() {
		return showLegend_5;
	}

	public void setShowLegend_5(String showLegend_5) {
		this.showLegend_5 = showLegend_5;
	}

	public String getShowLegend_6() {
		return showLegend_6;
	}

	public void setShowLegend_6(String showLegend_6) {
		this.showLegend_6 = showLegend_6;
	}

	public String getGridLineColor() {
		return gridLineColor;
	}

	public void setGridLineColor(String gridLineColor) {
		this.gridLineColor = gridLineColor;
	}

	public String getDecimals1() {
		return decimals1;
	}

	public void setDecimals1(String decimals1) {
		this.decimals1 = decimals1;
	}

	public String getDecimals2() {
		return decimals2;
	}

	public void setDecimals2(String decimals2) {
		this.decimals2 = decimals2;
	}

	public String getDecimals3() {
		return decimals3;
	}

	public void setDecimals3(String decimals3) {
		this.decimals3 = decimals3;
	}

	public String getDecimals4() {
		return decimals4;
	}

	public void setDecimals4(String decimals4) {
		this.decimals4 = decimals4;
	}

	public String getDecimals5() {
		return decimals5;
	}

	public void setDecimals5(String decimals5) {
		this.decimals5 = decimals5;
	}

	public String getDecimals6() {
		return decimals6;
	}

	public void setDecimals6(String decimals6) {
		this.decimals6 = decimals6;
	}

	public String getDefaulttime1() {
		return defaulttime1;
	}

	public void setDefaulttime1(String defaulttime1) {
		this.defaulttime1 = defaulttime1;
	}

	public String getDefaulttime2() {
		return defaulttime2;
	}

	public void setDefaulttime2(String defaulttime2) {
		this.defaulttime2 = defaulttime2;
	}

	public String getDefaulttime3() {
		return defaulttime3;
	}

	public void setDefaulttime3(String defaulttime3) {
		this.defaulttime3 = defaulttime3;
	}

	public String getDefaulttime4() {
		return defaulttime4;
	}

	public void setDefaulttime4(String defaulttime4) {
		this.defaulttime4 = defaulttime4;
	}

	public String getDefaulttime5() {
		return defaulttime5;
	}

	public void setDefaulttime5(String defaulttime5) {
		this.defaulttime5 = defaulttime5;
	}

	public String getDefaulttime6() {
		return defaulttime6;
	}

	public void setDefaulttime6(String defaulttime6) {
		this.defaulttime6 = defaulttime6;
	}

	public String getChartLegendList_1() {
		return chartLegendList_1;
	}

	public void setChartLegendList_1(String chartLegendList_1) {
		this.chartLegendList_1 = chartLegendList_1;
	}

	public String getChartLegendList_2() {
		return chartLegendList_2;
	}

	public void setChartLegendList_2(String chartLegendList_2) {
		this.chartLegendList_2 = chartLegendList_2;
	}

	public String getChartLegendList_3() {
		return chartLegendList_3;
	}

	public void setChartLegendList_3(String chartLegendList_3) {
		this.chartLegendList_3 = chartLegendList_3;
	}

	public String getChartLegendList_4() {
		return chartLegendList_4;
	}

	public void setChartLegendList_4(String chartLegendList_4) {
		this.chartLegendList_4 = chartLegendList_4;
	}

	public String getChartLegendList_5() {
		return chartLegendList_5;
	}

	public void setChartLegendList_5(String chartLegendList_5) {
		this.chartLegendList_5 = chartLegendList_5;
	}

	public String getChartLegendList_6() {
		return chartLegendList_6;
	}

	public void setChartLegendList_6(String chartLegendList_6) {
		this.chartLegendList_6 = chartLegendList_6;
	}

	public String getChoose_name1() {
		return choose_name1;
	}

	public void setChoose_name1(String choose_name1) {
		this.choose_name1 = choose_name1;
	}

	public String getChoose_name2() {
		return choose_name2;
	}

	public void setChoose_name2(String choose_name2) {
		this.choose_name2 = choose_name2;
	}

	public String getChoose_name3() {
		return choose_name3;
	}

	public void setChoose_name3(String choose_name3) {
		this.choose_name3 = choose_name3;
	}

	public String getChoose_name4() {
		return choose_name4;
	}

	public void setChoose_name4(String choose_name4) {
		this.choose_name4 = choose_name4;
	}

	public String getChoose_name5() {
		return choose_name5;
	}

	public void setChoose_name5(String choose_name5) {
		this.choose_name5 = choose_name5;
	}

	public String getChoose_name6() {
		return choose_name6;
	}

	public void setChoose_name6(String choose_name6) {
		this.choose_name6 = choose_name6;
	}

	public String getChoose_id1() {
		return choose_id1;
	}

	public void setChoose_id1(String choose_id1) {
		this.choose_id1 = choose_id1;
	}

	public String getChoose_id2() {
		return choose_id2;
	}

	public void setChoose_id2(String choose_id2) {
		this.choose_id2 = choose_id2;
	}

	public String getChoose_id3() {
		return choose_id3;
	}

	public void setChoose_id3(String choose_id3) {
		this.choose_id3 = choose_id3;
	}

	public String getChoose_id4() {
		return choose_id4;
	}

	public void setChoose_id4(String choose_id4) {
		this.choose_id4 = choose_id4;
	}

	public String getChoose_id5() {
		return choose_id5;
	}

	public void setChoose_id5(String choose_id5) {
		this.choose_id5 = choose_id5;
	}

	public String getChoose_id6() {
		return choose_id6;
	}

	public void setChoose_id6(String choose_id6) {
		this.choose_id6 = choose_id6;
	}

	public String getIspd1() {
		return ispd1;
	}

	public void setIspd1(String ispd1) {
		this.ispd1 = ispd1;
	}

	public String getIspd2() {
		return ispd2;
	}

	public void setIspd2(String ispd2) {
		this.ispd2 = ispd2;
	}

	public String getIspd3() {
		return ispd3;
	}

	public void setIspd3(String ispd3) {
		this.ispd3 = ispd3;
	}

	public String getIspd4() {
		return ispd4;
	}

	public void setIspd4(String ispd4) {
		this.ispd4 = ispd4;
	}

	public String getIspd5() {
		return ispd5;
	}

	public void setIspd5(String ispd5) {
		this.ispd5 = ispd5;
	}

	public String getIspd6() {
		return ispd6;
	}

	public void setIspd6(String ispd6) {
		this.ispd6 = ispd6;
	}

	public String getDescription_5_2() {
		return description_5_2;
	}

	public void setDescription_5_2(String description_5_2) {
		this.description_5_2 = description_5_2;
	}

	public String getDescription_5_3() {
		return description_5_3;
	}

	public void setDescription_5_3(String description_5_3) {
		this.description_5_3 = description_5_3;
	}

	public String getDescription_6_2() {
		return description_6_2;
	}

	public void setDescription_6_2(String description_6_2) {
		this.description_6_2 = description_6_2;
	}

	public String getDescription_6_3() {
		return description_6_3;
	}

	public void setDescription_6_3(String description_6_3) {
		this.description_6_3 = description_6_3;
	}

	public String getReferencevalue() {
		return referencevalue;
	}

	public void setReferencevalue(String referencevalue) {
		this.referencevalue = referencevalue;
	}

	public String getChartLegendLayout_2() {
		return chartLegendLayout_2;
	}

	public void setChartLegendLayout_2(String chartLegendLayout_2) {
		this.chartLegendLayout_2 = chartLegendLayout_2;
	}

	public String getChartLegendAlign_2() {
		return chartLegendAlign_2;
	}

	public void setChartLegendAlign_2(String chartLegendAlign_2) {
		this.chartLegendAlign_2 = chartLegendAlign_2;
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

	public String getChartLegendLayout_5() {
		return chartLegendLayout_5;
	}

	public void setChartLegendLayout_5(String chartLegendLayout_5) {
		this.chartLegendLayout_5 = chartLegendLayout_5;
	}

	public String getChartLegendAlign_5() {
		return chartLegendAlign_5;
	}

	public void setChartLegendAlign_5(String chartLegendAlign_5) {
		this.chartLegendAlign_5 = chartLegendAlign_5;
	}

	public String getIsShowLoadRate() {
		return isShowLoadRate;
	}

	public void setIsShowLoadRate(String isShowLoadRate) {
		this.isShowLoadRate = isShowLoadRate;
	}

	public String getIsShowWindPressure() {
		return isShowWindPressure;
	}

	public void setIsShowWindPressure(String isShowWindPressure) {
		this.isShowWindPressure = isShowWindPressure;
	}
}
