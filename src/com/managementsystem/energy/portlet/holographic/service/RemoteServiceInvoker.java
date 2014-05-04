package com.managementsystem.energy.portlet.holographic.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Array;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.type.TypeFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.managementsystem.energy.domain.Buildsettinginfo;
import com.managementsystem.energy.portlet.energystatistic.model.CommonModel;
import com.managementsystem.energy.portlet.highcharts.jackson.JacksonIgnoreNullWapper;
import com.managementsystem.energy.portlet.holographic.vo.ServcieSettingHolder;
import com.managementsystem.energy.portlet.holographic.vo.ServiceReqParam;
import com.managementsystem.energy.service.BuildService;

/**
 * 远程服务调用服务类
 * 
 * @author allchin modified@2013年8月7日 上午10:42:06
 */
@Service
@Transactional(readOnly = true)
@Scope(value = "prototype")
public class RemoteServiceInvoker {
	private Logger logger = Logger.getLogger(RemoteServiceInvoker.class);

	//
	/**
	 * 服务器地址在数据库中的主键id,存放在buildinfo表中
	 */
	@Autowired
	private ServcieSettingHolder servcieSettingHolder;

	/**
	 * 服务器地址
	 */
	private String serviceAddress = null;

	@Autowired
	private BuildService buildService;

	public void setServiceAddress(String serviceAddress) {
		this.serviceAddress = serviceAddress;
	}

	/**
	 * 得到建筑信息
	 * 
	 * @author allchin modified@2013年8月19日 下午8:11:23
	 * @return
	 */
	public Buildsettinginfo getServiceBuilingInfo() {
		return buildService.getBuildsettinginfo(servcieSettingHolder
				.getServiceBuildingKey());
	}

	/**
	 * 获得服务路径
	 * 
	 * @author allchin modified@2013年8月12日 下午12:23:54
	 * @return
	 */
	public String getServicePath() {
		return "ChinaArtsPalace/history?";
	}

	/**
	 * 获取服务器服务地址
	 * 
	 * @author allchin modified@2013年8月12日 下午12:22:16
	 * @return
	 */
	public String getServiceAddress() {
		/*
		 * if(null==serviceAddress){ Buildsettinginfo
		 * bi=buildService.getBuildsettinginfo(ServiceBuildingKey);
		 * serviceAddress=bi.getSettingWsurl()+getServicePath();
		 * 
		 * }
		 */
		Buildsettinginfo bi = buildService
				.getBuildsettinginfo(servcieSettingHolder
						.getServiceBuildingKey());
		serviceAddress = bi.getSettingWsurl() + getServicePath();
		return serviceAddress;

	}

	/**
	 * 调用服务后，仅仅将值写出到数组
	 * 
	 * @author allchin modified@2013年8月12日 下午1:41:06
	 * @param param
	 * @param clazz
	 * @return
	 */
	public Double[] invokeValueToArray(ServiceReqParam param) {

		Object[] tArray = invokeToArray(param, Object.class);

		if (tArray == null) {
			return null;
		}

		Double[] result = new Double[tArray.length];

		for (int i = 0; i < tArray.length; i++) {
			try {
				Map t = (Map) tArray[i];

				String strVal = t.get("value").toString();
				result[i] = Double.parseDouble(strVal);

			} catch (Exception e) {
				logger.error(e);
			}

		}
		return result;
	}

	/**
	 * 调用服务，返回指定列的值
	 * 
	 * @author allchin modified@2013年8月13日 上午10:20:26
	 * @param req
	 * @param field
	 * @return
	 */
	public String[] invokeValueToArray(ServiceReqParam req, String field) {
		Object[] tArray = invokeToArray(req, Object.class);
		String[] result = (String[]) Array.newInstance(String.class, 1);
		//
		for (int i = 0; i < tArray.length; i++) {
			try {
				Map t = (Map) tArray[i];

				String strVal = t.get(field).toString();
				result[i] = strVal;

			} catch (Exception e) {
			}

		}
		return result;

	}

	/**
	 * 调用服务，返回数组
	 * 
	 * @author allchin modified@2013年8月9日 下午12:21:41
	 * @param serviceType
	 * @param param
	 * @return
	 * @return
	 */

	public <T> T[] invokeToArray(ServiceReqParam param, Class<T> clazz) {
		T[] t = null;
		String url = getServiceAddress() + param;
		String json = null;
		try {
			json = invokeService(url);
			t = (T[]) Array.newInstance(clazz, 1);

			t = (T[]) JacksonIgnoreNullWapper.jsonToBean(json, t.getClass());

		} catch (Exception e1) {
			System.out.println("解析失败：" + json + "`url = " + url);

		}

		return t;
	}

	/**
	 * 通过服务类型/参数 调用服务,封装处理异常
	 * 
	 * @author allchin modified@2013年8月7日 上午10:30:35
	 * @param <T>
	 * @param serviceType
	 * @param param
	 * @return
	 */
	public <T> List<T> invokeToList(ServiceReqParam param, Class<T> clazz) {
		List<T> result = null;
		String url = getServiceAddress() + param;

		// 转换JSON字符为LIST列表
		try {
			String json = invokeService(url);
			ObjectMapper mapper = new ObjectMapper();
			TypeFactory typeFactory = TypeFactory.defaultInstance();
			result = mapper.readValue(json,
					typeFactory.constructCollectionType(List.class, clazz));
		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;
	}

	/**
	 * 服务调用与结果类型包装
	 * 
	 * @author allchin modified@2013年8月7日 上午10:20:20
	 * @param serviceURL
	 * @param clazz
	 * @return
	 * @throws JsonParseException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	@Transactional(readOnly = true)
	public String invokeService(String serviceURL) throws JsonParseException,
			JsonMappingException, IOException {

		String resultString = "";
		URL url = new URL(serviceURL);
		logger.info("url--" + url);

		URLConnection URLconnection = url.openConnection();
		HttpURLConnection httpConnection = (HttpURLConnection) URLconnection;
		int responseCode = httpConnection.getResponseCode();
		if (responseCode == HttpURLConnection.HTTP_OK) {

			// 获取查询结果
			InputStream urlStream = httpConnection.getInputStream();
			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(urlStream));
			String currentLine = "";
			while ((currentLine = bufferedReader.readLine()) != null) {
				resultString += currentLine;
			}

		} else {
			logger.error("!!Service query failed!!  " + serviceURL
					+ "  >responseCode:" + responseCode);
		}

		return resultString;

	}

	public void setServcieSettingHolder(
			ServcieSettingHolder servcieSettingHolder) {
		this.servcieSettingHolder = servcieSettingHolder;
	}

	public ServcieSettingHolder getServcieSettingHolder() {
		return servcieSettingHolder;
	}

	/**
	 * 根据URL求对应的X轴的坐标
	 * 
	 * @author zouzhixiang 20130924
	 * @param param
	 * @return
	 */
	public List<Object> getValueList(ServiceReqParam param, String type) {
		List<Object> List = new ArrayList<Object>();// 存储X轴的显示列表
		String appendUrl = "";
		try {
			appendUrl = getServiceAddress() + param;
		} catch (Exception e1) {
			logger.error("求对应的URL时报错了--" + e1);
		}
		logger.info("URL--" + appendUrl);
		URLConnection URLconnection = null;
		try {

			URL url = null;
			try {
				url = new URL(appendUrl);
			} catch (MalformedURLException e) {
				logger.error(e);
			}

			URLconnection = url.openConnection();
			HttpURLConnection httpConnection = (HttpURLConnection) URLconnection;
			int responseCode = httpConnection.getResponseCode();

			if (responseCode == HttpURLConnection.HTTP_OK) {
				List list = new ArrayList();
				// 获取查询结果
				list = returnList(httpConnection, CommonModel.class);

				// 分别表示，格式化前的格式和格式化后的格式
				String beforeFormat = "yyyy-MM-dd HH:mm:ss", afterFormat = "HH:mm";

				// 循环处理数据，组织成对应需要的数据
				int loop = list.size();

				if ("day".equals(param.getType())) {
					beforeFormat = "yyyy-MM-dd HH:mm:ss";
					afterFormat = "HH:mm";
					// // 只循环添加小于当前小时数的值
					// SimpleDateFormat shours = new SimpleDateFormat("HH");
					// Date date = new Date();
					// // 判断开始时间是否是今天
					// SimpleDateFormat todayFormat = new SimpleDateFormat(
					// "yyyy-M-d");
					// SimpleDateFormat todayFormat1 = new SimpleDateFormat(
					// "yyyy-MM-dd");
					//
					// if (param.getTfrom().equals(todayFormat.format(date))
					// || param.getTfrom().equals(
					// todayFormat1.format(date))) { // 如果是今天，则只显示到当前的小时
					// // 取配置项中配置的小时
					// int prefHours = (hours == "" ? 0 : Integer
					// .parseInt(hours));
					// int xiaoshi = Integer.parseInt(shours.format(date))
					// + prefHours;
					// if (list.size() > xiaoshi) {
					// loop = xiaoshi;
					// }
					// }
				} else if ("week".equals(param.getType())) {
					beforeFormat = "yyyy-MM-dd";
					afterFormat = "MM/dd";
					// if (list.size() <= 7) {
					// loop = list.size();
					// } else {
					// loop = 7;
					// }
				} else if ("month".equals(param.getType())) {
					beforeFormat = "yyyy-MM-dd";
					afterFormat = "MM/dd";
					loop = list.size();
				} else if ("year".equals(param.getType())) {
					beforeFormat = "yyyy-MM";
					afterFormat = "yyyy/MM";
					loop = list.size();
				}

				SimpleDateFormat sf = new SimpleDateFormat(beforeFormat);
				SimpleDateFormat sformat = new SimpleDateFormat(afterFormat);
				DecimalFormat df = new DecimalFormat("0.00"); // 格式化保留小数位数

				for (int i = 0; i < loop; i++) {
					CommonModel cm = (CommonModel) list.get(i);

					if (type != null && "time".equalsIgnoreCase(type)) { // 求X轴的数据
						try {
							Date nowtime = sf.parse(cm.getTime());
							List.add(sformat.format(nowtime));
						} catch (ParseException e) {
							List.add("");
							logger.error("求X轴的数据----" + e);
						}
					}

					if (type != null && "value".equalsIgnoreCase(type)) { // 求具体数值数据
						try {
							String datavalue = df.format(Double.parseDouble(cm
									.getValue()));
							List.add(Double.parseDouble(datavalue));
						} catch (Exception e) {
							List.add(Double.parseDouble("0"));
							logger.error("求具体数值数据----" + e);
						}
					}
				}
			}
		} catch (IOException e) {
			logger.error(e);
		}

		return List;
	}

	/**
	 * 转换List
	 * 
	 * @author zouzhixiang 20130924
	 * @param httpConnection
	 * @param c_lass
	 * @return
	 */
	private List returnList(HttpURLConnection httpConnection, Class c_lass) {
		List list = new ArrayList();
		String resultString = "";
		InputStream urlStream;
		try {
			urlStream = httpConnection.getInputStream();

			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(urlStream));
			String currentLine = "";
			while ((currentLine = bufferedReader.readLine()) != null) {
				resultString += currentLine;
			}

			// 转换接收到的json字符为list列表
			ObjectMapper mapper = new ObjectMapper();
			TypeFactory typeFactory = TypeFactory.defaultInstance();
			list = mapper.readValue(resultString.toLowerCase(),
					typeFactory.constructCollectionType(List.class, c_lass));
		} catch (IOException e) {
			e.printStackTrace();
		}

		return list;
	}
}
