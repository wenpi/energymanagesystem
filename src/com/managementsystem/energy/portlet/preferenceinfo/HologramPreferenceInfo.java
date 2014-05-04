package com.managementsystem.energy.portlet.preferenceinfo;

/**
 * 运行监测-全息图配置项
 * */
public class HologramPreferenceInfo implements java.io.Serializable {

	private static final long serialVersionUID = 3786256156035845185L;

	private String isShowPassenger; // 是否显示全息图, block/none
	private String isShowPlan; // 是否显示平面图, block/none
	private String isShowRegion; // 是否显示区域, block/none
	private String isShowCo2; // 是否显示层Co2浓度, block/none
	private String f_params_repeat; // 是否显示平面图, yes/no

	/**
	 * 默认时间
	 */
	private String buildTime;
	/**
	 * 图表绘图区域背景颜色
	 */
	private String electricityChartColor;
	private String refrigerationChartColor;
	private String passengerChartColor;
	private String floorEctChartColor; // 层参数用电量及温度图表背景颜色
	private String floorCo2ChartColor; // 层参数Co2浓度图表背景颜色
	private String areaEctChartColor; // 区域参数用电量及温度图表背景颜色
	private String areaCo2ChartColor; // 区域参数Co2浓度图表背景颜色
	/**
	 * 连接线宽度
	 */
	private String electricityConnectLineWidth;
	private String refrigerationConnectLineWidth;
	private String passengerConnectLineWidth;

	private String floorEctConnLine; // 层参数用电量及温度图表连接线宽度
	private String floorCo2ConnLine; // 层参数Co2浓度图表连接线宽度

	private String areaEctConnLine; // 区域参数用电量及温度图表连接线宽度
	private String areaCo2ConnLine; // 区域参数Co2浓度图表连接线宽度
	/**
	 * 图例列表
	 */
	private String electricityChartLegendList;
	private String refrigerationChartLegendList;
	private String passengerChartLegendList;

	private String floorEctLegendList; // 层参数用电量及温度图表图例说明列表
	private String floorCo2LegendList; // 层参数Co2浓度图表图例说明列表

	private String areaEctLegendList; // 区域参数用电量及温度图表图例说明列表
	private String areaCo2LegendList; // 区域参数Co2浓度图表图例说明列表
	/**
	 * 图例图形宽度
	 */
	private String electricitySymbolWidth;
	private String refrigerationSymbolWidth;
	private String passengerSymbolWidth;
	/**
	 * 图例说明字体颜色
	 */
	private String electricityLegendColor;
	private String refrigerationLegendColor;
	private String passengerLegendColor;
	/**
	 * 数据列颜色列表
	 */
	private String electricityChartColorList;
	private String refrigerationChartColorList;
	private String passengerChartColorList;

	private String floorEctColorList; // 层参数用电量及温度图表数据列颜色列表
	private String floorCo2ColorList; // 层参数Co2浓度图表数据列颜色列表

	private String areaEctColorList; // 区域参数用电量及温度图表数据列颜色列表
	private String areaCo2ColorList; // 区域参数Co2浓度图表数据列颜色列表
	/**
	 * 保留小数位数
	 */
	private String electricityDecimals;
	private String refrigerationDecimals;
	private String passengerDecimals;

	private String floorEctDecimals; // 层参数用电量及温度图表数据保留小数位数
	private String floorCo2Decimals; // 层参数Co2浓度图表数据保留小数位数

	private String areaEctDecimals; // 区域参数用电量及温度图表数据保留小数位数
	private String areaCo2Decimals; // 区域参数Co2浓度图表数据保留小数位数
	/**
	 * X轴显示间隔
	 */
	private String electricityXStep;
	private String refrigerationXStep;
	private String passengerXStep;

	private String floorEctXStep; // 层参数用电量及温度图表X轴标签显示间隔
	private String floorCo2XStep; // 层参数Co2图表X轴标签显示间隔

	private String areaEctXStep; // 区域参数用电量及温度图表X轴标签显示间隔
	private String areaCo2XStep; // 区域参数Co2图表X轴标签显示间隔
	/**
	 * 网格线样式
	 */
	private String electricityGridLineStyle;
	private String refrigerationGridLineStyle;
	private String passengerGridLineStyle;

	private String floorEctGridStyle; // 层参数用电量及温度图表网格线样式
	private String floorCo2GridStyle; // 层参数Co2浓度图表网格线样式

	private String areaEctGridStyle; // 区域参数用电量及温度图表网格线样式
	private String areaCo2GridStyle; // 区域参数Co2浓度图表网格线样式
	/**
	 * 网格线颜色
	 */
	private String electricityGridLineColor;
	private String refrigerationGridLineColor;
	private String passengerGridLineColor;
	/**
	 * 图表类型
	 */
	private String electricityChartType1;
	private String electricityChartType2;

	private String refrigerationChartType1;
	private String refrigerationChartType2;

	private String passengerChartType1;
	private String passengerChartType2;

	private String floorEctChartType1; // 层参数用电量及温度图表图表类型1
	private String floorEctChartType2; // 层参数用电量及温度图表图表类型2

	private String floorCo2ChartType1; // 层参数Co2浓度图表图表类型1
	private String floorCo2ChartType2; // 层参数Co2浓度图表图表类型2

	private String areaEctChartType1; // 区域参数用电量及温度图表图表类型1
	private String areaEctChartType2; // 区域参数用电量及温度图表图表类型2

	private String areaCo2ChartType1; // 区域参数Co2浓度图表图表类型1
	private String areaCo2ChartType2; // 区域参数Co2浓度图表图表类型2
	/**
	 * 是否显示X轴网格线
	 */
	private String electricityShowX;
	private String refrigerationShowX;
	private String passengerShowX;

	private String floorEctShowX; // 层参数用电量及温度图表是否显示X轴网格线
	private String floorCo2ShowX; // 层参数Co2浓度图表是否显示X轴网格线

	private String areaEctShowX; // 区域参数用电量及温度图表是否显示X轴网格线
	private String areaCo2ShowX; // 区域参数Co2浓度图表是否显示X轴网格线
	/**
	 * 是否显示Y轴网格线
	 */
	private String electricityShowY;
	private String refrigerationShowY;
	private String passengerShowY;

	private String floorEctShowY; // 层参数用电量及温度图表是否显示Y轴网格线
	private String floorCo2ShowY; // 层参数Co2浓度图表是否显示Y轴网格线

	private String areaEctShowY; // 区域参数用电量及温度图表是否显示Y轴网格线
	private String areaCo2ShowY; // 区域参数Co2浓度图表是否显示Y轴网格线
	/**
	 * Y轴标题
	 */
	// 左标题
	private String electricityYLeftTitle;
	private String refrigerationYLeftTitle;
	private String passengerYLeftTitle;

	private String floorEctLeftTitle; // 层参数用电量及温度图表左标题
	private String floorCo2LeftTitle; // 层参数Co2浓度图表左标题

	private String areaEctLeftTitle; // 区域参数用电量及温度图表左标题
	private String areaCo2LeftTitle; // 区域参数Co2浓度图表左标题
	// 右标题
	private String electricityYRightTitle;
	private String refrigerationYRightTitle;
	private String passengerYRightTitle;

	private String floorEctRightTitle; // 层参数用电量及温度图表右标题
	private String floorCo2RightTitle; // 层参数Co2浓度图表右标题

	private String areaEctRightTitle; // 区域参数用电量及温度图表右标题
	private String areaCo2RightTitle; // 区域参数Co2浓度图表右标题
	/**
	 * Y轴标题颜色
	 */
	// 左标题颜色
	private String electricityLeftColor;
	private String refrigerationLeftColor;
	private String passengerLeftColor;
	// 右标题颜色
	private String electricityRightColor;
	private String refrigerationRightColor;
	private String passengerRightColor;
	/**
	 * Y轴单位
	 */
	private String electricityYSymbol;
	private String refrigerationYSymbol;
	private String passengerYSymbol;

	private String floorEctYSymbol; // 层参数用电量及温度图表Y轴单位
	private String floorCo2YSymbol; // 层参数Co2浓度图表Y轴单位

	private String areaEctYSymbol; // 区域参数用电量及温度图表Y轴单位
	private String areaCo2YSymbol; // 区域参数Co2浓度图表Y轴单位
	/**
	 * Y轴轴线宽度
	 */
	private String electricityYWidth;
	private String refrigerationYWidth;
	private String passengerYWidth;
	/**
	 * X轴标签颜色
	 */
	private String electricityXLabelColor;
	private String refrigerationXLabelColor;
	private String passengerXLabelColor;
	/**
	 * Y轴标签颜色
	 */
	private String electricityYLabelColor;
	private String refrigerationYLabelColor;
	private String passengerYLabelColor;
	/**
	 * X,Y轴颜色
	 */
	// Y轴部分
	private String electricityYColor;
	private String refrigerationYColor;
	private String passengerYColor;
	// X轴部分
	private String electricityXColor;
	private String refrigerationXColor;
	private String passengerXColor;
	/**
	 * 曲线点半径列表
	 */
	private String electricityRadiusList;
	private String refrigerationRadiusList;
	private String passengerRadiusList;

	private String floorEctRadius; // 层参数用电量及温度图表曲线点半径列表
	private String floorCo2Radius; // 层参数Co2浓度图表曲线点半径列表

	private String areaEctRadius; // 区域参数用电量及温度图表曲线点半径列表
	private String areaCo2Radius; // 区域参数Co2浓度图表曲线点半径列表
	/**
	 * 曲线点样式
	 */
	private String electricitySymbol;
	private String refrigerationSymbol;
	private String passengerSymbol;

	private String floorEctSymbol; // 层参数用电量及温度图表曲线点样式
	private String floorCo2Symbol; // 层参数Co2浓度图表曲线点样式

	private String areaEctSymbol; // 区域参数用电量及温度图表曲线点样式
	private String areaCo2Symbol; // 区域参数Co2浓度图表曲线点样式
	/**
	 * Y轴数据列表
	 */
	private String electricityYAxisList;
	private String refrigerationYAxisList;
	private String passengerYAxisList;

	private String floorEctYAxis; // 层参数用电量及温度图表Y轴数据列表
	private String floorCo2YAxis; // 层参数Co2浓度图表Y轴数据列表

	private String areaEctYAxis; // 区域参数用电量及温度图表Y轴数据列表
	private String areaCo2YAxis; // 区域参数Co2浓度图表Y轴数据列表
	/**
	 * 数据点填充颜色列表
	 */
	private String electricityFillColorList;
	private String refrigerationFillColorList;
	private String passengerFillColorList;

	private String floorEctFillColor; // 层参数用电量及温度图表数据点填充颜色
	private String floorCo2FillColor; // 层参数Co2浓度图表数据点填充颜色

	private String areaEctFillColor; // 区域参数用电量及温度图表数据点填充颜色
	private String areaCo2FillColor; // 区域参数用Co2浓度图表数据点填充颜色
	/**
	 * 线宽
	 */
	private String electricityLineWidth;
	private String refrigerationLineWidth;
	private String passengerLineWidth;

	private String floorEctLineWidth; // 层参数用电量及温度图表线宽
	private String floorCo2LineWidth; // 层参数Co2浓度图表

	private String areaEctLineWidth; // 区域参数用电量及温度图表线宽
	private String areaCo2LineWidth; // 区域参数Co2浓度图表
	/**
	 * 导出excel列头名称
	 */
	private String electricityExpColumnName;
	private String refrigerationExpColumnName;
	private String passengerExpColumnName;

	private String floorEctExpColumn; // 层参数用电量及温度图表导出excel列头名称
	private String floorCo2ExpColumn; // 层参数Co2浓度图表导出excel列头名称

	private String areaEctExpColumn; // 区域参数用电量及温度图表导出excel列头名称
	private String areaCo2ExpColumn; // 区域参数Co2浓度图表导出excel列头名称
	/**
	 * 表格视图特殊列名及公共列
	 */
	private String dayColumn; // 日视图特有列列名
	private String equipment_colName; // 公共列列名

	public String getBuildTime() {
		return buildTime;
	}

	public void setBuildTime(String buildTime) {
		this.buildTime = buildTime;
	}

	public String getElectricityChartColor() {
		return electricityChartColor;
	}

	public void setElectricityChartColor(String electricityChartColor) {
		this.electricityChartColor = electricityChartColor;
	}

	public String getRefrigerationChartColor() {
		return refrigerationChartColor;
	}

	public void setRefrigerationChartColor(String refrigerationChartColor) {
		this.refrigerationChartColor = refrigerationChartColor;
	}

	public String getPassengerChartColor() {
		return passengerChartColor;
	}

	public void setPassengerChartColor(String passengerChartColor) {
		this.passengerChartColor = passengerChartColor;
	}

	public String getFloorEctChartColor() {
		return floorEctChartColor;
	}

	public void setFloorEctChartColor(String floorEctChartColor) {
		this.floorEctChartColor = floorEctChartColor;
	}

	public String getFloorCo2ChartColor() {
		return floorCo2ChartColor;
	}

	public void setFloorCo2ChartColor(String floorCo2ChartColor) {
		this.floorCo2ChartColor = floorCo2ChartColor;
	}

	public String getAreaEctChartColor() {
		return areaEctChartColor;
	}

	public void setAreaEctChartColor(String areaEctChartColor) {
		this.areaEctChartColor = areaEctChartColor;
	}

	public String getAreaCo2ChartColor() {
		return areaCo2ChartColor;
	}

	public void setAreaCo2ChartColor(String areaCo2ChartColor) {
		this.areaCo2ChartColor = areaCo2ChartColor;
	}

	public String getElectricityConnectLineWidth() {
		return electricityConnectLineWidth;
	}

	public void setElectricityConnectLineWidth(
			String electricityConnectLineWidth) {
		this.electricityConnectLineWidth = electricityConnectLineWidth;
	}

	public String getRefrigerationConnectLineWidth() {
		return refrigerationConnectLineWidth;
	}

	public void setRefrigerationConnectLineWidth(
			String refrigerationConnectLineWidth) {
		this.refrigerationConnectLineWidth = refrigerationConnectLineWidth;
	}

	public String getPassengerConnectLineWidth() {
		return passengerConnectLineWidth;
	}

	public void setPassengerConnectLineWidth(String passengerConnectLineWidth) {
		this.passengerConnectLineWidth = passengerConnectLineWidth;
	}

	public String getFloorEctConnLine() {
		return floorEctConnLine;
	}

	public void setFloorEctConnLine(String floorEctConnLine) {
		this.floorEctConnLine = floorEctConnLine;
	}

	public String getFloorCo2ConnLine() {
		return floorCo2ConnLine;
	}

	public void setFloorCo2ConnLine(String floorCo2ConnLine) {
		this.floorCo2ConnLine = floorCo2ConnLine;
	}

	public String getAreaEctConnLine() {
		return areaEctConnLine;
	}

	public void setAreaEctConnLine(String areaEctConnLine) {
		this.areaEctConnLine = areaEctConnLine;
	}

	public String getAreaCo2ConnLine() {
		return areaCo2ConnLine;
	}

	public void setAreaCo2ConnLine(String areaCo2ConnLine) {
		this.areaCo2ConnLine = areaCo2ConnLine;
	}

	public String getElectricityChartLegendList() {
		return electricityChartLegendList;
	}

	public void setElectricityChartLegendList(String electricityChartLegendList) {
		this.electricityChartLegendList = electricityChartLegendList;
	}

	public String getRefrigerationChartLegendList() {
		return refrigerationChartLegendList;
	}

	public void setRefrigerationChartLegendList(
			String refrigerationChartLegendList) {
		this.refrigerationChartLegendList = refrigerationChartLegendList;
	}

	public String getPassengerChartLegendList() {
		return passengerChartLegendList;
	}

	public void setPassengerChartLegendList(String passengerChartLegendList) {
		this.passengerChartLegendList = passengerChartLegendList;
	}

	public String getFloorEctLegendList() {
		return floorEctLegendList;
	}

	public void setFloorEctLegendList(String floorEctLegendList) {
		this.floorEctLegendList = floorEctLegendList;
	}

	public String getFloorCo2LegendList() {
		return floorCo2LegendList;
	}

	public void setFloorCo2LegendList(String floorCo2LegendList) {
		this.floorCo2LegendList = floorCo2LegendList;
	}

	public String getAreaEctLegendList() {
		return areaEctLegendList;
	}

	public void setAreaEctLegendList(String areaEctLegendList) {
		this.areaEctLegendList = areaEctLegendList;
	}

	public String getAreaCo2LegendList() {
		return areaCo2LegendList;
	}

	public void setAreaCo2LegendList(String areaCo2LegendList) {
		this.areaCo2LegendList = areaCo2LegendList;
	}

	public String getElectricitySymbolWidth() {
		return electricitySymbolWidth;
	}

	public void setElectricitySymbolWidth(String electricitySymbolWidth) {
		this.electricitySymbolWidth = electricitySymbolWidth;
	}

	public String getRefrigerationSymbolWidth() {
		return refrigerationSymbolWidth;
	}

	public void setRefrigerationSymbolWidth(String refrigerationSymbolWidth) {
		this.refrigerationSymbolWidth = refrigerationSymbolWidth;
	}

	public String getPassengerSymbolWidth() {
		return passengerSymbolWidth;
	}

	public void setPassengerSymbolWidth(String passengerSymbolWidth) {
		this.passengerSymbolWidth = passengerSymbolWidth;
	}

	public String getElectricityLegendColor() {
		return electricityLegendColor;
	}

	public void setElectricityLegendColor(String electricityLegendColor) {
		this.electricityLegendColor = electricityLegendColor;
	}

	public String getRefrigerationLegendColor() {
		return refrigerationLegendColor;
	}

	public void setRefrigerationLegendColor(String refrigerationLegendColor) {
		this.refrigerationLegendColor = refrigerationLegendColor;
	}

	public String getPassengerLegendColor() {
		return passengerLegendColor;
	}

	public void setPassengerLegendColor(String passengerLegendColor) {
		this.passengerLegendColor = passengerLegendColor;
	}

	public String getElectricityChartColorList() {
		return electricityChartColorList;
	}

	public void setElectricityChartColorList(String electricityChartColorList) {
		this.electricityChartColorList = electricityChartColorList;
	}

	public String getRefrigerationChartColorList() {
		return refrigerationChartColorList;
	}

	public void setRefrigerationChartColorList(
			String refrigerationChartColorList) {
		this.refrigerationChartColorList = refrigerationChartColorList;
	}

	public String getPassengerChartColorList() {
		return passengerChartColorList;
	}

	public void setPassengerChartColorList(String passengerChartColorList) {
		this.passengerChartColorList = passengerChartColorList;
	}

	public String getFloorEctColorList() {
		return floorEctColorList;
	}

	public void setFloorEctColorList(String floorEctColorList) {
		this.floorEctColorList = floorEctColorList;
	}

	public String getFloorCo2ColorList() {
		return floorCo2ColorList;
	}

	public void setFloorCo2ColorList(String floorCo2ColorList) {
		this.floorCo2ColorList = floorCo2ColorList;
	}

	public String getAreaEctColorList() {
		return areaEctColorList;
	}

	public void setAreaEctColorList(String areaEctColorList) {
		this.areaEctColorList = areaEctColorList;
	}

	public String getAreaCo2ColorList() {
		return areaCo2ColorList;
	}

	public void setAreaCo2ColorList(String areaCo2ColorList) {
		this.areaCo2ColorList = areaCo2ColorList;
	}

	public String getElectricityDecimals() {
		return electricityDecimals;
	}

	public void setElectricityDecimals(String electricityDecimals) {
		this.electricityDecimals = electricityDecimals;
	}

	public String getRefrigerationDecimals() {
		return refrigerationDecimals;
	}

	public void setRefrigerationDecimals(String refrigerationDecimals) {
		this.refrigerationDecimals = refrigerationDecimals;
	}

	public String getPassengerDecimals() {
		return passengerDecimals;
	}

	public void setPassengerDecimals(String passengerDecimals) {
		this.passengerDecimals = passengerDecimals;
	}

	public String getFloorEctDecimals() {
		return floorEctDecimals;
	}

	public void setFloorEctDecimals(String floorEctDecimals) {
		this.floorEctDecimals = floorEctDecimals;
	}

	public String getFloorCo2Decimals() {
		return floorCo2Decimals;
	}

	public void setFloorCo2Decimals(String floorCo2Decimals) {
		this.floorCo2Decimals = floorCo2Decimals;
	}

	public String getAreaEctDecimals() {
		return areaEctDecimals;
	}

	public void setAreaEctDecimals(String areaEctDecimals) {
		this.areaEctDecimals = areaEctDecimals;
	}

	public String getAreaCo2Decimals() {
		return areaCo2Decimals;
	}

	public void setAreaCo2Decimals(String areaCo2Decimals) {
		this.areaCo2Decimals = areaCo2Decimals;
	}

	public String getElectricityXStep() {
		return electricityXStep;
	}

	public void setElectricityXStep(String electricityXStep) {
		this.electricityXStep = electricityXStep;
	}

	public String getRefrigerationXStep() {
		return refrigerationXStep;
	}

	public void setRefrigerationXStep(String refrigerationXStep) {
		this.refrigerationXStep = refrigerationXStep;
	}

	public String getPassengerXStep() {
		return passengerXStep;
	}

	public void setPassengerXStep(String passengerXStep) {
		this.passengerXStep = passengerXStep;
	}

	public String getFloorEctXStep() {
		return floorEctXStep;
	}

	public void setFloorEctXStep(String floorEctXStep) {
		this.floorEctXStep = floorEctXStep;
	}

	public String getFloorCo2XStep() {
		return floorCo2XStep;
	}

	public void setFloorCo2XStep(String floorCo2XStep) {
		this.floorCo2XStep = floorCo2XStep;
	}

	public String getAreaEctXStep() {
		return areaEctXStep;
	}

	public void setAreaEctXStep(String areaEctXStep) {
		this.areaEctXStep = areaEctXStep;
	}

	public String getAreaCo2XStep() {
		return areaCo2XStep;
	}

	public void setAreaCo2XStep(String areaCo2XStep) {
		this.areaCo2XStep = areaCo2XStep;
	}

	public String getElectricityGridLineStyle() {
		return electricityGridLineStyle;
	}

	public void setElectricityGridLineStyle(String electricityGridLineStyle) {
		this.electricityGridLineStyle = electricityGridLineStyle;
	}

	public String getRefrigerationGridLineStyle() {
		return refrigerationGridLineStyle;
	}

	public void setRefrigerationGridLineStyle(String refrigerationGridLineStyle) {
		this.refrigerationGridLineStyle = refrigerationGridLineStyle;
	}

	public String getPassengerGridLineStyle() {
		return passengerGridLineStyle;
	}

	public void setPassengerGridLineStyle(String passengerGridLineStyle) {
		this.passengerGridLineStyle = passengerGridLineStyle;
	}

	public String getFloorEctGridStyle() {
		return floorEctGridStyle;
	}

	public void setFloorEctGridStyle(String floorEctGridStyle) {
		this.floorEctGridStyle = floorEctGridStyle;
	}

	public String getFloorCo2GridStyle() {
		return floorCo2GridStyle;
	}

	public void setFloorCo2GridStyle(String floorCo2GridStyle) {
		this.floorCo2GridStyle = floorCo2GridStyle;
	}

	public String getAreaEctGridStyle() {
		return areaEctGridStyle;
	}

	public void setAreaEctGridStyle(String areaEctGridStyle) {
		this.areaEctGridStyle = areaEctGridStyle;
	}

	public String getAreaCo2GridStyle() {
		return areaCo2GridStyle;
	}

	public void setAreaCo2GridStyle(String areaCo2GridStyle) {
		this.areaCo2GridStyle = areaCo2GridStyle;
	}

	public String getElectricityGridLineColor() {
		return electricityGridLineColor;
	}

	public void setElectricityGridLineColor(String electricityGridLineColor) {
		this.electricityGridLineColor = electricityGridLineColor;
	}

	public String getRefrigerationGridLineColor() {
		return refrigerationGridLineColor;
	}

	public void setRefrigerationGridLineColor(String refrigerationGridLineColor) {
		this.refrigerationGridLineColor = refrigerationGridLineColor;
	}

	public String getPassengerGridLineColor() {
		return passengerGridLineColor;
	}

	public void setPassengerGridLineColor(String passengerGridLineColor) {
		this.passengerGridLineColor = passengerGridLineColor;
	}

	public String getElectricityChartType1() {
		return electricityChartType1;
	}

	public void setElectricityChartType1(String electricityChartType1) {
		this.electricityChartType1 = electricityChartType1;
	}

	public String getElectricityChartType2() {
		return electricityChartType2;
	}

	public void setElectricityChartType2(String electricityChartType2) {
		this.electricityChartType2 = electricityChartType2;
	}

	public String getRefrigerationChartType1() {
		return refrigerationChartType1;
	}

	public void setRefrigerationChartType1(String refrigerationChartType1) {
		this.refrigerationChartType1 = refrigerationChartType1;
	}

	public String getRefrigerationChartType2() {
		return refrigerationChartType2;
	}

	public void setRefrigerationChartType2(String refrigerationChartType2) {
		this.refrigerationChartType2 = refrigerationChartType2;
	}

	public String getPassengerChartType1() {
		return passengerChartType1;
	}

	public void setPassengerChartType1(String passengerChartType1) {
		this.passengerChartType1 = passengerChartType1;
	}

	public String getPassengerChartType2() {
		return passengerChartType2;
	}

	public void setPassengerChartType2(String passengerChartType2) {
		this.passengerChartType2 = passengerChartType2;
	}

	public String getFloorEctChartType1() {
		return floorEctChartType1;
	}

	public void setFloorEctChartType1(String floorEctChartType1) {
		this.floorEctChartType1 = floorEctChartType1;
	}

	public String getFloorEctChartType2() {
		return floorEctChartType2;
	}

	public void setFloorEctChartType2(String floorEctChartType2) {
		this.floorEctChartType2 = floorEctChartType2;
	}

	public String getFloorCo2ChartType1() {
		return floorCo2ChartType1;
	}

	public void setFloorCo2ChartType1(String floorCo2ChartType1) {
		this.floorCo2ChartType1 = floorCo2ChartType1;
	}

	public String getFloorCo2ChartType2() {
		return floorCo2ChartType2;
	}

	public void setFloorCo2ChartType2(String floorCo2ChartType2) {
		this.floorCo2ChartType2 = floorCo2ChartType2;
	}

	public String getAreaEctChartType1() {
		return areaEctChartType1;
	}

	public void setAreaEctChartType1(String areaEctChartType1) {
		this.areaEctChartType1 = areaEctChartType1;
	}

	public String getAreaEctChartType2() {
		return areaEctChartType2;
	}

	public void setAreaEctChartType2(String areaEctChartType2) {
		this.areaEctChartType2 = areaEctChartType2;
	}

	public String getAreaCo2ChartType1() {
		return areaCo2ChartType1;
	}

	public void setAreaCo2ChartType1(String areaCo2ChartType1) {
		this.areaCo2ChartType1 = areaCo2ChartType1;
	}

	public String getAreaCo2ChartType2() {
		return areaCo2ChartType2;
	}

	public void setAreaCo2ChartType2(String areaCo2ChartType2) {
		this.areaCo2ChartType2 = areaCo2ChartType2;
	}

	public String getElectricityShowX() {
		return electricityShowX;
	}

	public void setElectricityShowX(String electricityShowX) {
		this.electricityShowX = electricityShowX;
	}

	public String getRefrigerationShowX() {
		return refrigerationShowX;
	}

	public void setRefrigerationShowX(String refrigerationShowX) {
		this.refrigerationShowX = refrigerationShowX;
	}

	public String getPassengerShowX() {
		return passengerShowX;
	}

	public void setPassengerShowX(String passengerShowX) {
		this.passengerShowX = passengerShowX;
	}

	public String getFloorEctShowX() {
		return floorEctShowX;
	}

	public void setFloorEctShowX(String floorEctShowX) {
		this.floorEctShowX = floorEctShowX;
	}

	public String getFloorCo2ShowX() {
		return floorCo2ShowX;
	}

	public void setFloorCo2ShowX(String floorCo2ShowX) {
		this.floorCo2ShowX = floorCo2ShowX;
	}

	public String getAreaEctShowX() {
		return areaEctShowX;
	}

	public void setAreaEctShowX(String areaEctShowX) {
		this.areaEctShowX = areaEctShowX;
	}

	public String getAreaCo2ShowX() {
		return areaCo2ShowX;
	}

	public void setAreaCo2ShowX(String areaCo2ShowX) {
		this.areaCo2ShowX = areaCo2ShowX;
	}

	public String getElectricityShowY() {
		return electricityShowY;
	}

	public void setElectricityShowY(String electricityShowY) {
		this.electricityShowY = electricityShowY;
	}

	public String getRefrigerationShowY() {
		return refrigerationShowY;
	}

	public void setRefrigerationShowY(String refrigerationShowY) {
		this.refrigerationShowY = refrigerationShowY;
	}

	public String getPassengerShowY() {
		return passengerShowY;
	}

	public void setPassengerShowY(String passengerShowY) {
		this.passengerShowY = passengerShowY;
	}

	public String getFloorEctShowY() {
		return floorEctShowY;
	}

	public void setFloorEctShowY(String floorEctShowY) {
		this.floorEctShowY = floorEctShowY;
	}

	public String getFloorCo2ShowY() {
		return floorCo2ShowY;
	}

	public void setFloorCo2ShowY(String floorCo2ShowY) {
		this.floorCo2ShowY = floorCo2ShowY;
	}

	public String getAreaEctShowY() {
		return areaEctShowY;
	}

	public void setAreaEctShowY(String areaEctShowY) {
		this.areaEctShowY = areaEctShowY;
	}

	public String getAreaCo2ShowY() {
		return areaCo2ShowY;
	}

	public void setAreaCo2ShowY(String areaCo2ShowY) {
		this.areaCo2ShowY = areaCo2ShowY;
	}

	public String getElectricityYLeftTitle() {
		return electricityYLeftTitle;
	}

	public void setElectricityYLeftTitle(String electricityYLeftTitle) {
		this.electricityYLeftTitle = electricityYLeftTitle;
	}

	public String getRefrigerationYLeftTitle() {
		return refrigerationYLeftTitle;
	}

	public void setRefrigerationYLeftTitle(String refrigerationYLeftTitle) {
		this.refrigerationYLeftTitle = refrigerationYLeftTitle;
	}

	public String getPassengerYLeftTitle() {
		return passengerYLeftTitle;
	}

	public void setPassengerYLeftTitle(String passengerYLeftTitle) {
		this.passengerYLeftTitle = passengerYLeftTitle;
	}

	public String getFloorEctLeftTitle() {
		return floorEctLeftTitle;
	}

	public void setFloorEctLeftTitle(String floorEctLeftTitle) {
		this.floorEctLeftTitle = floorEctLeftTitle;
	}

	public String getFloorCo2LeftTitle() {
		return floorCo2LeftTitle;
	}

	public void setFloorCo2LeftTitle(String floorCo2LeftTitle) {
		this.floorCo2LeftTitle = floorCo2LeftTitle;
	}

	public String getAreaEctLeftTitle() {
		return areaEctLeftTitle;
	}

	public void setAreaEctLeftTitle(String areaEctLeftTitle) {
		this.areaEctLeftTitle = areaEctLeftTitle;
	}

	public String getAreaCo2LeftTitle() {
		return areaCo2LeftTitle;
	}

	public void setAreaCo2LeftTitle(String areaCo2LeftTitle) {
		this.areaCo2LeftTitle = areaCo2LeftTitle;
	}

	public String getElectricityYRightTitle() {
		return electricityYRightTitle;
	}

	public void setElectricityYRightTitle(String electricityYRightTitle) {
		this.electricityYRightTitle = electricityYRightTitle;
	}

	public String getRefrigerationYRightTitle() {
		return refrigerationYRightTitle;
	}

	public void setRefrigerationYRightTitle(String refrigerationYRightTitle) {
		this.refrigerationYRightTitle = refrigerationYRightTitle;
	}

	public String getPassengerYRightTitle() {
		return passengerYRightTitle;
	}

	public void setPassengerYRightTitle(String passengerYRightTitle) {
		this.passengerYRightTitle = passengerYRightTitle;
	}

	public String getFloorEctRightTitle() {
		return floorEctRightTitle;
	}

	public void setFloorEctRightTitle(String floorEctRightTitle) {
		this.floorEctRightTitle = floorEctRightTitle;
	}

	public String getFloorCo2RightTitle() {
		return floorCo2RightTitle;
	}

	public void setFloorCo2RightTitle(String floorCo2RightTitle) {
		this.floorCo2RightTitle = floorCo2RightTitle;
	}

	public String getAreaEctRightTitle() {
		return areaEctRightTitle;
	}

	public void setAreaEctRightTitle(String areaEctRightTitle) {
		this.areaEctRightTitle = areaEctRightTitle;
	}

	public String getAreaCo2RightTitle() {
		return areaCo2RightTitle;
	}

	public void setAreaCo2RightTitle(String areaCo2RightTitle) {
		this.areaCo2RightTitle = areaCo2RightTitle;
	}

	public String getElectricityLeftColor() {
		return electricityLeftColor;
	}

	public void setElectricityLeftColor(String electricityLeftColor) {
		this.electricityLeftColor = electricityLeftColor;
	}

	public String getRefrigerationLeftColor() {
		return refrigerationLeftColor;
	}

	public void setRefrigerationLeftColor(String refrigerationLeftColor) {
		this.refrigerationLeftColor = refrigerationLeftColor;
	}

	public String getPassengerLeftColor() {
		return passengerLeftColor;
	}

	public void setPassengerLeftColor(String passengerLeftColor) {
		this.passengerLeftColor = passengerLeftColor;
	}

	public String getElectricityRightColor() {
		return electricityRightColor;
	}

	public void setElectricityRightColor(String electricityRightColor) {
		this.electricityRightColor = electricityRightColor;
	}

	public String getRefrigerationRightColor() {
		return refrigerationRightColor;
	}

	public void setRefrigerationRightColor(String refrigerationRightColor) {
		this.refrigerationRightColor = refrigerationRightColor;
	}

	public String getPassengerRightColor() {
		return passengerRightColor;
	}

	public void setPassengerRightColor(String passengerRightColor) {
		this.passengerRightColor = passengerRightColor;
	}

	public String getElectricityYSymbol() {
		return electricityYSymbol;
	}

	public void setElectricityYSymbol(String electricityYSymbol) {
		this.electricityYSymbol = electricityYSymbol;
	}

	public String getRefrigerationYSymbol() {
		return refrigerationYSymbol;
	}

	public void setRefrigerationYSymbol(String refrigerationYSymbol) {
		this.refrigerationYSymbol = refrigerationYSymbol;
	}

	public String getPassengerYSymbol() {
		return passengerYSymbol;
	}

	public void setPassengerYSymbol(String passengerYSymbol) {
		this.passengerYSymbol = passengerYSymbol;
	}

	public String getFloorEctYSymbol() {
		return floorEctYSymbol;
	}

	public void setFloorEctYSymbol(String floorEctYSymbol) {
		this.floorEctYSymbol = floorEctYSymbol;
	}

	public String getFloorCo2YSymbol() {
		return floorCo2YSymbol;
	}

	public void setFloorCo2YSymbol(String floorCo2YSymbol) {
		this.floorCo2YSymbol = floorCo2YSymbol;
	}

	public String getAreaEctYSymbol() {
		return areaEctYSymbol;
	}

	public void setAreaEctYSymbol(String areaEctYSymbol) {
		this.areaEctYSymbol = areaEctYSymbol;
	}

	public String getAreaCo2YSymbol() {
		return areaCo2YSymbol;
	}

	public void setAreaCo2YSymbol(String areaCo2YSymbol) {
		this.areaCo2YSymbol = areaCo2YSymbol;
	}

	public String getElectricityYWidth() {
		return electricityYWidth;
	}

	public void setElectricityYWidth(String electricityYWidth) {
		this.electricityYWidth = electricityYWidth;
	}

	public String getRefrigerationYWidth() {
		return refrigerationYWidth;
	}

	public void setRefrigerationYWidth(String refrigerationYWidth) {
		this.refrigerationYWidth = refrigerationYWidth;
	}

	public String getPassengerYWidth() {
		return passengerYWidth;
	}

	public void setPassengerYWidth(String passengerYWidth) {
		this.passengerYWidth = passengerYWidth;
	}

	public String getElectricityXLabelColor() {
		return electricityXLabelColor;
	}

	public void setElectricityXLabelColor(String electricityXLabelColor) {
		this.electricityXLabelColor = electricityXLabelColor;
	}

	public String getRefrigerationXLabelColor() {
		return refrigerationXLabelColor;
	}

	public void setRefrigerationXLabelColor(String refrigerationXLabelColor) {
		this.refrigerationXLabelColor = refrigerationXLabelColor;
	}

	public String getPassengerXLabelColor() {
		return passengerXLabelColor;
	}

	public void setPassengerXLabelColor(String passengerXLabelColor) {
		this.passengerXLabelColor = passengerXLabelColor;
	}

	public String getElectricityYLabelColor() {
		return electricityYLabelColor;
	}

	public void setElectricityYLabelColor(String electricityYLabelColor) {
		this.electricityYLabelColor = electricityYLabelColor;
	}

	public String getRefrigerationYLabelColor() {
		return refrigerationYLabelColor;
	}

	public void setRefrigerationYLabelColor(String refrigerationYLabelColor) {
		this.refrigerationYLabelColor = refrigerationYLabelColor;
	}

	public String getPassengerYLabelColor() {
		return passengerYLabelColor;
	}

	public void setPassengerYLabelColor(String passengerYLabelColor) {
		this.passengerYLabelColor = passengerYLabelColor;
	}

	public String getElectricityYColor() {
		return electricityYColor;
	}

	public void setElectricityYColor(String electricityYColor) {
		this.electricityYColor = electricityYColor;
	}

	public String getRefrigerationYColor() {
		return refrigerationYColor;
	}

	public void setRefrigerationYColor(String refrigerationYColor) {
		this.refrigerationYColor = refrigerationYColor;
	}

	public String getPassengerYColor() {
		return passengerYColor;
	}

	public void setPassengerYColor(String passengerYColor) {
		this.passengerYColor = passengerYColor;
	}

	public String getElectricityXColor() {
		return electricityXColor;
	}

	public void setElectricityXColor(String electricityXColor) {
		this.electricityXColor = electricityXColor;
	}

	public String getRefrigerationXColor() {
		return refrigerationXColor;
	}

	public void setRefrigerationXColor(String refrigerationXColor) {
		this.refrigerationXColor = refrigerationXColor;
	}

	public String getPassengerXColor() {
		return passengerXColor;
	}

	public void setPassengerXColor(String passengerXColor) {
		this.passengerXColor = passengerXColor;
	}

	public String getElectricityRadiusList() {
		return electricityRadiusList;
	}

	public void setElectricityRadiusList(String electricityRadiusList) {
		this.electricityRadiusList = electricityRadiusList;
	}

	public String getRefrigerationRadiusList() {
		return refrigerationRadiusList;
	}

	public void setRefrigerationRadiusList(String refrigerationRadiusList) {
		this.refrigerationRadiusList = refrigerationRadiusList;
	}

	public String getPassengerRadiusList() {
		return passengerRadiusList;
	}

	public void setPassengerRadiusList(String passengerRadiusList) {
		this.passengerRadiusList = passengerRadiusList;
	}

	public String getFloorEctRadius() {
		return floorEctRadius;
	}

	public void setFloorEctRadius(String floorEctRadius) {
		this.floorEctRadius = floorEctRadius;
	}

	public String getFloorCo2Radius() {
		return floorCo2Radius;
	}

	public void setFloorCo2Radius(String floorCo2Radius) {
		this.floorCo2Radius = floorCo2Radius;
	}

	public String getAreaEctRadius() {
		return areaEctRadius;
	}

	public void setAreaEctRadius(String areaEctRadius) {
		this.areaEctRadius = areaEctRadius;
	}

	public String getAreaCo2Radius() {
		return areaCo2Radius;
	}

	public void setAreaCo2Radius(String areaCo2Radius) {
		this.areaCo2Radius = areaCo2Radius;
	}

	public String getElectricitySymbol() {
		return electricitySymbol;
	}

	public void setElectricitySymbol(String electricitySymbol) {
		this.electricitySymbol = electricitySymbol;
	}

	public String getRefrigerationSymbol() {
		return refrigerationSymbol;
	}

	public void setRefrigerationSymbol(String refrigerationSymbol) {
		this.refrigerationSymbol = refrigerationSymbol;
	}

	public String getPassengerSymbol() {
		return passengerSymbol;
	}

	public void setPassengerSymbol(String passengerSymbol) {
		this.passengerSymbol = passengerSymbol;
	}

	public String getFloorEctSymbol() {
		return floorEctSymbol;
	}

	public void setFloorEctSymbol(String floorEctSymbol) {
		this.floorEctSymbol = floorEctSymbol;
	}

	public String getFloorCo2Symbol() {
		return floorCo2Symbol;
	}

	public void setFloorCo2Symbol(String floorCo2Symbol) {
		this.floorCo2Symbol = floorCo2Symbol;
	}

	public String getAreaEctSymbol() {
		return areaEctSymbol;
	}

	public void setAreaEctSymbol(String areaEctSymbol) {
		this.areaEctSymbol = areaEctSymbol;
	}

	public String getAreaCo2Symbol() {
		return areaCo2Symbol;
	}

	public void setAreaCo2Symbol(String areaCo2Symbol) {
		this.areaCo2Symbol = areaCo2Symbol;
	}

	public String getElectricityYAxisList() {
		return electricityYAxisList;
	}

	public void setElectricityYAxisList(String electricityYAxisList) {
		this.electricityYAxisList = electricityYAxisList;
	}

	public String getRefrigerationYAxisList() {
		return refrigerationYAxisList;
	}

	public void setRefrigerationYAxisList(String refrigerationYAxisList) {
		this.refrigerationYAxisList = refrigerationYAxisList;
	}

	public String getPassengerYAxisList() {
		return passengerYAxisList;
	}

	public void setPassengerYAxisList(String passengerYAxisList) {
		this.passengerYAxisList = passengerYAxisList;
	}

	public String getFloorEctYAxis() {
		return floorEctYAxis;
	}

	public void setFloorEctYAxis(String floorEctYAxis) {
		this.floorEctYAxis = floorEctYAxis;
	}

	public String getFloorCo2YAxis() {
		return floorCo2YAxis;
	}

	public void setFloorCo2YAxis(String floorCo2YAxis) {
		this.floorCo2YAxis = floorCo2YAxis;
	}

	public String getAreaEctYAxis() {
		return areaEctYAxis;
	}

	public void setAreaEctYAxis(String areaEctYAxis) {
		this.areaEctYAxis = areaEctYAxis;
	}

	public String getAreaCo2YAxis() {
		return areaCo2YAxis;
	}

	public void setAreaCo2YAxis(String areaCo2YAxis) {
		this.areaCo2YAxis = areaCo2YAxis;
	}

	public String getElectricityFillColorList() {
		return electricityFillColorList;
	}

	public void setElectricityFillColorList(String electricityFillColorList) {
		this.electricityFillColorList = electricityFillColorList;
	}

	public String getRefrigerationFillColorList() {
		return refrigerationFillColorList;
	}

	public void setRefrigerationFillColorList(String refrigerationFillColorList) {
		this.refrigerationFillColorList = refrigerationFillColorList;
	}

	public String getPassengerFillColorList() {
		return passengerFillColorList;
	}

	public void setPassengerFillColorList(String passengerFillColorList) {
		this.passengerFillColorList = passengerFillColorList;
	}

	public String getFloorEctFillColor() {
		return floorEctFillColor;
	}

	public void setFloorEctFillColor(String floorEctFillColor) {
		this.floorEctFillColor = floorEctFillColor;
	}

	public String getFloorCo2FillColor() {
		return floorCo2FillColor;
	}

	public void setFloorCo2FillColor(String floorCo2FillColor) {
		this.floorCo2FillColor = floorCo2FillColor;
	}

	public String getAreaEctFillColor() {
		return areaEctFillColor;
	}

	public void setAreaEctFillColor(String areaEctFillColor) {
		this.areaEctFillColor = areaEctFillColor;
	}

	public String getAreaCo2FillColor() {
		return areaCo2FillColor;
	}

	public void setAreaCo2FillColor(String areaCo2FillColor) {
		this.areaCo2FillColor = areaCo2FillColor;
	}

	public String getElectricityLineWidth() {
		return electricityLineWidth;
	}

	public void setElectricityLineWidth(String electricityLineWidth) {
		this.electricityLineWidth = electricityLineWidth;
	}

	public String getRefrigerationLineWidth() {
		return refrigerationLineWidth;
	}

	public void setRefrigerationLineWidth(String refrigerationLineWidth) {
		this.refrigerationLineWidth = refrigerationLineWidth;
	}

	public String getPassengerLineWidth() {
		return passengerLineWidth;
	}

	public void setPassengerLineWidth(String passengerLineWidth) {
		this.passengerLineWidth = passengerLineWidth;
	}

	public String getFloorEctLineWidth() {
		return floorEctLineWidth;
	}

	public void setFloorEctLineWidth(String floorEctLineWidth) {
		this.floorEctLineWidth = floorEctLineWidth;
	}

	public String getFloorCo2LineWidth() {
		return floorCo2LineWidth;
	}

	public void setFloorCo2LineWidth(String floorCo2LineWidth) {
		this.floorCo2LineWidth = floorCo2LineWidth;
	}

	public String getAreaEctLineWidth() {
		return areaEctLineWidth;
	}

	public void setAreaEctLineWidth(String areaEctLineWidth) {
		this.areaEctLineWidth = areaEctLineWidth;
	}

	public String getAreaCo2LineWidth() {
		return areaCo2LineWidth;
	}

	public void setAreaCo2LineWidth(String areaCo2LineWidth) {
		this.areaCo2LineWidth = areaCo2LineWidth;
	}

	public String getElectricityExpColumnName() {
		return electricityExpColumnName;
	}

	public void setElectricityExpColumnName(String electricityExpColumnName) {
		this.electricityExpColumnName = electricityExpColumnName;
	}

	public String getRefrigerationExpColumnName() {
		return refrigerationExpColumnName;
	}

	public void setRefrigerationExpColumnName(String refrigerationExpColumnName) {
		this.refrigerationExpColumnName = refrigerationExpColumnName;
	}

	public String getPassengerExpColumnName() {
		return passengerExpColumnName;
	}

	public void setPassengerExpColumnName(String passengerExpColumnName) {
		this.passengerExpColumnName = passengerExpColumnName;
	}

	public String getFloorEctExpColumn() {
		return floorEctExpColumn;
	}

	public void setFloorEctExpColumn(String floorEctExpColumn) {
		this.floorEctExpColumn = floorEctExpColumn;
	}

	public String getFloorCo2ExpColumn() {
		return floorCo2ExpColumn;
	}

	public void setFloorCo2ExpColumn(String floorCo2ExpColumn) {
		this.floorCo2ExpColumn = floorCo2ExpColumn;
	}

	public String getAreaEctExpColumn() {
		return areaEctExpColumn;
	}

	public void setAreaEctExpColumn(String areaEctExpColumn) {
		this.areaEctExpColumn = areaEctExpColumn;
	}

	public String getAreaCo2ExpColumn() {
		return areaCo2ExpColumn;
	}

	public void setAreaCo2ExpColumn(String areaCo2ExpColumn) {
		this.areaCo2ExpColumn = areaCo2ExpColumn;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getDayColumn() {
		return dayColumn;
	}

	public void setDayColumn(String dayColumn) {
		this.dayColumn = dayColumn;
	}

	public String getEquipment_colName() {
		return equipment_colName;
	}

	public void setEquipment_colName(String equipment_colName) {
		this.equipment_colName = equipment_colName;
	}

	public String getIsShowPlan() {
		return isShowPlan;
	}

	public void setIsShowPlan(String isShowPlan) {
		this.isShowPlan = isShowPlan;
	}

	public String getF_params_repeat() {
		return f_params_repeat;
	}

	public void setF_params_repeat(String f_params_repeat) {
		this.f_params_repeat = f_params_repeat;
	}

	public String getIsShowRegion() {
		return isShowRegion;
	}

	public void setIsShowRegion(String isShowRegion) {
		this.isShowRegion = isShowRegion;
	}

	public String getIsShowPassenger() {
		return isShowPassenger;
	}

	public void setIsShowPassenger(String isShowPassenger) {
		this.isShowPassenger = isShowPassenger;
	}

	public String getIsShowCo2() {
		return isShowCo2;
	}

	public void setIsShowCo2(String isShowCo2) {
		this.isShowCo2 = isShowCo2;
	}
}
