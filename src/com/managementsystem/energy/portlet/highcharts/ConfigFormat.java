package com.managementsystem.energy.portlet.highcharts;

import com.managementsystem.energy.portlet.highcharts.supports.*;

/**  
Highcharts配置文件的json格式映射结构类,
换而言之，用此类对象序列化生成json格式，直接在页面初始化highcharts图表。
 @author allchin
 modified@2013年8月7日  上午10:39:18
 */
public class ConfigFormat {
	public Chart chart=new Chart();
	public Title title=new Title();
	public SubTitle subtitle=new SubTitle();
	public Yaxis[] yAxis;
	public Xaxis xAxis=new Xaxis();
	public Tooltip tooltip=new Tooltip();
	public Legend legend=new Legend();
	public Series[] series;
	public PlotOptions plotOptions=new PlotOptions();
	
	public ConfigFormat() {
	 
	}
	/**
	构造方法 :
	线条个数
	@author:allchin
	Modified :  下午12:32:42
	 * @param lines
	 */
	public ConfigFormat(int lines) {
		 yAxis=new Yaxis[lines];
		 series=new Series[lines];
		 for(int i=0;i<lines;i++){
			 yAxis[i]=new Yaxis();
			 series[i]=new Series();
		 }
	}
	
	public Chart getChart() {
		return chart;
	}
	public void setChart(Chart chart) {
		this.chart = chart;
	}
	public Title getTitle() {
		return title;
	}
	public void setTitle(Title title) {
		this.title = title;
	}
	public SubTitle getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(SubTitle subtitle) {
		this.subtitle = subtitle;
	}
 
	public Xaxis getxAxis() {
		return xAxis;
	}
	public void setxAxis(Xaxis xAxis) {
		this.xAxis = xAxis;
	}
	public Tooltip getTooltip() {
		return tooltip;
	}
	public void setTooltip(Tooltip tooltip) {
		this.tooltip = tooltip;
	}
	public Legend getLegend() {
		return legend;
	}
	public void setLegend(Legend legend) {
		this.legend = legend;
	}
	public Series[] getSeries() {
		return series;
	}
	public void setSeries(Series[] series) {
		this.series = series;
	}
	public Yaxis[] getyAxis() {
		return yAxis;
	}
	public void setyAxis(Yaxis[] yAxis) {
		this.yAxis = yAxis;
	}
	public PlotOptions getPlotOptions() {
		return plotOptions;
	}
	public void setPlotOptions(PlotOptions plotOptions) {
		this.plotOptions = plotOptions;
	}
	
	
}
