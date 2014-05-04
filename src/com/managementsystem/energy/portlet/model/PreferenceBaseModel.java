package com.managementsystem.energy.portlet.model;

import java.io.Serializable;

/**
 * 所有首选项基本模型
 * */
public class PreferenceBaseModel<T> implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 所属建筑ID
	 * */
	private String buildId;

	/**
	 * 建筑WebService Url 如: http://192.168.1.50:8080
	 * */
	private String settingWsUrl;

	public String getBuildId() {
		return buildId;
	}

	public void setBuildId(String buildId) {
		this.buildId = buildId;
	}

	public String getSettingWsUrl() {
		return settingWsUrl;
	}

	public void setSettingWsUrl(String settingWsUrl) {
		this.settingWsUrl = settingWsUrl;
	}

}
