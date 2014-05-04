package com.managementsystem.energy.portlet.holographic.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class ServcieSettingHolder {

	private String buildId;
	private String serviceBuildingKey;
	private String defaultDate = "2013-06-05T09:00:00";
	private String currentDate = "";

	public String getCurrentDate() {
		Calendar cd = Calendar.getInstance();
		cd.setTime(new Date());
		cd.add(Calendar.HOUR, +8);
		cd.add(Calendar.MINUTE, -5);
		// 当前日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		currentDate = sdf.format(cd.getTime());
		currentDate.replace(" ", "T");
		return currentDate;
	}

	// 获取指定的配置时间
	public String getConfigDate(String time) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat tf = new SimpleDateFormat("HH:mm:ss");
		Calendar cd = Calendar.getInstance();
		Date date = new Date();
		try {
			cd.setTime(sdf.parse(time + " " + tf.format(date)));
		} catch (ParseException e) {
			System.out.println("ServcieSettingHolder类中转换出错--" + time);
		}
		cd.add(Calendar.HOUR, +8);
		cd.add(Calendar.MINUTE, -5);
		// 当前日期
		currentDate = sdf.format(cd.getTime());
		currentDate.replace(" ", "T");
		return currentDate;
	}

	public void setCurrentDate(String currentDate) {
		this.currentDate = currentDate;
	}

	public String getDefaultDate() {
		return defaultDate;
	}

	public void setDefaultDate(String defaultDate) {
		this.defaultDate = defaultDate;
	}

	public java.lang.String getBuildId() {
		return buildId;
	}

	public void setBuildId(java.lang.String buildId) {
		this.buildId = buildId;
	}

	public java.lang.String getServiceBuildingKey() {
		return serviceBuildingKey;
	}

	public void setServiceBuildingKey(java.lang.String serviceBuildingKey) {
		this.serviceBuildingKey = serviceBuildingKey;
	}

}
