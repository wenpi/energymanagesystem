package com.managementsystem.energy.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.type.TypeFactory;
import org.springframework.stereotype.Service;

import com.managementsystem.energy.portlet.energystatistic.service.EnergyStatisticServiceImpl;
import com.managementsystem.energy.service.EnergyCommonService;

@Service
public class EnergyCommonServiceImpl implements EnergyCommonService {
	private final Log logger = LogFactory.getLog(EnergyCommonServiceImpl.class);

	/**
	 * 根据指定编码获取指定url的内容
	 * 
	 * @param url
	 * @param api
	 * @param charset
	 * @return
	 */
	@Override
	public Map<String, Object> getContentByUrl(String appendUrl, String api,
			String charset) {
		Map<String, Object> map = new HashMap<String, Object>();
		URLConnection URLconnection = null;
		try {
			URL url = new URL(appendUrl);
			URLconnection = url.openConnection();

			HttpURLConnection httpConnection = (HttpURLConnection) URLconnection;

			InputStream urlStream = httpConnection.getInputStream();

			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(urlStream, (charset == null
							|| "".equals(charset) ? "GB2312" : charset))); // 默认编码GB2312
			String currentLine = "";
			String resultString = "";
			while ((currentLine = bufferedReader.readLine()) != null) {
				resultString += currentLine;
			}

			if (api != null && api.equalsIgnoreCase("api")) { // 如果满足则抓取对应网页中的内容,此处为抓取对应url中的AQI（空气质量指数）
				int i = resultString.indexOf("<div class='aqi' style"); // 抓取对应信息段 
				String tempString = resultString.substring(i + 67, i + 80);
				String str = tempString.substring(0, tempString.indexOf("</div>"));
				map.put("api", str);
				map.put("resultString", resultString);
			}
			logger.info("appendUrl--" + appendUrl);
			logger.info("resultString--" + resultString);
			System.out.println();

			map.put("json", resultString);
		} catch (Exception e) {
			logger.error(e);
		}
		return map;
	}
	
	/**
	 * 分页显示表格内容
	 * 
	 * @param curPage
	 * @param size
	 * @param resultMap
	 * @return
	 */
	@Override
	public Map<String, Object> pagingShow(int curPage, int size,
			Map<String, Object> paramMap) {
		int maxPage = 0;//最大页数
		List<Object> dataList = null;// 存储数据
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();//存放处理后结果
		/**
		 * 遍历map，获取其key与value的值，以便处理完成后返回，使其在处理过后不会对使用方法产生影响
		 */
		for (Map.Entry<String, Object> entry : paramMap.entrySet()) {
			List<Object> newList = new ArrayList<Object>();//过渡用集合，用来存放处理过后的list集合的数据
			String name = entry.getKey(); //保存原有key
			dataList = (List<Object>) entry.getValue();//获取原有value值 
			for(int i = 0;i<dataList.size();i++){
				List<Object> newListContent = new ArrayList<Object>();//过渡用集合，用来存放处理过后的list集合中单个元素的数据内容
				List<Object> listContent = (List<Object>) dataList.get(i);//存放原List中的单个元素
				int lastPage = (int) Math.ceil(listContent.size()*1.0/size);//获取各列数据的最大页数
				/**
				 * 根据当前页数及每页显示数据条数来计算记录开始及结束序号，然后循环从原List中的各元素中取出相应数据并放入过渡List集合newListContent中，
				 * 最后将其在原map中的name及新list集合作为一个键值对放入resultMap中，并返回
				 */
				for(int j = (curPage-1)*size;j<=curPage*size-1;j++){ 
					if(j>lastPage*size-1||j>=listContent.size()){
						break;
					}else{
						newListContent.add(listContent.get(j));
					}
				}
				newList.add(newListContent);
				if(maxPage<lastPage){
					maxPage = lastPage;
				}
			}
			resultMap.put(name, newList);
		}
		resultMap.put("maxPage",maxPage);
		return resultMap;
	}
}
