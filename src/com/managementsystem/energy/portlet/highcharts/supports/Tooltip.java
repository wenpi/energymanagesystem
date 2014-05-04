package com.managementsystem.energy.portlet.highcharts.supports;

public class Tooltip {
	public String valueSuffix;
	public Boolean shared;
	public Boolean crosshairs;
	
	public Boolean enabled;
	public String formatter;
	public String backgroundColor;
	public String borderColor;
	public Integer borderRadius;
	public Boolean shadow;
	public String style;
	
	public String headerFormat;
	public String pointFormat;
	//
	
	public Tooltip() {
		 
	}
	public Tooltip(Boolean shared) {
		this.shared=shared;
	}
	
	
	
	public String getHeaderFormat() {
		return headerFormat;
	}
	public void setHeaderFormat(String headerFormat) {
		this.headerFormat = headerFormat;
	}
	public String getPointFormat() {
		return pointFormat;
	}
	public void setPointFormat(String pointFormat) {
		this.pointFormat = pointFormat;
	}
	public Boolean getShared() {
		return shared;
	}
	public Boolean getCrosshairs() {
		return crosshairs;
	}
	public Boolean getEnabled() {
		return enabled;
	}
	public Boolean getShadow() {
		return shadow;
	}
	public String getValueSuffix() {
		return valueSuffix;
	}
	public void setValueSuffix(String valueSuffix) {
		this.valueSuffix = valueSuffix;
	}
 
	public void setShared(Boolean shared) {
		this.shared = shared;
	}
 
	public void setCrosshairs(Boolean crosshairs) {
		this.crosshairs = crosshairs;
	}
 
	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	public String getFormatter() {
		return formatter;
	}
	public void setFormatter(String formatter) {
		this.formatter = formatter;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getBorderColor() {
		return borderColor;
	}
	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}
	public Integer getBorderRadius() {
		return borderRadius;
	}
	public void setBorderRadius(Integer borderRadius) {
		this.borderRadius = borderRadius;
	}
 
	public void setShadow(Boolean shadow) {
		this.shadow = shadow;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	 
	
	
	
}
