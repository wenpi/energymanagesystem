package com.managementsystem.energy.portlet.alarm.model;

/**
 * 首选项信息
 * */
public class Prefsinfo implements java.io.Serializable {

	private static final long serialVersionUID = 6639623675773193008L;
	/**
	 * 查询类型: active、history
	 * */
	private String queryType;
	/**
	 * 设置名称(设备名是UTF8字串再base64编码)
	 * */
	private String devicename;
	/**
	 * 变量名是UTF8字串再base64编码
	 * */
	private String tagname;
	/**
	 * 组名是UTF8字串再base64编码
	 * */
	private String groupname;
	/**
	 * 显示结果数
	 * */
	private int count;

	private String buildId;

	private String settingWsUrl;

	public String getQueryType() {
		return queryType;
	}

	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}

	public String getDevicename() {
		return devicename;
	}

	public void setDevicename(String devicename) {
		this.devicename = devicename;
	}

	public String getTagname() {
		return tagname;
	}

	public void setTagname(String tagname) {
		this.tagname = tagname;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

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
