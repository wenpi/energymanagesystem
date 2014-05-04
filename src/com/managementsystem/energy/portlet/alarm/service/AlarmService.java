package com.managementsystem.energy.portlet.alarm.service;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.portlet.PortletPreferences;

import com.managementsystem.energy.portlet.alarm.model.Prefsinfo;
import com.managementsystem.energy.portlet.alarm.model.TagInfo;

/**
 * 报警模块服务信息
 * */
public interface AlarmService {
	/**
	 * 获取报警模块首选项信息
	 * 
	 * @param prefs 首选项对象
	 * 
	 * @return 报警首选项信息
	 * */
	public Prefsinfo getPrefsinfo(PortletPreferences prefs);
	
	/**
	 * 保存报警模块首选项信息
	 * 
	 * @param prefs 首选项对象
	 * @param prefsinfo 首选项信息
	 * @throws NoSuchMethodException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @throws Exception 
	 * 
	 * */
	public void savePrefsinfo(PortletPreferences prefs,Prefsinfo prefsinfo) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException, Exception;
	
	/**
	 * 获取报警信息
	 * @param prefsinfo 首选项信息
	 * @param from 开始日期
	 * @param to 结束日期
	 * */
	public List<TagInfo> getAlarmList(Prefsinfo prefsinfo,String from,String to);
}
