package com.managementsystem.energy.portlet.highcharts.supports;

public class Chart {
	public String type;
	public Integer marginRight;
	public Integer marginBottom ;
	
	public String zoomType;
	public Integer spacingRight;
	
	public Boolean inverted;  

	public Integer width;
	public Integer height;
	public Style style=new Style();
	
	public Chart() {
	 
	}
	public Chart(String type,int width,int height) {
		 this.width=width;
		 this.height=height;
		 this.type=type;
	}
	
	
	public Style getStyle() {
		return style;
	}
	public void setStyle(Style style) {
		this.style = style;
	}
	
	

	public Boolean getInverted() {
		return inverted;
	}
	public void setInverted(Boolean inverted) {
		this.inverted = inverted;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

 
 

	public String getZoomType() {
		return zoomType;
	}

	public void setZoomType(String zoomType) {
		this.zoomType = zoomType;
	}

 

	 
 

	public Integer getMarginRight() {
		return marginRight;
	}

	public void setMarginRight(Integer marginRight) {
		this.marginRight = marginRight;
	}
 
 
 

	public Integer getMarginBottom() {
		return marginBottom;
	}

	public void setMarginBottom(Integer marginBottom) {
		this.marginBottom = marginBottom;
	}

	public Integer getSpacingRight() {
		return spacingRight;
	}

	public void setSpacingRight(Integer spacingRight) {
		this.spacingRight = spacingRight;
	}
	
	
	
}
