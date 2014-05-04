package com.managementsystem.energy.service;

import java.util.List;

import com.managementsystem.energy.portlet.weather.model.Weather;

/**
 * 图表数据处理接口
 * 
 * @author CHENPING 2012-7-4
 * */
public interface WeatherViewService {
	
	/**
	 * 获取查询结果
	 * 
	 * @param from 开始时间
	 * @param to 结束时间
	 * @param tagIds 查询ID
	 * */
	public List<Weather> getQueryresult(String districtPinyin) throws Exception;
}
