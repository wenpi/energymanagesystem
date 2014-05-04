package com.managementsystem.portlet.weather;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.type.TypeFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.managementsystem.util.net.RequestServiceProcess;

@Service
public class WeatherServiceImpl implements WeatherService {

	@Transactional(readOnly = true)
	@Override
	public String getWeatherData(String code)
			throws Exception {

		Assert.hasLength(code, "district 'code' must not be null");

		//Map<String, String> map = new HashMap<String, String>();
		Map<String,Map<String,String>> map =  new HashMap<String, Map<String,String>>();

		String result = null;
		String serviceUrl = String.format("http://m.weather.com.cn/data/%s.html", code);
		result = getRequestResult(serviceUrl);
		return result;
	}

	public String getRequestResult(String reqUrl)
			throws MalformedURLException, IOException {

		URL url = new URL(reqUrl);

		String result = "";
		
		StringBuilder sb = new StringBuilder();
		URLConnection URLconnection = url.openConnection();
		HttpURLConnection httpConnection = (HttpURLConnection) URLconnection;
		int responseCode = httpConnection.getResponseCode();
		if (responseCode == HttpURLConnection.HTTP_OK) {
			System.out.println("Http Request Url:" + url);
			// 获取查询结果
			InputStream urlStream = httpConnection.getInputStream();
			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(urlStream,Charset.defaultCharset()));
			String currentLine = "";
			while ((currentLine = bufferedReader.readLine()) != null) {
				sb.append(currentLine);
			}
			// 转换JSON字符为LIST列表
			ObjectMapper mapper = new ObjectMapper();
			TypeFactory typeFactory = TypeFactory.defaultInstance();
			
			
			List<Map<String,Map<String,String>>> a = new ArrayList<Map<String,Map<String,String>>> ();
			
			//a = mapper.readValue(sb.toString(),typeFactory.constructCollectionType(List.class,Map.class));
			//result = mapper.readValue(sb.toString(),typeFactory.constructType(String.class));
			
			result = sb.toString();
			
			
		} else {
			System.out.println("HttpURLConnection StatusCode:" + responseCode);
		}
		return result;
	}

}
