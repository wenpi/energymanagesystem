package com.managementsystem.energy.portlet.alarm.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationTargetException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletPreferences;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.type.TypeFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.managementsystem.energy.portlet.alarm.model.Prefsinfo;
import com.managementsystem.energy.portlet.alarm.model.TagInfo;
import com.managementsystem.util.BeanUtil;

@Service
public class AlarmServiceImpl implements AlarmService {

	private final Log logger = LogFactory.getLog(AlarmServiceImpl.class);

	@Transactional(readOnly = true)
	public Prefsinfo getPrefsinfo(PortletPreferences prefs) {
		if (prefs.getMap().size() == 0)
			return null;
		Prefsinfo prefsinfo = new Prefsinfo();
		return (Prefsinfo) BeanUtil.setProperty(prefs.getMap(), prefsinfo);
	}

	@SuppressWarnings("rawtypes")
	@Transactional
	public void savePrefsinfo(PortletPreferences prefs, Prefsinfo prefsinfo)
			throws IllegalAccessException, InvocationTargetException,
			NoSuchMethodException, Exception {
		Map mapField;
		mapField = BeanUtils.describe(prefsinfo);
		Object[] keyValuePairs = mapField.entrySet().toArray();
		for (int i = 0; i < keyValuePairs.length; i++) {
			Map.Entry entry = (Map.Entry) keyValuePairs[i];
			String key = entry.getKey().toString();
			String val = entry.getValue() == null ? "" : entry.getValue()
					.toString();
			prefs.setValue(key, val);
		}
		prefs.store();
	}

	@Override
	public List<TagInfo> getAlarmList(Prefsinfo prefsinfo, String from,
			String to) {
		String wsUrl = prefsinfo.getSettingWsUrl().trim();
		if (wsUrl == null || wsUrl.length() == 0)
			return null;
		if (prefsinfo.getQueryType() != null)
			wsUrl += "/alarm/" + prefsinfo.getQueryType() + "/list";
		wsUrl += "?t=" + Calendar.getInstance().getTimeInMillis();
		if (prefsinfo.getDevicename() != null
				&& prefsinfo.getDevicename().trim().length() > 0) {
			wsUrl += "&devicename=" + prefsinfo.getDevicename().trim();
		}

		if(prefsinfo.getTagname()!=null && prefsinfo.getTagname().trim().length()>0) {
			wsUrl += "&tagname=" + prefsinfo.getTagname().trim();
		}
		if(prefsinfo.getGroupname()!=null && prefsinfo.getGroupname().trim().length()>0) {
			wsUrl += "&groupname=" + prefsinfo.getGroupname().trim();
		}
	
		if (prefsinfo.getCount() > 0) {
			wsUrl += "&count=" + prefsinfo.getCount();
		}
		List<TagInfo> list = new ArrayList<TagInfo>();
		String resultString = "";
		URL url = null;
		try {
			url = new URL(wsUrl);
		} catch (MalformedURLException e) {
			e.printStackTrace();
			logger.error(e);
		}
		URLConnection URLconnection = null;
		try {
			URLconnection = url.openConnection();
			HttpURLConnection httpConnection = (HttpURLConnection) URLconnection;
			int responseCode = httpConnection.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				logger.info(url);
				// 获取查询结果
				InputStream urlStream = httpConnection.getInputStream();
				BufferedReader bufferedReader = new BufferedReader(
						new InputStreamReader(urlStream));
				String currentLine = "";
				while ((currentLine = bufferedReader.readLine()) != null) {
					resultString += currentLine;
				}
				// 转换JSON字符为LIST列表
				ObjectMapper mapper = new ObjectMapper();
				// mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,
				// false);
				TypeFactory typeFactory = TypeFactory.defaultInstance();
				list = mapper.readValue(resultString.toLowerCase(), typeFactory
						.constructCollectionType(List.class, TagInfo.class));
				logger.info("query result size:" + list.size());
			} else {
				logger.warn("HttpURLConnection StatusCode:" + responseCode);
			}
		} catch (IOException e) {
			e.printStackTrace();
			logger.error(e);
		}
		return list;
	}

}
