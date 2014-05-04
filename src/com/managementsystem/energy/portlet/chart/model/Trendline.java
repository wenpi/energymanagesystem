package com.managementsystem.energy.portlet.chart.model;

public class Trendline {

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
	private String color = "00cc00";

	// Whether the trend line/zone will be displayed over data plots or under
	// them. Range:0/1
	private int showOnTop;

	// If you've opted to show the trend as a line, this attribute lets you
	// define the thickness of trend line. Range:In Pixels
	private int thickness;

	// Alpha of the trend line. Range:0-100
	private int alpha;

	// If you've opted to show the trend as a line, this attribute lets you
	// define whether the trend line will appear as dashed. Range:0/1
	private boolean dashed;

	// If you've opted to show trend line as dash, this attribute lets you
	// control the length of each dash. Range:In Pixels
	private int dashLen;

	// If you've opted to show trend line as dash, this attribute lets you
	// control the length of each dash gap. Range:In Pixels
	private int dashGap;

	// Whether to show the trend line value on left side or right side of chart.
	// This is particularly useful when the trend line display values on the
	// chart are colliding with divisional lines values on the chart. Range: 0/1
	private int valueOnRight;

	// Custom tool-text for this trendline/zone.
	private String toolText = "";

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

	public int getThickness() {
		return thickness;
	}

	public void setThickness(int thickness) {
		this.thickness = thickness;
	}

	public int getAlpha() {
		return alpha;
	}

	public void setAlpha(int alpha) {
		this.alpha = alpha;
	}

	public boolean isDashed() {
		return dashed;
	}

	public void setDashed(boolean dashed) {
		this.dashed = dashed;
	}

	public int getDashLen() {
		return dashLen;
	}

	public void setDashLen(int dashLen) {
		this.dashLen = dashLen;
	}

	public int getDashGap() {
		return dashGap;
	}

	public void setDashGap(int dashGap) {
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

}
