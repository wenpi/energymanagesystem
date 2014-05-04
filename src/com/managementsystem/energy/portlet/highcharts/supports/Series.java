package com.managementsystem.energy.portlet.highcharts.supports;

public class Series {
	private String name;
	/**
	 * 数据项目，
	 * 可能是double类型一维数组，也可能是二维数组
	 */
	private Object  data;
	
	private String cursor;
	private Point point;
	private Marker marker;
	
	private Integer lineWidth;
	
	private String type;
	private Integer pointInterval;
	private Integer pointStart;
	
	private String color;
	//methods below
	public Series() {
	 
	}
	public Series(String name,String color,String type,Double[]... data) {
		 this.name=name;
		 this.color=color;
		 this.type = type;
		 this.data=data;
		 
	}
 
	public Object  getData() {
		return data;
	}
	public void setData(Double[]... data) {
		this.data = data;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
 
	public String getCursor() {
		return cursor;
	}
	public void setCursor(String cursor) {
		this.cursor = cursor;
	}
	public Point getPoint() {
		return point;
	}
	public void setPoint(Point point) {
		this.point = point;
	}
	public Marker getMarker() {
		return marker;
	}
	public void setMarker(Marker marker) {
		this.marker = marker;
	}
	public Integer getLineWidth() {
		return lineWidth;
	}
	public void setLineWidth(Integer lineWidth) {
		this.lineWidth = lineWidth;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getPointInterval() {
		return pointInterval;
	}
	public void setPointInterval(Integer pointInterval) {
		this.pointInterval = pointInterval;
	}
	public Integer getPointStart() {
		return pointStart;
	}
	public void setPointStart(Integer pointStart) {
		this.pointStart = pointStart;
	}
	
	 
}
