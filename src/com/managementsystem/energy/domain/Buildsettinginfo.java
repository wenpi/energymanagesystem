package com.managementsystem.energy.domain;


/**
 * 建筑设置
 */
public class Buildsettinginfo implements java.io.Serializable {

	private static final long serialVersionUID = -1712256885218474759L;
	private String buildId;
	private Buildinfo buildinfo;
	private String settingSupporturl;
	private String settingWsurl;


	public Buildsettinginfo() {
	}

	public Buildsettinginfo(Buildinfo buildinfo) {
		this.buildinfo = buildinfo;
	}

	public Buildsettinginfo(Buildinfo buildinfo, String settingSupporturl,
			String settingWsurl) {
		this.buildinfo = buildinfo;
		this.settingSupporturl = settingSupporturl;
		this.settingWsurl = settingWsurl;
	}

	public String getBuildId() {
		return this.buildId;
	}

	public void setBuildId(String buildId) {
		this.buildId = buildId;
	}

	public Buildinfo getBuildinfo() {
		return this.buildinfo;
	}

	public void setBuildinfo(Buildinfo buildinfo) {
		this.buildinfo = buildinfo;
	}

	public String getSettingSupporturl() {
		return this.settingSupporturl;
	}

	public void setSettingSupporturl(String settingSupporturl) {
		this.settingSupporturl = settingSupporturl;
	}

	public String getSettingWsurl() {
		return settingWsurl;
	}

	public void setSettingWsurl(String settingWsurl) {
		this.settingWsurl = settingWsurl;
	}

}
