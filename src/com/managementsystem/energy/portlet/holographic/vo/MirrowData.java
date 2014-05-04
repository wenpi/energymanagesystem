package com.managementsystem.energy.portlet.holographic.vo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.managementsystem.energy.portlet.highcharts.ConfigFormat;

/**
 * 全息图详细数据
 * 
 * @author allchin modified@2013年8月7日 上午10:50:24
 */
public class MirrowData extends ServiceReqParam {

	private Map<String, String> airConditions = new HashMap<String, String>();

	private String avgInnerTemp;
	private String avgOutdoorTemp;
	private List cataList;

	private ConfigFormat temp = new ConfigFormat(2);
	private ConfigFormat cost = new ConfigFormat(2);

	public Map<String, String> getAirConditions() {
		return airConditions;
	}

	public void setAirConditions(Map<String, String> airConditions) {
		this.airConditions = airConditions;
	}

	public String getAvgInnerTemp() {
		return avgInnerTemp;
	}

	public void setAvgInnerTemp(String avgInnerTemp) {
		this.avgInnerTemp = avgInnerTemp;
	}

	public String getAvgOutdoorTemp() {
		return avgOutdoorTemp;
	}

	public void setAvgOutdoorTemp(String avgOutdoorTemp) {
		this.avgOutdoorTemp = avgOutdoorTemp;
	}

	public ConfigFormat getTemp() {
		return temp;
	}

	public void setTemp(ConfigFormat temp) {
		this.temp = temp;
	}

	public ConfigFormat getCost() {
		return cost;
	}

	public void setCost(ConfigFormat cost) {
		this.cost = cost;
	}

	public List getCataList() {
		return cataList;
	}

	public void setCataList(List cataList) {
		this.cataList = cataList;
	}
}
