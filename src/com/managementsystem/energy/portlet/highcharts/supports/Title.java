package com.managementsystem.energy.portlet.highcharts.supports;

public class Title {
	public String text;
	public Integer x;
	public String align;
	public String verticalAlign;
	public Integer margin;
	public Boolean floating;
	public Style style=new Style();

	public Boolean enable;
	
	public Double maxPadding;
	public Boolean showLastLabel;
	public Title() {
		 
	}
	
	public Title(String text) {
		this.text=text;
	}
	
	public Title(String text, String titleColor) {
		this.text=text;
		if(titleColor!=null){
			style=new Style(titleColor);
		}
	}

	public Boolean getShowLastLabel() {
		return showLastLabel;
	}
	public void setShowLastLabel(Boolean showLastLabel) {
		this.showLastLabel = showLastLabel;
	}
	public Boolean getFloating() {
		return floating;
	}
	public void setMaxPadding(Double maxPadding) {
		this.maxPadding = maxPadding;
	}
 
	public Double getMaxPadding() {
		return maxPadding;
	}
	public Boolean getEnable() {
		return enable;
	}
	public void setEnable(Boolean enable) {
		this.enable = enable;
	}
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Integer getX() {
		return x;
	}
	public void setX(Integer x) {
		this.x = x;
	}
	public String getAlign() {
		return align;
	}
	public void setAlign(String align) {
		this.align = align;
	}
	public String getVerticalAlign() {
		return verticalAlign;
	}
	public void setVerticalAlign(String verticalAlign) {
		this.verticalAlign = verticalAlign;
	}
	public Integer getMargin() {
		return margin;
	}
	public void setMargin(Integer margin) {
		this.margin = margin;
	}
 
	public void setFloating(Boolean floating) {
		this.floating = floating;
	}

	public Style getStyle() {
		return style;
	}

	public void setStyle(Style style) {
		this.style = style;
	}
 
	
}
