package com.managementsystem.portlet.quicknavigation;

import javax.portlet.PortletPreferences;

/**
 * 快速导航服务接口类
 * 
 * @author chenflat
 * @version 1.0
 * */
public interface QuickNavigationService {

	/**
	 * 从设置信息中获取导航信息
	 * 
	 * @param prefs 首选项信息
	 * */
	public NavigationForm getNavigationForm(PortletPreferences prefs);
	
	
}
