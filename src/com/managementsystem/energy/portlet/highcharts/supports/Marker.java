package com.managementsystem.energy.portlet.highcharts.supports;

public class Marker {
	private Integer lineWidth;
	private Boolean enable;
	
	public Marker(boolean enable) {
		this.enable=enable;
	}
	public Boolean getEnable() {
		return enable;
	}
	public void setEnable(Boolean enable) {
		this.enable = enable;
	}
	

	public Integer getLineWidth() {
		return lineWidth;
	}

	public void setLineWidth(Integer lineWidth) {
		this.lineWidth = lineWidth;
	}
	
	
}
