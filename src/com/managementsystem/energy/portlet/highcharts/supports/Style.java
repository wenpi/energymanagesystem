package com.managementsystem.energy.portlet.highcharts.supports;

public class Style {
	public String margin;
	public String color;
	public Style(String labelColor) {
		if(labelColor!=null){
			this.color=labelColor;
		}
	}
	public Style() {
		 
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	public String getMargin() {
		return margin;
	}
	public void setMargin(String margin) {
		this.margin = margin;
	}
	
}
