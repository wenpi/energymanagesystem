package com.managementsystem.energy.portlet.holographic.vo;
/**
 * 全息图数据vo
 * @author allchin
 *
 */
public class HoloData{
	
	public HoloData() {
		 
	}
	public HoloData(String buildingName,int people,int eletric ,int cooler) {
		 this.buildingName=buildingName;
		 this.peopleCount=people;
		 this.electricCost=eletric;
		 this.coolerCost=cooler;
	}
	
	private String buildingName;

	/**
	 * 人数
	 */
	private int peopleCount;
	/**
	 * 耗电量
	 */
	private int electricCost;
	/**
	 * 耗冷量
	 */
	private int coolerCost;
	
	
	public int getPeopleCount() {
		return peopleCount;
	}
	public void setPeopleCount(int peopleCount) {
		this.peopleCount = peopleCount;
	}
	public int getElectricCost() {
		return electricCost;
	}
	public void setElectricCost(int electricCost) {
		this.electricCost = electricCost;
	}
	public int getCoolerCost() {
		return coolerCost;
	}
	public void setCoolerCost(int coolerCost) {
		this.coolerCost = coolerCost;
	}
	
	
	public String getBuildingName() {
		return buildingName;
	}
	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}
}