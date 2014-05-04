package com.managementsystem.energy.portlet.coreinfo.model;

/**
 * 建筑信息
 */
public class OutSideStatusInfo implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1688064716245194987L;

	/**
	 * 气温
	 */
	private String temperature;
	/**
	 * 平均气温
	 */
	private String avgtemperature;

	/**
	 * 最高气温
	 */
	private String maxtemperature;

	/**
	 * 湿度
	 */
	private String humidity;
	/**
	 * 平均湿度
	 */
	private String avghumidity;

	/**
	 * 最高湿度
	 */
	private String maxhumidity;

	public OutSideStatusInfo(String temperature, String avgtemperature,
			String maxtemperature, String humidity, String avghumidity,
			String maxhumidity) {
		this.temperature = temperature;
		this.avgtemperature = avgtemperature;
		this.maxtemperature = maxtemperature;
		this.humidity = humidity;
		this.avghumidity = avghumidity;
		this.maxhumidity = maxhumidity;
	}

	public String getTemperature() {
		return temperature;
	}

	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}

	public String getAvgtemperature() {
		return avgtemperature;
	}

	public void setAvgtemperature(String avgtemperature) {
		this.avgtemperature = avgtemperature;
	}

	public String getMaxtemperature() {
		return maxtemperature;
	}

	public void setMaxtemperature(String maxtemperature) {
		this.maxtemperature = maxtemperature;
	}

	public String getHumidity() {
		return humidity;
	}

	public void setHumidity(String humidity) {
		this.humidity = humidity;
	}

	public String getAvghumidity() {
		return avghumidity;
	}

	public void setAvghumidity(String avghumidity) {
		this.avghumidity = avghumidity;
	}

	public String getMaxhumidity() {
		return maxhumidity;
	}

	public void setMaxhumidity(String maxhumidity) {
		this.maxhumidity = maxhumidity;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
