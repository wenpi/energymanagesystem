package com.managementsystem.energy.portlet.energyquery.domain;

/**
 * 建筑能耗项
 * */
public class BuildEnergyItem {

	private String buildName;
	private String energyVal;
	private String ranking;
	private String timeVal;

	public String getBuildName() {
		return buildName;
	}

	public void setBuildName(String buildName) {
		this.buildName = buildName;
	}

	public String getEnergyVal() {
		return energyVal;
	}

	public void setEnergyVal(String energyVal) {
		this.energyVal = energyVal;
	}

	public String getRanking() {
		return ranking;
	}

	public void setRanking(String ranking) {
		this.ranking = ranking;
	}

	public String getTimeVal() {
		return timeVal;
	}

	public void setTimeVal(String timeVal) {
		this.timeVal = timeVal;
	}

}
