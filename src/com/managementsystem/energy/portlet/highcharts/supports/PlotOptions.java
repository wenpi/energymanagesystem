package com.managementsystem.energy.portlet.highcharts.supports;

public class PlotOptions {
	private Series series;
	private Line line;
	
	private Area area;
	private Boolean enabled;
	private Boolean allowPointSelect;
	private String formatter;
	
	private Spline spline;
	
	
	public Spline getSpline() {
		return spline;
	}
	public void setSpline(Spline spline) {
		this.spline = spline;
	}
	public Boolean getEnabled() {
		return enabled;
	}
	public Boolean getAllowPointSelect() {
		return allowPointSelect;
	}
	public Series getSeries() {
		return series;
	}
	public void setSeries(Series series) {
		this.series = series;
	}
	public Line getLine() {
		return line;
	}
	public void setLine(Line line) {
		this.line = line;
	}
	public Area getArea() {
		return area;
	}
	public void setArea(Area area) {
		this.area = area;
	}
 
	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
 
	public void setAllowPointSelect(Boolean allowPointSelect) {
		this.allowPointSelect = allowPointSelect;
	}
	public String getFormatter() {
		return formatter;
	}
	public void setFormatter(String formatter) {
		this.formatter = formatter;
	}
	
	
}
