package com.managementsystem.energy.portlet.chart.model;

import java.math.BigDecimal;

/**
 * 图表设置
 * */
public class Chartsetting extends BaseEntity {

	private static final long serialVersionUID = 1L;

	private int comparisontype;

	/**
	 * 比较图表
	 * */
	private String compareCharttype;

	/**
	 * 建筑WebService Url 如: http://192.168.1.50:8080
	 * */
	private String settingWsUrl;

	/**
	 * 显示查询表单
	 * */
	private boolean showQuery;


	/**
	 * 分析方法分类,按分类分项:1 按支路拓扑:2 按建筑区域:3
	 * */
	private int analyMethod;


	/**
	 * 图表类型
	 * */
	private String chartType;

	/**
	 * X轴标题 X-Axis Title of the Chart.
	 * */
	private String xaxisname;

	/**
	 * Y轴标题
	 * */
	private String yaxisname;

	/**
	 * Y轴使用主标题
	 * */
	private boolean usePyaxisname;

	/**
	 * Y轴主标题 (Primary Y-Axis title)
	 * */
	private String pyaxisname;

	/**
	 * Y轴二级标题 (Secondary y-axis title)
	 * */
	private String syaxisname;

	/**
	 * 是否显示数值
	 * */
	private int showValues = 0;

	/**
	 * 选择调色板序号(FusionCharts offers 5 palettes for you to choose from, Palette 1
	 * is the default chart palette used)
	 * 
	 * 
	 * @see http 
	 *      ://docs.fusioncharts.com/charts/contents/AttDesc/ChartPalettes.html
	 * */
	private String palette;

	/**
	 * 自定义调色板颜色,如 FF5904,0372AB,FF0000
	 * */
	private String paletteColors;

	/**
	 * 小数位数,取值范围(0-10) 例如:"decimals":"0"
	 * <p>
	 * Number of decimal places to which all numbers on the chart will be
	 * rounded to. For more details, please see <a href=
	 * "docs.fusioncharts.com/charts/contents/advanced/number-format/Number_Basics.html"
	 * >decimal</a>
	 * </p>
	 * */
	private int decimals;

	/**
	 * This configuration determines whether the numbers displayed on the chart
	 * will be formatted using commas, e.g., 40,000 if formatNumber='1' and
	 * 40000 if formatNumber= '0'. For more details, please see Advanced
	 * Charting > Number Formatting > Basics page.
	 * */
	private int formatNumber = 0;

	/**
	 * Configuration whether to add K (thousands) and M (millions) to a number
	 * after truncating and rounding it - e.g., if formatNumberScale is set to
	 * 1, 1043 will become 1.04K (with decimals set to 2 places). Same with
	 * numbers in millions - an M will be added at the end. For more details,
	 * please see Advanced Charting > Number Formatting > Number Scaling page.
	 * */
	private int formatNumberScale = 0;

	/**
	 * 数字前缀,如 $10
	 * */
	private String numberprefix;

	/**
	 * 数字后缀,如 0M
	 * */
	private String numbersuffix;

	/**
	 * X轴最大值
	 * */
	private String xaxismaxvalue;
	/**
	 * X轴最小值
	 * */
	private String xaxisminvalue;

	/**
	 * Y轴最大值
	 * */
	private String yaxismaxvalue;

	/**o
	 * 图表宽度
	 * */
	private Integer width;

	/**
	 * 图表高度
	 * */
	private Integer height;

	/**
	 * 启用调试模式
	 * */
	private boolean debugMode;

	/**
	 * 数据格式
	 * */
	private String dataFormat;

	/**
	 * 能源名称
	 * */
	private String energyName;

	/**
	 * 数据来源
	 * */
	private String dataSource;

	/**
	 * 数据内容
	 * */
	private String dataContent;

	/**
	 * 设置图表背景图片
	 * */
	private String bgImage;

	/**
	 * 设置背景图片透明度
	 * */
	private int bgImageAlpha;

	/**
	 * 设置背景图片缩放比例 <br />
	 * The value of this attribute can be anything between 0-300. The default
	 * value of the attribute is 100. Any value less than 100 will reduce the
	 * size of the background image and any value more than 100 will increase
	 * the size of the background image.
	 * */
	private int scale;

	/**
	 * 设置图表背景水平对齐方式(left, middle, right) <br />
	 * The default value of attributes are bgImageVAlign='top'
	 * */
	private String bgImageHAlign;

	/**
	 * 设置图表背景垂直对齐方式 (top, middle, bottom) <br />
	 * The default value of attributes are bgImageVALign='top'
	 * */
	private String bgImageVAlign;

	/**
	 * 设置背景图片显示模式 <br />
	 * The values of this attribute are none, center, stretch, tile, fit and
	 * fill. By default, the value of the attribute is set to none
	 * */
	private String bgImageDisplayMode;

	/**
	 * 是否显示报表 默认为不显示
	 * */
	private boolean displayReport = false;

	private Integer linkedchart;
	private String oneleveltitle;
	private String twoleveltitle;
	private String linkedcharttype;

	// 趋势线

	// Whether the trend will display a line, or a zone (filled colored
	// rectangle).Range:0/1
	private int isTrendZone = 0;

	// The starting value for the trendline. Say, if you want to plot a slanted
	// trendline from value 102 to 109, the startValue will be 102.
	private String startValue = "";

	// The ending y-axis value for the trendline. Say, if you want to plot a
	// slanted trendline from value 102 to 109, the endValue will be 109. If you
	// do not specify a value for endValue, it will automatically assume the
	// same value as startValue.
	private String endValue = "";

	// If you want to display a string caption for the trend line by its side,
	// you can use this attribute. Example: displayValue='Last Month High'. When
	// you don't supply this attribute, it automatically takes the value of
	// startValue.
	private String displayValue = "";

	// Color of the trend line and its associated text.
	private String color = "";

	// Whether the trend line/zone will be displayed over data plots or under
	// them. Range:0/1
	private int showOnTop;

	// If you've opted to show the trend as a line, this attribute lets you
	// define the thickness of trend line. Range:In Pixels
	private String thickness;

	// Alpha of the trend line. Range:0-100
	private String alpha;

	// If you've opted to show the trend as a line, this attribute lets you
	// define whether the trend line will appear as dashed. Range:0/1
	private String dashed;

	// If you've opted to show trend line as dash, this attribute lets you
	// control the length of each dash. Range:In Pixels
	private String dashLen;

	// If you've opted to show trend line as dash, this attribute lets you
	// control the length of each dash gap. Range:In Pixels
	private String dashGap;

	// Whether to show the trend line value on left side or right side of chart.
	// This is particularly useful when the trend line display values on the
	// chart are colliding with divisional lines values on the chart. Range: 0/1
	private int valueOnRight = 0;

	// Custom tool-text for this trendline/zone.
	private String toolText = "";

	// This attribute lets you set whether the data labels will show up as
	// rotated labels on the chart.
	private int rotateLabels = 0;

	// Using this attribute, you can customize the alignment of data labels
	// (x-axis labels).
	// There are 5 options: AUTO, WRAP, STAGGER, ROTATE or NONE.
	// By default, this attribute is set to AUTO mode which means that the
	// alignment of the data labels
	// is determined automatically depending on the size of the chart.
	// WRAP wraps the label text if it is too long to fit in one line.
	// ROTATE rotates the labels vertically. STAGGER divides the labels into
	// multiple lines.
	private String labelDisplay;

	// If you've opted to show rotated labels on chart,
	// this attribute lets you set the configuration whether the labels will
	// show as slanted labels or fully vertical ones.
	private int slantLabels = 0;

	// 能耗转换系数
	private BigDecimal energyRate = new BigDecimal(1);
	// 转换系统类型
	private int rateType = 0;

	public int getIsTrendZone() {
		return isTrendZone;
	}

	public void setIsTrendZone(int isTrendZone) {
		this.isTrendZone = isTrendZone;
	}

	public String getStartValue() {
		return startValue;
	}

	public void setStartValue(String startValue) {
		this.startValue = startValue;
	}

	public String getEndValue() {
		return endValue;
	}

	public void setEndValue(String endValue) {
		this.endValue = endValue;
	}

	public String getDisplayValue() {
		return displayValue;
	}

	public void setDisplayValue(String displayValue) {
		this.displayValue = displayValue;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getShowOnTop() {
		return showOnTop;
	}

	public void setShowOnTop(int showOnTop) {
		this.showOnTop = showOnTop;
	}

	public String getThickness() {
		return thickness;
	}

	public void setThickness(String thickness) {
		this.thickness = thickness;
	}

	public String getAlpha() {
		return alpha;
	}

	public void setAlpha(String alpha) {
		this.alpha = alpha;
	}

	public String getDashed() {
		return dashed;
	}

	public void setDashed(String dashed) {
		this.dashed = dashed;
	}

	public String getDashLen() {
		return dashLen;
	}

	public void setDashLen(String dashLen) {
		this.dashLen = dashLen;
	}

	public String getDashGap() {
		return dashGap;
	}

	public void setDashGap(String dashGap) {
		this.dashGap = dashGap;
	}

	public int getValueOnRight() {
		return valueOnRight;
	}

	public void setValueOnRight(int valueOnRight) {
		this.valueOnRight = valueOnRight;
	}

	public String getToolText() {
		return toolText;
	}

	public void setToolText(String toolText) {
		this.toolText = toolText;
	}

	/**
	 * 对比类型 0=不对比 1=环比 2同比 3环比和同比
	 * */
	public int getComparisontype() {
		return comparisontype;
	}

	public String getCompareCharttype() {
		return compareCharttype;
	}

	public void setCompareCharttype(String compareCharttype) {
		this.compareCharttype = compareCharttype;
	}

	public void setComparisontype(int comparisontype) {
		this.comparisontype = comparisontype;
	}

	public String getSettingWsUrl() {
		return settingWsUrl;
	}

	public void setSettingWsUrl(String settingWsUrl) {
		this.settingWsUrl = settingWsUrl;
	}

	public boolean isShowQuery() {
		return showQuery;
	}

	public void setShowQuery(boolean showQuery) {
		this.showQuery = showQuery;
	}



	public int getAnalyMethod() {
		return analyMethod;
	}

	public void setAnalyMethod(int analyMethod) {
		this.analyMethod = analyMethod;
	}

	

	public String getChartType() {
		return chartType;
	}

	public void setChartType(String chartType) {
		this.chartType = chartType;
	}

	public String getXaxisname() {
		return xaxisname;
	}

	public void setXaxisname(String xaxisname) {
		this.xaxisname = xaxisname;
	}

	public String getYaxisname() {
		return yaxisname;
	}

	public void setYaxisname(String yaxisname) {
		this.yaxisname = yaxisname;
	}

	public boolean isUsePyaxisname() {
		return usePyaxisname;
	}

	public void setUsePyaxisname(boolean usePyaxisname) {
		this.usePyaxisname = usePyaxisname;
	}

	public String getPyaxisname() {
		return pyaxisname;
	}

	public void setPyaxisname(String pyaxisname) {
		this.pyaxisname = pyaxisname;
	}

	public String getSyaxisname() {
		return syaxisname;
	}

	public void setSyaxisname(String syaxisname) {
		this.syaxisname = syaxisname;
	}

	public int getShowValues() {
		return showValues;
	}

	public void setShowValues(int showValues) {
		this.showValues = showValues;
	}

	public String getPalette() {
		return palette;
	}

	public void setPalette(String palette) {
		this.palette = palette;
	}

	public String getPaletteColors() {
		return paletteColors;
	}

	public void setPaletteColors(String paletteColors) {
		this.paletteColors = paletteColors;
	}

	public int getDecimals() {
		return decimals;
	}

	public void setDecimals(int decimals) {
		this.decimals = decimals;
	}

	public int getFormatNumber() {
		return formatNumber;
	}

	public void setFormatNumber(int formatNumber) {
		this.formatNumber = formatNumber;
	}

	public int getFormatNumberScale() {
		return formatNumberScale;
	}

	public void setFormatNumberScale(int formatNumberScale) {
		this.formatNumberScale = formatNumberScale;
	}

	public String getNumberprefix() {
		return numberprefix;
	}

	public void setNumberprefix(String numberprefix) {
		this.numberprefix = numberprefix;
	}

	public String getNumbersuffix() {
		return numbersuffix;
	}

	public void setNumbersuffix(String numbersuffix) {
		this.numbersuffix = numbersuffix;
	}

	public String getXaxismaxvalue() {
		return xaxismaxvalue;
	}

	public void setXaxismaxvalue(String xaxismaxvalue) {
		this.xaxismaxvalue = xaxismaxvalue;
	}

	public String getXaxisminvalue() {
		return xaxisminvalue;
	}

	public void setXaxisminvalue(String xaxisminvalue) {
		this.xaxisminvalue = xaxisminvalue;
	}

	public String getYaxismaxvalue() {
		return yaxismaxvalue;
	}

	public void setYaxismaxvalue(String yaxismaxvalue) {
		this.yaxismaxvalue = yaxismaxvalue;
	}

	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public boolean isDebugMode() {
		return debugMode;
	}

	public void setDebugMode(boolean debugMode) {
		this.debugMode = debugMode;
	}

	public String getDataFormat() {
		return dataFormat;
	}

	public void setDataFormat(String dataFormat) {
		this.dataFormat = dataFormat;
	}

	public String getEnergyName() {
		return energyName;
	}

	public void setEnergyName(String energyName) {
		this.energyName = energyName;
	}

	public String getDataSource() {
		return dataSource;
	}

	/**
	 * 设置自定义图表数据
	 * 
	 * @param dataSource
	 *            自定义图表数据(XML或JSON格式)
	 * */
	public void setDataSource(String dataSource) {
		this.dataSource = dataSource;
	}

	public String getBgImage() {
		return bgImage;
	}

	public void setBgImage(String bgImage) {
		this.bgImage = bgImage;
	}

	public int getBgImageAlpha() {
		return bgImageAlpha;
	}

	public void setBgImageAlpha(int bgImageAlpha) {
		this.bgImageAlpha = bgImageAlpha;
	}

	public int getScale() {
		return scale;
	}

	public void setScale(int scale) {
		this.scale = scale;
	}

	public String getBgImageHAlign() {
		return bgImageHAlign;
	}

	public void setBgImageHAlign(String bgImageHAlign) {
		this.bgImageHAlign = bgImageHAlign;
	}

	public String getBgImageVAlign() {
		return bgImageVAlign;
	}

	public void setBgImageVAlign(String bgImageVAlign) {
		this.bgImageVAlign = bgImageVAlign;
	}

	public String getBgImageDisplayMode() {
		return bgImageDisplayMode;
	}

	public void setBgImageDisplayMode(String bgImageDisplayMode) {
		this.bgImageDisplayMode = bgImageDisplayMode;
	}

	public boolean isDisplayReport() {
		return displayReport;
	}

	public void setDisplayReport(boolean displayReport) {
		this.displayReport = displayReport;
	}

	/**
	 * LinkedCharts Type
	 * */
	public Integer getLinkedchart() {
		return linkedchart;
	}

	public void setLinkedchart(Integer linkedchart) {
		this.linkedchart = linkedchart;
	}

	/**
	 * One Level LinkedChart Title
	 * */
	public String getOneleveltitle() {
		return oneleveltitle;
	}

	public void setOneleveltitle(String oneleveltitle) {
		this.oneleveltitle = oneleveltitle;
	}

	/**
	 * Two Level LinkedChart title
	 * */
	public String getTwoleveltitle() {
		return twoleveltitle;
	}

	public void setTwoleveltitle(String twoleveltitle) {
		this.twoleveltitle = twoleveltitle;
	}

	/**
	 * LinkedChart ChartType
	 * */
	public String getLinkedcharttype() {
		return linkedcharttype;
	}

	public void setLinkedcharttype(String linkedcharttype) {
		this.linkedcharttype = linkedcharttype;
	}

	public int getRotateLabels() {
		return rotateLabels;
	}

	public void setRotateLabels(int rotateLabels) {
		this.rotateLabels = rotateLabels;
	}

	public String getLabelDisplay() {
		return labelDisplay;
	}

	public void setLabelDisplay(String labelDisplay) {
		this.labelDisplay = labelDisplay;
	}

	public int getSlantLabels() {
		return slantLabels;
	}

	public void setSlantLabels(int slantLabels) {
		this.slantLabels = slantLabels;
	}

	public String getDataContent() {
		return dataContent;
	}

	public void setDataContent(String dataContent) {
		this.dataContent = dataContent;
	}

	public BigDecimal getEnergyRate() {
		return energyRate;
	}
	public void setEnergyRate(BigDecimal energyRate) {
		this.energyRate = energyRate;
	}

	public int getRateType() {
		return rateType;
	}

	public void setRateType(int rateType) {
		this.rateType = rateType;
	}

}
