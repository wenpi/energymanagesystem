package com.managementsystem.energy.service.impl;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.managementsystem.energy.portlet.weather.JsonToList;
import com.managementsystem.energy.portlet.weather.model.Weather;
import com.managementsystem.energy.service.WeatherViewService;

@Service
public class WeatherViewServiceImpl implements WeatherViewService {

	private final Log logger = LogFactory.getLog(WeatherViewServiceImpl.class);

	@Transactional(readOnly = true)
	public List<Weather> getQueryresult(String districtPinyin)
			throws Exception {
		List<Weather> list = new ArrayList<Weather>();
		String districtPinyinjq = districtPinyin.substring(3, 7);
		String tagUrl = "http://weather.api.114la.com/"+districtPinyinjq+"/"+districtPinyin+".txt";
		try {
			list = getWeatherResult(tagUrl,"utf-8");
			String week = list.get(0).getWeek();
			if(week==null){
				list = getWeatherResult("http://123.duba.net/weatherinfo/","utf-8");
			}
		} catch(Exception e) {
			list = getWeatherResult(tagUrl,"gb2312");
		}
		return list;
	}
	
	
	private List<Weather> getWeatherResult(String tagUrl,String charsetName) throws Exception {
		
		List<Weather> list = new ArrayList<Weather>();
		
		String resultString = "";
		URL url = null;
		try {
			url = new URL(tagUrl);
		} catch (MalformedURLException e1) {
			e1.printStackTrace();
			logger.error(e1);
		}
		
		URLConnection URLconnection = null;
		URLconnection = url.openConnection();
		HttpURLConnection httpConnection = (HttpURLConnection) URLconnection;
		int responseCode = httpConnection.getResponseCode();
		if (responseCode == HttpURLConnection.HTTP_OK) {
			logger.info(url);
			// 获取查询结果
			InputStream urlStream = httpConnection.getInputStream();
			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(urlStream,charsetName));
			String currentLine = "";
			while ((currentLine = bufferedReader.readLine()) != null) {
				resultString += currentLine;
			}
			JsonToList jsonToList = new JsonToList();
			urlStream.close();
			bufferedReader.close();
			list = jsonToList.xmlElements(resultString);
			
		} else {
			logger.warn("HttpURLConnection:" + responseCode);
			throw new Exception("HttpURLConnection Status:"+responseCode + ";天气数据提供失败");
		}

		return list;
	}
	

}
