package com.managementsystem.energy.portlet.chart.api;

import java.util.Map;

/**
 * 图表属性接口
 * */
public interface ChartProperties {
	
	/**
	 * 添加指定的属性的值
	 * 
	 * @param key
	 * @param value
	 */
	public ChartProperties addProperty(String key, String value);
	
	/**
	 * 移除指定的属性
	 * @param key
	 * */
	public ChartProperties removeProperty(String key);
	
	/**
	 * 获取指定的属性值
	 * @param key
	 * */
	public String getProperty(String key);
	
	/**
	 * 返回所有属性
	 * */
	public Map<String,String> getAllProperties();
	
	/**
	 * 清空所有属性
	 * */
	public void clear();
	
	/**
	 * 添加所有属性
	 * 
	 * @param config 属性配置
	 * */
	public void addAllProperties(Map<String,String> config);
}
