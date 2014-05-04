package com.managementsystem.energy.portlet.highcharts.supports;

public class Labels {
	public String text;
	
	public Integer x;
	public Integer y;
	public String align;
	public String formatter;
	public Integer step;
	public Style style=new Style();
	public Labels() {
		 
	}
	public Labels(int step) {
		this.step=step;
	}
	
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Labels(  String labelColor) {
		 if(labelColor!=null){
			 style=new Style(labelColor);
		 }
	}
	
	
	public Style getStyle() {
		return style;
	}
	public void setStyle(Style style) {
		this.style = style;
	}
	public Integer getStep() {
		return step;
	}
	public void setStep(Integer step) {
		this.step = step;
	}
	public Integer getX() {
		return x;
	}
	public void setX(Integer x) {
		this.x = x;
	}
	public Integer getY() {
		return y;
	}
	public void setY(Integer y) {
		this.y = y;
	}
	public String getAlign() {
		return align;
	}
	public void setAlign(String align) {
		this.align = align;
	}
	public String getFormatter() {
		return formatter;
	}
	public void setFormatter(String formatter) {
		this.formatter = formatter;
	}
	
}
