package com.managementsystem.portlet.weather;

import java.util.List;
import java.util.Map;


/**
 * 天气预报服务接口
 * */
public interface WeatherService {

	/**
	 * 获取天气查询结果字符
	 * */
	public String getWeatherData(String code) throws Exception;
	
}
