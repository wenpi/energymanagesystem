package com.managementsystem.energy.portlet.highcharts.supports;

import com.managementsystem.energy.portlet.highcharts.constants.CategoriesConstants;

public class Yaxis {
	public String[] categories;
	
	//自定义categories支持
	public String categoStr="";
	public Integer step;
	public String spliter;  
	//可选择的典型的categories支持
	public Integer categoType;
	
	public Title title=new Title();
	public PlotLines plotLines=new PlotLines();

	/**
	 * 背景色
	 */
	public PlotBands[] plotBands;
	
	public String type;
	public Integer tickIntegererval;
	public Integer tickWidth;
	public Integer gridLineWidth;
	public Labels labels=new Labels();

	public Boolean showFirstLabel;

	public Integer likedTo;
	public Boolean opposite;
	
	public Integer maxZoom;
	public Integer max;
	public Integer min;
	public String gridLineColor;
	public String lineColor;
	public Integer lineWidth;
	
	public Boolean reversed;
	
	public Yaxis() {
		 
	}
	public Yaxis(Integer categoriesType, Integer step,
			Integer max,Integer min,
				 String title,String titleColor,
				   String labelColor
			) {
		this.max=max;
		this.min=min;
		this.step=step;
		//
		if(categoriesType!=null){
			categories= CategoriesConstants.getCategories(categoriesType) ;
		}
		if(title!=null){
			this.title=new Title(title,titleColor);
		}
		if(labelColor!=null){
			labels=new Labels( labelColor);
		}
		
		
		
	}
	public void setPlotBands(PlotBands[] plotBands) {
		this.plotBands = plotBands;
	}
	public PlotBands[] getPlotBands() {
		return plotBands;
	}
	public String getCategoStr() {
		return categoStr;
	}
	public void setCategoStr(String categoStr) {
		this.categoStr = categoStr;
	}
	public Integer getStep() {
		return step;
	}
	public void setStep(Integer step) {
		this.step = step;
	}
	public String getSpliter() {
		return spliter;
	}
	public void setSpliter(String spliter) {
		this.spliter = spliter;
	}
	public Integer getCategoType() {
		return categoType;
	}
	public void setCategoType(Integer categoType) {
		this.categoType = categoType;
	}
	public Boolean getOpposite() {
		return opposite;
	}
	public void setReversed(Boolean reversed) {
		this.reversed = reversed;
	}
	public Boolean getReversed() {
		return reversed;
	}
	
	
	public Boolean getShowFirstLabel() {
		return showFirstLabel;
	}
	public String[] getCategories() {
		return categories;
	}
	public void setCategories(String[] categories) {
		this.categories = categories;
	}
	public Title getTitle() {
		return title;
	}
	public void setTitle(Title title) {
		this.title = title;
	}
	public PlotLines getPlotLines() {
		return plotLines;
	}
	public void setPlotLines(PlotLines plotLines) {
		this.plotLines = plotLines;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getTickIntegererval() {
		return tickIntegererval;
	}
	public void setTickIntegererval(Integer tickIntegererval) {
		this.tickIntegererval = tickIntegererval;
	}
	public Integer getTickWidth() {
		return tickWidth;
	}
	public void setTickWidth(Integer tickWidth) {
		this.tickWidth = tickWidth;
	}
	public Integer getGridLineWidth() {
		return gridLineWidth;
	}
	public void setGridLineWidth(Integer gridLineWidth) {
		this.gridLineWidth = gridLineWidth;
	}
	public Labels getLabels() {
		return labels;
	}
	public void setLabels(Labels labels) {
		this.labels = labels;
	}
 
	public void setShowFirstLabel(Boolean showFirstLabel) {
		this.showFirstLabel = showFirstLabel;
	}
	public Integer getLikedTo() {
		return likedTo;
	}
	public void setLikedTo(Integer likedTo) {
		this.likedTo = likedTo;
	}
 
	public void setOpposite(Boolean opposite) {
		this.opposite = opposite;
	}
	public Integer getMaxZoom() {
		return maxZoom;
	}
	public void setMaxZoom(Integer maxZoom) {
		this.maxZoom = maxZoom;
	}
	public Integer getMax() {
		return max;
	}
	public void setMax(Integer max) {
		this.max = max;
	}
	public Integer getMin() {
		return min;
	}
	public void setMin(Integer min) {
		this.min = min;
	}
	public String getGridLineColor() {
		return gridLineColor;
	}
	public void setGridLineColor(String gridLineColor) {
		this.gridLineColor = gridLineColor;
	}
	public String getLineColor() {
		return lineColor;
	}
	public void setLineColor(String lineColor) {
		this.lineColor = lineColor;
	}
	public Integer getLineWidth() {
		return lineWidth;
	}
	public void setLineWidth(Integer lineWidth) {
		this.lineWidth = lineWidth;
	}
	
}
