package com.managementsystem.energy.portlet.weather.model;

import com.managementsystem.energy.domain.Weatherforecast;

/**
 * 天气预报实体类
 */
public class Weather extends Weatherforecast {
	private static final long serialVersionUID = 7909547812121888930L;
	private String week;
	private Float conditionTemp_f;
	private Float conditionTemp_c;
	private String humidity;
	private String icon;
	private String wind_condition;
	private Float conditionTemp_h;
	private Float conditionTemp_l;

	public Weather() {
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public Float getConditionTemp_f() {
		return conditionTemp_f;
	}

	public void setConditionTemp_f(Float conditionTemp_f) {
		this.conditionTemp_f = conditionTemp_f;
	}

	public Float getConditionTemp_c() {
		return conditionTemp_c;
	}

	public void setConditionTemp_c(Float conditionTemp_c) {
		this.conditionTemp_c = conditionTemp_c;
	}

	public String getHumidity() {
		return humidity;
	}

	public void setHumidity(String humidity) {
		this.humidity = humidity;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getWind_condition() {
		return wind_condition;
	}

	public void setWind_condition(String wind_condition) {
		this.wind_condition = wind_condition;
	}

	public Float getConditionTemp_h() {
		return conditionTemp_h;
	}

	public void setConditionTemp_h(Float conditionTemp_h) {
		this.conditionTemp_h = conditionTemp_h;
	}

	public Float getConditionTemp_l() {
		return conditionTemp_l;
	}

	public void setConditionTemp_l(Float conditionTemp_l) {
		this.conditionTemp_l = conditionTemp_l;
	}

}
