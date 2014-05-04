package com.managementsystem.energy.portlet.chart.model;

/**
 * 图表数据 <BR />
 * 表示图表JSON数据,例如:
 * {@code
     "data":[{
      "label":"Services",
      "value":"26"
    }]
    }
 * */
public class ChartData {
	
	/**
	 * 数据标签
	 * */
	private String label;
	/**
	 * 数据值
	 * */
	private String value;


	
	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	

}
