package com.managementsystem.energy.portlet.highcharts.supports;

public class Spline {
	private Marker marker;
	private Integer lineWidth;
	public Spline() {
	 
	}
	public Spline(int lw) {
		 this.lineWidth=lw;
	}
	
	
	public Integer getLineWidth() {
		return lineWidth;
	}
	public void setLineWidth(Integer lineWidth) {
		this.lineWidth = lineWidth;
	}
	public void setMarker(Marker marker) {
		this.marker = marker;
	}
	public Marker getMarker() {
		return marker;
	}
}
