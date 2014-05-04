package com.managementsystem.energy.portlet.chart.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.portlet.ActionRequest;
import javax.portlet.PortletPreferences;

import org.apache.commons.lang.time.StopWatch;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.validator.routines.DateValidator;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.type.TypeFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Buildsettinginfo;
import com.managementsystem.energy.domain.Circuitinfo;
import com.managementsystem.energy.domain.Energyitemdict;
import com.managementsystem.energy.domain.Meteruseattribute;
import com.managementsystem.energy.portlet.chart.Energyformula;
import com.managementsystem.energy.portlet.chart.model.BaseEntity;
import com.managementsystem.energy.portlet.chart.model.Chartsetting;
import com.managementsystem.energy.portlet.chart.model.QueryType;
import com.managementsystem.energy.portlet.chart.model.Queryresult;
import com.managementsystem.energy.portlet.chart.model.ReportSetting;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.CircuitinfoService;
import com.managementsystem.energy.service.EnergyitemdictService;
import com.managementsystem.energy.service.MeteruseinfoService;
import com.managementsystem.energy.service.ReadmeterService;
import com.managementsystem.util.BeanUtil;

@Service
public class ChartServiceImpl implements ChartService {

	private final Log logger = LogFactory.getLog(ChartServiceImpl.class);

	@Autowired
	private BuildService buildService;

	@Autowired
	private EnergyitemdictService energyitemdictService;

	@Autowired
	private MeteruseinfoService meteruseinfoService;

	@Autowired
	private CircuitinfoService circuitinfoService;



	@Transactional(readOnly = true)
	public Chartsetting getChartsetting(PortletPreferences prefs) {
		if (prefs.getMap().size() == 0)
			return null;
		Chartsetting setting = new Chartsetting();
		return (Chartsetting) BeanUtil.setProperty(prefs.getMap(), setting);
	}

	@Transactional(readOnly = true)
	public ReportSetting getReportSetting(PortletPreferences prefs) {
		if (prefs.getMap().size() == 0)
			return null;
		ReportSetting reportSetting = new ReportSetting();
		return (ReportSetting) BeanUtil.setProperty(prefs.getMap(),
				reportSetting);
	}
	
	/**
	 * 
	 通过protlet首选项map中的一部分，构造ReportSetting
	 @author allchin
	 modified@2013年8月1日 上午10:00:41
	 * @param prefs  原始portlet首选项
	 * @param partId 抓取第几部分
	 * @param base 共几部分
	 * @return
	 * 
	 * @Deprecated  貌似这种分割方式不对。。。
	 */
	
	@Transactional(readOnly = true)
	public   ReportSetting getReportSettingPartly(PortletPreferences prefs,int partId,int base) {
		if (prefs.getMap().size() == 0)
			return null;
		ReportSetting reportSetting = new ReportSetting();
		Map<String, String[]> fullMap=prefs.getMap();
		//
		int fromIdx=0;
		int endIdx=0;
		Map<String, String[]> partlyMap=new LinkedHashMap<String, String[]>();
		//
		int perPartSize=(fullMap.size() % base ==0) ?(fullMap.size()/base) :(fullMap.size()+1);
		endIdx=perPartSize *partId -1;
		endIdx=endIdx>fullMap.size() ?fullMap.size():endIdx;
		
		fromIdx=endIdx-perPartSize+1;
		//
		
		for(String key:prefs.getMap().keySet()){
			if(fromIdx<= endIdx){
				partlyMap.put(key, prefs.getMap().get(key));
				fromIdx++;
			}
			else{
				break;
			}
		}
		
		//
		return (ReportSetting) BeanUtil.setProperty(partlyMap,
				reportSetting);
	}

	@Override
	public String[] getTagids(ActionRequest request,BaseEntity entity) {
		
		StringBuilder sb = new StringBuilder();
		StringBuilder sbTagid = new StringBuilder();
		Energyformula formula = new Energyformula();
		
		int tagLen = 30;
		if(entity!=null) {
			String ids = entity.getFormula();
			if(StringUtils.hasLength(ids)) {
				tagLen = ids.split(",").length;
			}
		}
	
		// 处理序列
		for (int no = 1; no <= tagLen; no++) {
			String categoryName = "category" + no; // 序列名称
			String paramName = "serie" + no; // 序列值
			if (request.getParameter(paramName) != null) {
				String paramValue = "", categroyValue = "";
				paramValue = request.getParameter(paramName).trim();
				if (request.getParameter(categoryName) != null) {
					categroyValue = request.getParameter(categoryName).trim();
				}
				if (paramValue != null) {
					if (sb.length() > 0)
						sb.append(",");
					if (sbTagid.length() > 0)
						sbTagid.append(",");
					if (paramValue == null || paramValue.length() == 0)
						paramValue = " ";
					if (categroyValue == null || categroyValue.length() == 0)
						categroyValue = " ";
					sb.append(categroyValue + ":" + paramValue); // 序列保存格式为
																	// 序列名称:序列值
					// 转换公试
					formula.setFormula(paramValue);
					sbTagid.append(categroyValue + ":" + formula.getTagids());
				}
			}
		} // 结束

		String[] arr = new String[2];
		arr[0] = sb.toString();
		arr[1] = sbTagid.toString();
		return arr;
	}

	@Transactional(readOnly = true)
	public Map<String, Object> getFusionChartSetting(Chartsetting chartsetting) {
		Map<String, Object> settings = new HashMap<String, Object>();
		if (chartsetting == null)
			return settings;
		settings.put("caption", chartsetting.getCaption());
		if (StringUtils.hasLength(chartsetting.getSubcaption())) {
			settings.put("subcaption", chartsetting.getSubcaption());
		}
		if (StringUtils.hasLength(chartsetting.getXaxisname())) {
			settings.put("xaxisname", chartsetting.getXaxisname());
		}
		if (chartsetting.isUsePyaxisname()) {
			if (StringUtils.hasLength(chartsetting.getPyaxisname())) {
				settings.put("pyaxisname", chartsetting.getPyaxisname());
			}
			if (StringUtils.hasLength(chartsetting.getSyaxisname())) {
				settings.put("syaxisname", chartsetting.getSyaxisname());
			}
		} else {
			if (StringUtils.hasLength(chartsetting.getYaxisname())) {
				settings.put("yaxisname", chartsetting.getYaxisname());
			}
		}

		if (StringUtils.hasLength(chartsetting.getPalette())) {
			settings.put("palette", chartsetting.getPalette());
		}

		settings.put("showValues", chartsetting.getShowValues());
		settings.put("formatNumber", chartsetting.getFormatNumber());
		settings.put("formatNumberScale", chartsetting.getFormatNumberScale());

		if (StringUtils.hasLength(chartsetting.getPaletteColors())) {
			settings.put("paletteColors", chartsetting.getPaletteColors());
		}
		if (chartsetting.getDecimals() >= 0) {
			settings.put("decimals", chartsetting.getDecimals());
		}
		if (StringUtils.hasLength(chartsetting.getNumberprefix())) {
			settings.put("numberprefix", chartsetting.getNumberprefix());
		}
		if (StringUtils.hasLength(chartsetting.getNumbersuffix())) {
			settings.put("numbersuffix", chartsetting.getNumbersuffix());
		}
		if (StringUtils.hasLength(chartsetting.getXaxismaxvalue())) {
			settings.put("xaxismaxvalue", chartsetting.getXaxismaxvalue());
		}
		if (StringUtils.hasLength(chartsetting.getXaxisminvalue())) {
			settings.put("xaxisminvalue", chartsetting.getXaxisminvalue());
		}
		if (StringUtils.hasLength(chartsetting.getYaxismaxvalue())) {
			settings.put("yaxismaxvalue", chartsetting.getYaxismaxvalue());
		}
		if (StringUtils.hasLength(chartsetting.getBgImage())) {
			settings.put("bgImage", chartsetting.getBgImage());

			if (chartsetting.getBgImageAlpha() > 0) {
				settings.put("bgImageAlpha", chartsetting.getBgImageAlpha());
			}
			if (chartsetting.getScale() > 0) {
				settings.put("scale", chartsetting.getScale());
			}
			if (StringUtils.hasLength(chartsetting.getBgImageHAlign())) {
				settings.put("bgImageHAlign", chartsetting.getBgImageHAlign());
			}
			if (StringUtils.hasLength(chartsetting.getBgImageVAlign())) {
				settings.put("bgImageVAlign", chartsetting.getBgImageVAlign());
			}
			if (StringUtils.hasLength(chartsetting.getBgImageDisplayMode())) {
				settings.put("bgImageDisplayMode",
						chartsetting.getBgImageDisplayMode());
			}
		}

		String labelDisplay = chartsetting.getLabelDisplay();
		if (!"none".equals(labelDisplay)) {
			settings.put("labelDisplay", labelDisplay);
			int slantLabels = chartsetting.getSlantLabels();
			if ("rotate".equals(labelDisplay)) {
				settings.put("slantLabels", slantLabels);
			}

		}

		return settings;
	}

	@Transactional(readOnly = true)
	public Map<String, Object> getFusionChartTrendlines(
			Chartsetting chartsetting) {
		if (chartsetting.getIsTrendZone() == 0)
			return null;
		Map<String, Object> params = new HashMap<String, Object>();
		if (StringUtils.hasLength(chartsetting.getStartValue())) {
			params.put("startvalue", chartsetting.getStartValue());
		}
		if (StringUtils.hasLength(chartsetting.getEndValue())) {
			params.put("endvalue", chartsetting.getEndValue());
		}
		if (StringUtils.hasLength(chartsetting.getDisplayValue())) {
			params.put("displayvalue", chartsetting.getDisplayValue());
		}
		if (StringUtils.hasLength(chartsetting.getColor())) {
			params.put("color", chartsetting.getColor());
		}
		if (chartsetting.getShowOnTop() == 1) {
			params.put("showontop", chartsetting.getShowOnTop());
		}
		if (StringUtils.hasLength(chartsetting.getThickness())) {
			params.put("thickness", chartsetting.getThickness());
		}
		if (StringUtils.hasLength(chartsetting.getAlpha())) {
			params.put("alpha", chartsetting.getAlpha());
		}
		if (StringUtils.hasLength(chartsetting.getDashed())) {
			params.put("dashed", chartsetting.getDashed());
		}
		if (StringUtils.hasLength(chartsetting.getDashLen())) {
			params.put("dashlen", chartsetting.getDashLen());
		}
		if (StringUtils.hasLength(chartsetting.getDashGap())) {
			params.put("dashgap", chartsetting.getDashGap());
		}
		if (chartsetting.getValueOnRight() > 0) {
			params.put("valueonright", chartsetting.getValueOnRight());
		}
		if (StringUtils.hasLength(chartsetting.getToolText())) {
			params.put("tooltext", chartsetting.getToolText());
		}

		List<Map<String, Object>> lines = new ArrayList<Map<String, Object>>();
		lines.add(params);
		Map<String, Object> line = new HashMap<String, Object>();
		line.put("line", lines);
		return line;
	}

	@Transactional(readOnly = true)
	public String getCompareDate(Chartsetting chartsetting, String from,
			String to, String cfrom) {
		String queryStartdate = getQueryStartdatetime(chartsetting, from, to);
		if ("".equals(queryStartdate)) {
			return "";
		}
		Calendar cal = Calendar.getInstance();
		Date startdate = parseDate(queryStartdate);
		cal.setTime(startdate);
		if ("yestoday".equals(cfrom)) {
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH),
					cal.get(Calendar.DATE) - 1);
		} else if ("lastweek".equals(cfrom)) {
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH),
					cal.get(Calendar.DATE) - 7);
		} else if ("lastmonth".equals(cfrom)) {
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) - 1,
					cal.get(Calendar.DATE));
		} else {
			cal.setTime(parseDate(cfrom));
		}
		return new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	}

	@Transactional(readOnly = true)
	public List<Queryresult> getQueryresult(Chartsetting chartsetting,
			String tagids, String from, String to, String count) {

		List<Queryresult> list = new ArrayList<Queryresult>();
		String tagUrl = getQueryUrl(chartsetting, tagids, from, to, count);
		logger.info("remote request url is:" + tagUrl);
		String resultString = "";
		URL url = null;
		try {
			url = new URL(tagUrl);
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
				TypeFactory typeFactory = TypeFactory.defaultInstance();
				list = mapper
						.readValue(resultString, typeFactory
								.constructCollectionType(List.class,
										Queryresult.class));
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

	@Transactional(readOnly = true)
	public List<Object> getSingleSeriesChartData(Chartsetting chartsetting,
			List<Queryresult> queryResults) {
		if (queryResults == null)
			return null;
		List<Object> returnList = new LinkedList<Object>();

		if (isEnabledFormula(chartsetting.getFormula())) {
			Map<String, String> formulas = getSerieFormulas(chartsetting
					.getFormula());
			if (formulas.size() == 1) {
				Energyformula formula = new Energyformula();
				formula.setFormula(getSingleSerieFormula(chartsetting
						.getFormula()));
				formula.setResultList(queryResults);
			}
		}
		// 默认保留两位小数
		DecimalFormat nf = new DecimalFormat("#.##");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		String dateFormat = getSeriesDatetimeFormat(chartsetting.getQueryType());

		// 显示序列，
		Iterator<Entry<String, String>> it = chartsetting.getTagidSeries()
				.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, String> entry = (Map.Entry<String, String>) it
					.next();
			String tagid = entry.getValue() == null ? "" : entry.getValue()
					.toString();

			List<String> tagidList = new ArrayList<String>();
			if (tagid.indexOf(",") > 0) {
				for (String id : tagid.split(",")) {
					tagidList.add(id);
				}
			} else {
				tagidList.add(tagid);
			}

			List<Map<String, String>> listCategory = getChartLabels(
					queryResults, tagidList, chartsetting.getQueryType());

			if (listCategory != null) {
				// 值相加
				for (Map<String, String> label : listCategory) {

					Map<String, Object> entryJson = new LinkedHashMap<String, Object>();
					Double countVal = 0d;
					String time = label.get("label");
					for (Queryresult qr : queryResults) {
						for (String tag : tagidList) {
							Date date;
							try {
								date = df.parse(qr.getTime());
								String qrTime = new SimpleDateFormat(dateFormat)
										.format(date);
								if (qr.getTagid().equals(tag)
										&& qrTime.equals(time)) {
									double tempVal = Double.parseDouble(qr
											.getVal());
									countVal += tempVal < 0 ? 0 : tempVal;
								}
							} catch (ParseException e) {
								e.printStackTrace();
							}
						}
					}
					entryJson.put("label", time);
					entryJson.put("value", nf.format(countVal));
					returnList.add(entryJson);
				}
			}
		}
		return returnList;
	}

	/**
	 * 获取占比图数据列表
	 * */
	@Transactional(readOnly = true)
	public List<Object> getPieChartData(Chartsetting chartsetting,
			List<Queryresult> queryResults) {
		if (queryResults == null)
			return null;
		// 定义返回结果列表对象
		List<Object> setlist = new LinkedList<Object>();

		// 图表设置序列
		Map<String, String> chartSeries = chartsetting.getTagidSeries();
		if (chartSeries.size() == 1) {
			return getSingleSeriesChartData(chartsetting, queryResults);
		}
		java.util.Iterator<Entry<String, String>> it = chartSeries.entrySet()
				.iterator();
		Energyformula formula = new Energyformula();

		while (it.hasNext()) {
			Map.Entry<String, String> entry = (Map.Entry<String, String>) it
					.next();
			String key = entry.getKey();
			String tagVal = entry.getValue();
			Map<String, Object> entryJson = new HashMap<String, Object>();
			entryJson.put("label", key);

			String[] arrTagVal = null;
			if (tagVal.indexOf(",") > 0) {
				arrTagVal = tagVal.split(",");
			} else {
				arrTagVal = new String[] { tagVal };
			}
			if (isEnabledFormula(chartsetting.getFormula())) {
				formula.setFormula(getSerieFormulaByKey(
						chartsetting.getFormula(), key));
				formula.setResultList(queryResults);
			}

			Map<String, Object> entryReport = new HashMap<String, Object>();
			entryReport.put("label", key);

			List<Queryresult> labeldata = new ArrayList<Queryresult>();
			// 值相加
			Double countVal = 0d;
			for (Queryresult qr : queryResults) {
				for (String tagid : arrTagVal) {
					if (qr.getTagid().equals(tagid)) {
						double tempVal = Double.parseDouble(qr.getVal());
						countVal += tempVal < 0 ? 0 : tempVal;
						labeldata.add(qr);
					}
				}
			}
			entryReport.put("data", labeldata);
			entryJson.put("value", countVal.toString());
			setlist.add(entryJson);
		}
		return setlist;
	}

	@Transactional(readOnly = true)
	public List<Object> getMultiSeriesCategories(List<Queryresult> resultlist,
			Chartsetting chartsetting) {
		List<Object> list = new ArrayList<Object>();
		Map<String, Object> mapCategory = new HashMap<String, Object>();
		List<String> tagidlist = chartsetting.getTagidlist();

		List<Map<String, String>> listCategory = getChartLabels(resultlist,
				tagidlist, chartsetting.getQueryType());

		mapCategory.put("category", listCategory);
		list.add(mapCategory);
		return list;
	}

	private List<Map<String, String>> getChartLabels(
			List<Queryresult> resultlist, List<String> tagidlist,
			String queryType) {
		if (tagidlist.size() == 0)
			return null;

		List<Map<String, String>> listCategory = new ArrayList<Map<String, String>>();

		String firstTagid = tagidlist.get(0);
		for (Queryresult qr : resultlist) {
			Map<String, String> mapLable = new LinkedHashMap<String, String>();
			if (qr.getTagid().equals(firstTagid)) {
				String dateFormat = getSeriesDatetimeFormat(queryType);
				try {
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					Date date = df.parse(qr.getTime());
					String ret = new SimpleDateFormat(dateFormat).format(date);
					mapLable.put("label", ret);
				} catch (ParseException e) {
					e.printStackTrace();
					mapLable.put("label", qr.getTime());
				}
				listCategory.add(mapLable);
			}
		}
		return listCategory;
	}

	@Transactional(readOnly = true)
	public List<Object> getMultiSeriesDataset(Chartsetting chartsetting,
			List<Queryresult> resultlist, String additionkey) {

		Map<String, String> series = chartsetting.getTagidSeries();

		List<Object> listResult = new LinkedList<Object>();
		Iterator<Entry<String, String>> it = series.entrySet().iterator();
		// 保留小数点后两位数
		DecimalFormat nf = new DecimalFormat("#.##");

		while (it.hasNext()) {
			Map.Entry<String, String> entry = (Map.Entry<String, String>) it
					.next();
			String key = entry.getKey();
			String tagid = entry.getValue() == null ? "" : entry.getValue()
					.toString();

			String[] arrTagIds = null;
			if (tagid.indexOf(",") > 0) {
				arrTagIds = tagid.split(",");
			} else {
				arrTagIds = new String[] { tagid };
			}

			Map<String, Object> mapDataset = new LinkedHashMap<String, Object>();
			if (additionkey != null && !"".equals(additionkey)) {
				key += "-" + additionkey;
			}
			mapDataset.put("seriesname", key);
			List<Object> listValues = new LinkedList<Object>();

			if (isEnabledFormula(chartsetting.getFormula())) {
				Energyformula formula = new Energyformula();
				formula.setFormula(getSerieFormulaByKey(
						chartsetting.getFormula(), key));
				formula.setResultList(resultlist); // 第一次计算
			}

			List<Map<String, String>> listCategory = null;
			listCategory = getChartLabels(resultlist,
					chartsetting.getTagidlist(), chartsetting.getQueryType());

			String dateFormat = getSeriesDatetimeFormat(chartsetting
					.getQueryType());
			if (listCategory != null) {
				// 值相加
				for (Map<String, String> label : listCategory) {
					Double countVal = 0d;
					String time = label.get("label");
					for (Queryresult qr : resultlist) {
						for (String tag : arrTagIds) {
							DateFormat df = new SimpleDateFormat(
									"yyyy-MM-dd HH:mm");
							Date date;
							try {
								date = df.parse(qr.getTime());
								String qrTime = new SimpleDateFormat(dateFormat)
										.format(date);
								if (qr.getTagid().equals(tag)
										&& qrTime.equals(time)) {
									double tempVal = Double.parseDouble(qr
											.getVal());
									countVal += tempVal < 0 ? 0 : tempVal;
								}
							} catch (ParseException e) {
								e.printStackTrace();
							}
						}
					}
					// logger.info("getMultiSeriesDataset,label:"+ label +
					// ",val:" + countVal);
					Map<String, String> mapValue = new LinkedHashMap<String, String>();
					mapValue.put("value", nf.format(countVal));
					listValues.add(mapValue);
				}
			}
			mapDataset.put("data", listValues);
			listResult.add(mapDataset);
		}
		return listResult;
	}

	public List<Object> getSeriesDataset(Chartsetting chartsetting,
			List<Queryresult> resultlist) {
		List<Object> listResult = new LinkedList<Object>();

		return listResult;
	}

	@Transactional(readOnly = true)
	public List<Object> getCompareSeriesCategories(Chartsetting chartsetting,
			List<Queryresult> queryResults) {

		List<Object> list = new LinkedList<Object>();
		Map<String, Object> mapCategory = new HashMap<String, Object>();
		List<Object> listCategory = new LinkedList<Object>();

		List<String> tagidlist = chartsetting.getTagidlist();
		if (tagidlist.size() == 0)
			return null;
		String firstTagid = tagidlist.get(0);
		// 取第一个tag
		for (Queryresult qr : queryResults) {
			Map<String, String> mapLable = new LinkedHashMap<String, String>();
			if (qr.getTagid().equals(firstTagid)) {
				// 这里取对比图表的日期格式
				String dateFormat = getComparisonDatetimeformat(chartsetting
						.getQueryType());
				try {
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					Date date = df.parse(qr.getTime());
					String ret = new SimpleDateFormat(dateFormat).format(date);
					mapLable.put("label", ret);
				} catch (ParseException e) {
					e.printStackTrace();
					mapLable.put("label", qr.getTime());
				}
				listCategory.add(mapLable);
			}
		}
		mapCategory.put("category", listCategory);
		list.add(mapCategory);
		return list;
	}

	@Transactional(readOnly = true)
	public List<Object> getCompareSeriesDataset(Chartsetting chartysetting,
			Map<String, List<Queryresult>> mapQueryresluts) {
		Iterator<Entry<String, List<Queryresult>>> it = mapQueryresluts
				.entrySet().iterator();
		List<Object> returnList = new LinkedList<Object>();
		while (it.hasNext()) {
			Map.Entry<String, List<Queryresult>> pairs = (Map.Entry<String, List<Queryresult>>) it
					.next();
			List<Queryresult> queryResults = pairs.getValue();
			String key = pairs.getKey();
			List<Object> seriesData = getMultiSeriesDataset(chartysetting,
					queryResults, key);
			returnList.addAll(seriesData);
		}
		return returnList;
	}

	/**
	 * 获取查询URL
	 * 
	 * http://172.16.96.2:8080//tag/history/query/p?tagid=3691&tfrom=2013-3-4T16
	 * :00:00&tto=2013-3-5T0:00:00&tspan=60
	 * 
	 * @param chartsetting
	 *            图表设置对象
	 * 
	 * @return 查询URL
	 * */
	private String getQueryUrl(BaseEntity chartsetting, String tagids,
			String from, String to, String count) {

		// 获取地址
		String buildId = chartsetting.getBuildId();
		Buildsettinginfo buildSettingInfo = buildService
				.getBuildsettinginfo(buildId);
		String wsUrl = buildSettingInfo.getSettingWsurl();

		if (!StringUtils.hasLength(wsUrl))
			return null;

		// 定义查询URL
		String queryUrl = wsUrl + "/tag/history/";
		// 查询类型
		queryUrl += chartsetting.getQueryType();
		if ("query".equals(chartsetting.getQueryType().toLowerCase())) {
			queryUrl += "/p?";
		} else {
			queryUrl += "/list?";
		}
		if (StringUtils.hasLength(tagids)) {
			queryUrl += "tagid=" + tagids;
		}

		// 开始时间
		String tfrom = from;
		if (!StringUtils.hasLength(tfrom)) {
			tfrom = getQueryStartdatetime(chartsetting, from, to);
		}
		queryUrl += "&tfrom=" + tfrom;

		// 结束时间
		if (!StringUtils.hasLength(to)) {
			if (StringUtils.hasLength(chartsetting.getDefEndtime())) {
				queryUrl += "&tto="
						+ getQueryEnddatetime(chartsetting, from, to);
			}
		} else {
			queryUrl += "&tto=" + to;
		}
		// 查询条数
		if (!StringUtils.hasLength(count)) {
			if (StringUtils.hasLength(chartsetting.getDefCount())) {
				queryUrl += "&count=" + chartsetting.getDefCount();
			}
		} else {
			queryUrl += "&count=" + count;
		}
		if ("query".equals(chartsetting.getQueryType().toLowerCase())) {
			String tspan = chartsetting.getTspan();
			if (StringUtils.hasLength(tspan)) {
				queryUrl += "&tspan=" + tspan;
			} else {
				queryUrl += "&tspan=3600";
			}
		}

		// 加当前时间防止缓存提交
		queryUrl += "&currtime=" + Calendar.getInstance().getTimeInMillis();
		queryUrl = queryUrl.replace(" ", "T");
		return queryUrl;
	}

	@Override
	public String getQueryStartdatetime(BaseEntity chartsetting, String from,
			String to) {
		return getChartQuerydatetime(chartsetting, true, from, to);
	}

	@Override
	public String getQueryEnddatetime(BaseEntity chartsetting, String from,
			String to) {
		return getChartQuerydatetime(chartsetting, false, from, to);
	}

	private String getChartQuerydatetime(BaseEntity chartsetting,
			boolean isStart, String from, String to) {
		// 默认时间格式
		String defDate = isStart ? chartsetting.getDefStarttime()
				: chartsetting.getDefEndtime();
		Calendar cal = Calendar.getInstance();
		String dateFormat = getDatetimeformat(chartsetting.getQueryType());

		if (!"".equals(from)
				&& isStart
				&& DateValidator.getInstance().validate(from, "yyyy-MM-dd") != null) {
			return from;
		}
		if (!"".equals(to)
				&& !isStart
				&& DateValidator.getInstance().validate(to, "yyyy-MM-dd") != null) {
			return to;
		}
		// 今天
		if ("today".equals(defDate)) {
			if(isStart) {
				cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH),
						cal.get(Calendar.DATE), 0, 0, 0);
			} else {
				cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH),
						cal.get(Calendar.DATE), 23, 59, 0);
			}
			
		} else if ("yesterday".equals(defDate)) { // 昨天
			cal.add(Calendar.DATE, -1);
		} else if ("firstofweek".equals(defDate)) { // 本周第一天
			int firstDayofweek = cal.getFirstDayOfWeek();
			cal.add(Calendar.DATE, -firstDayofweek);
		} else if ("firstofmonth".equals(defDate)) { // 本月第一天
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), 1, 0, 0, 0);
		} else if ("firstofyear".equals(defDate)) { // 本年第一天
			cal.set(cal.get(Calendar.DAY_OF_YEAR), 0, 1);
		} else if ("custom".equals(defDate)) {
			String start = chartsetting.getStarttimeValue(), end = chartsetting
					.getEndtimeValue();

			if ("".equals(start)) {
				cal.add(Calendar.DATE, -1);
				start = new SimpleDateFormat(dateFormat).format(cal.getTime());
			}
			if ("".equals(end)) {
				cal.add(Calendar.DATE, -1);
				end = new SimpleDateFormat(dateFormat).format(cal.getTime());
			}

			return isStart ? start : end;
		} else {
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH),
					cal.get(Calendar.DATE), 0, 0, 0);
		}
		return new SimpleDateFormat(dateFormat).format(cal.getTime());
	}

	private Date parseDate(String src) {
		DateFormat df = null;
		if (src.indexOf(":") > 0) {
			df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		} else {
			df = new SimpleDateFormat("yyyy-MM-dd");
		}
		Date ret;
		try {

			ret = df.parse(src);
		} catch (ParseException e) {
			e.printStackTrace();
			ret = new Date();
		}
		return ret;
	}

	/**
	 * 跟据查询类型,获取对应的日期格式
	 * <p>
	 * 查询类型如下:usage:任意时间,dayreport:用量日报 weekreport:用量周报
	 * monthreport:用量月报,yearreport:用量年报,accum:原始抄表
	 * </p>
	 * 
	 * @param queryType
	 *            查询类型
	 * 
	 * @return 日期格式化字符
	 * */
	private String getDatetimeformat(String queryType) {
		String dateformat = "";
		if ("dayreport".equals(queryType)) {
			dateformat = "yyyy-MM-dd HH:mm";
		} else if ("weekreport".equals(queryType)) {
			dateformat = "yyyy-MM-dd";
		} else if ("monthreport".equals(queryType)) {
			dateformat = "yyyy-MM-dd";
		} else if ("yearreport".equals(queryType)) {
			dateformat = "yyyy-MM-dd";
		} else {
			dateformat = "yyyy-MM-dd HH:mm";
		}
		return dateformat;
	}

	private String getSeriesDatetimeFormat(String queryType) {
		String dateformat = "";
		if ("dayreport".equals(queryType)) {
			dateformat = "HH:mm";
		} else if ("weekreport".equals(queryType)) {
			dateformat = "MM-dd";
		} else if ("monthreport".equals(queryType)) {
			dateformat = "MM-dd";
		} else if ("yearreport".equals(queryType)) {
			dateformat = "yy-MM";
		} else if ("yearreport".equals(queryType)) {
			dateformat = "yyyy-MM-dd HH:mm";
		} else {
			dateformat = "yy-MM-dd HH:mm";
		}
		return dateformat;
	}

	/**
	 * 获取对比图表时间格式化字符
	 * 
	 * @param queryType
	 *            查询类型
	 * @return 对比图表时间格式化字符
	 * */
	private String getComparisonDatetimeformat(String queryType) {
		String dateformat = "";
		if ("dayreport".equals(queryType)) {
			dateformat = "HH:mm";
		} else if ("weekreport".equals(queryType)) {
			dateformat = "dd";
		} else if ("monthreport".equals(queryType)) {
			dateformat = "dd";
		} else if ("yearreport".equals(queryType)) {
			dateformat = "MM";
		} else {
			dateformat = "HH:mm";
		}
		return dateformat;
	}

	/**
	 * 获取序列公式
	 * */
	public Map<String, String> getSerieFormulas(String formula) {
		if (formula == null || "".equals(formula)) {
			return null;
		}
		Map<String, String> mapSeries = new LinkedHashMap<String, String>();
		if (formula.indexOf(",") > 0) {
			// 分割所有序列
			String[] arrtagids = formula.split(",");
			for (int i = 0; i < arrtagids.length; i++) {
				String serie = arrtagids[i];
				// 分割序列键值
				if (serie.indexOf(":") > 0) {
					String[] arrSerie = serie.split(":");
					if (arrSerie[0].trim().length() > 0
							&& arrSerie[1].trim().length() > 0) {
						mapSeries.put(arrSerie[0].trim(), arrSerie[1].trim());
					}
				}
			}
		}
		return mapSeries;
	}

	/**
	 * 获取指定的序列公式
	 * 
	 * @param key
	 *            序列标题
	 * */
	public String getSerieFormulaByKey(String formula, String key) {
		return getSerieFormulas(formula).get(key);
	}

	/**
	 * 是否启用公式
	 * */
	public boolean isEnabledFormula(String formula) {
		boolean ret = false;
		if (formula.indexOf("*") > -1 || formula.indexOf("/") > -1
				|| formula.indexOf("+") > -1 || formula.indexOf("-") > -1
				|| formula.indexOf("(") > -1 || formula.indexOf(")") > -1) {
			ret = true;
		}
		return ret;
	}

	/**
	 * 返回单序列公式
	 * */
	public String getSingleSerieFormula(String strformula) {
		String ret = "";
		Map<String, String> formula = getSerieFormulas(strformula);
		if (formula.size() == 1) {
			java.util.Iterator<Entry<String, String>> it = formula.entrySet()
					.iterator();
			while (it.hasNext()) {
				Map.Entry<String, String> entry = (Map.Entry<String, String>) it
						.next();
				return entry.getValue();
			}
		}
		return ret;
	}

	@Transactional(readOnly = true)
	public List<Queryresult> getQueryresult(String wsurl)
			throws NullPointerException, MalformedURLException, IOException,
			Exception {

		String resultString = "";
		URL url = new URL(wsurl);
		List<Queryresult> list = new ArrayList<Queryresult>();

		URLConnection URLconnection = url.openConnection();
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
			TypeFactory typeFactory = TypeFactory.defaultInstance();
			list = mapper.readValue(resultString, typeFactory
					.constructCollectionType(List.class, Queryresult.class));
			logger.info("query result size:" + list.size());
		} else {
			logger.warn("HttpURLConnection StatusCode:" + responseCode);
		}

		return list;
	}

	@Transactional(readOnly = true)
	public Map<String, Object> getMultiSeriesChartForEnergyitemdict(
			Chartsetting chartsetting, Map<String, Object> reportDetailData) {

		Map<String, Object> chartElementMap = new HashMap<String, Object>();
		Map<String, Object> mapCategory = new HashMap<String, Object>();
		List<Object> listDataset = new ArrayList<Object>();
		// 时间序列
		List<String> serieTimes = new ArrayList<String>();

		List<Queryresult> tempQr = null;

		int index = 0;

		Set<Buildinfo> buildinfos = null;
		// 获取查询数据来源类型
		String datasrctype = chartsetting.getDatasourcetype();
		// 来源类型为平台,则取气候区对应的所有建筑
		if ("bigdistrictrelainfo".equals(datasrctype)) {
			String bigdistrictId = chartsetting.getDatasourceid();
			buildinfos = buildService
					.getBuildinfosByBigdistrictId(bigdistrictId);
		}

		// 获取能耗分类项
		Set<Energyitemdict> energyitemdicts = energyitemdictService
				.getEnergyitemdictsByType();
		Buildinfo buildinfo = null;
		Buildsettinginfo settinginfo = null;
		Energyitemdict energyitemdict = null;
		String wsUrl = null, tagids = null;
		for (Iterator<Energyitemdict> iterator = energyitemdicts.iterator(); iterator
				.hasNext();) {
			energyitemdict = (Energyitemdict) iterator.next();
			List<Queryresult> result = null;
			BigDecimal itemEnergyVal = null;
			// 迭代建筑
			if (buildinfos == null)
				continue;
			Map<String, Object> buildEnergy = new HashMap<String, Object>();
			for (Iterator<Buildinfo> it = buildinfos.iterator(); it.hasNext();) {
				buildinfo = (Buildinfo) it.next();
				settinginfo = buildinfo.getBuildsettinginfo();
				if (settinginfo != null) {
					wsUrl = settinginfo.getSettingWsurl();
					chartsetting.setSettingWsUrl(wsUrl);
					// 获取当前建筑指定的能耗分类分项代码的设备属性
					List<Meteruseattribute> attributelist = meteruseinfoService
							.getMeteruseattributesByEnergyitemcode(
									buildinfo.getBuildId(),
									energyitemdict.getEnergyItemcode());
					tagids = meteruseinfoService
							.getMeteruseattributesByEnergyitemcodeToString(attributelist);
					// get WebService Query URL
					wsUrl = getQueryUrl(chartsetting, tagids,
							chartsetting.getStarttimeValue(),
							chartsetting.getEndtimeValue(),
							chartsetting.getDefCount());
					try {
						if (result == null)
							result = new ArrayList<Queryresult>();
						tempQr = getQueryresult(wsUrl);
						result.addAll(tempQr);
						// 取第一个TagID根据报表类型,建立日期X轴
						if (index == 0) {
							index++;
							mapCategory = getMultiSeriesChartCategories(result,
									chartsetting.getQueryType(), serieTimes);
						}

						itemEnergyVal = getEnergySumVal(tempQr, energyitemdict
								.getEnergydict().getEnergydictRate());
						buildEnergy
								.put(buildinfo.getBuildName(), itemEnergyVal
										.setScale(2, RoundingMode.HALF_UP));

					} catch (NullPointerException e) {
						e.printStackTrace();
					} catch (MalformedURLException e) {

						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					} catch (Exception e) {

						e.printStackTrace();
					}
				}
			}
			Map<String, Object> mapDataset = new LinkedHashMap<String, Object>();
			mapDataset.put("seriesname", energyitemdict.getEnergyItemname());
			List<Object> sumValfortime = new LinkedList<Object>();
			for (String timeVal : serieTimes) {
				itemEnergyVal = getEnergySumVal(result, energyitemdict
						.getEnergydict().getEnergydictRate(), timeVal);
				Map<String, Object> mapValue = new LinkedHashMap<String, Object>();
				mapValue.put("value", itemEnergyVal);
				sumValfortime.add(mapValue);
			}
			reportDetailData.put(energyitemdict.getEnergyItemname(),
					buildEnergy);
			mapDataset.put("data", sumValfortime);

			listDataset.add(mapDataset);
		}

		Map<String, Object> chart = getFusionChartSetting(chartsetting);
		chartElementMap.put("chart", chart);
		chartElementMap.put("categories", mapCategory);
		chartElementMap.put("dataset", listDataset);

		return chartElementMap;
	}

	@Transactional(readOnly = true)
	public Map<String, Object> getMultiSeriesChartForContrastEnergyitemdict(
			Chartsetting chartsetting, Map<String, Object> reportDetailData) {
		// 保存ChartJsonData
		Map<String, Object> chartElementMap = new HashMap<String, Object>();
		// save chart category element
		Map<String, Object> mapCategory = new HashMap<String, Object>();
		// save chart dataset element
		List<Object> listDataset = new ArrayList<Object>();
		// 时间序列
		List<String> serieTimes = new ArrayList<String>();

		int index = 0;

		Map<String, Object> chart = getFusionChartSetting(chartsetting);

		// 没有建筑ID则返回
		List<String> ids = parseDatasourceid(chartsetting.getDatasourceid());
		if (ids == null || chartsetting.getEnergyitemcode() == null) {
			chartElementMap.put("chart", chart);
			chartElementMap.put("categories", mapCategory);
			chartElementMap.put("dataset", listDataset);
			return chartElementMap;
		}

		Buildinfo buildinfo = null;
		Buildsettinginfo settinginfo = null;
		Energyitemdict energyitemdict = energyitemdictService
				.getEnergyitemdict(chartsetting.getEnergyitemcode());

		List<Queryresult> result = null;
		List<Meteruseattribute> attributelist = null;
		BigDecimal itemEnergyVal = null;
		String wsUrl = null, tagids = null;
		// Map<String,Object> buildEnergyVal = new HashMap<String,Object>();
		for (String buildId : ids) {
			buildinfo = buildService.getBuildinfo(buildId);
			settinginfo = buildinfo.getBuildsettinginfo();
			if (settinginfo == null)
				continue;
			try {
				wsUrl = settinginfo.getSettingWsurl();
				chartsetting.setSettingWsUrl(wsUrl);
				// 装表列表
				attributelist = meteruseinfoService
						.getMeteruseattributesByEnergyitemcode(
								buildinfo.getBuildId(),
								chartsetting.getEnergyitemcode());
				tagids = meteruseinfoService
						.getMeteruseattributesByEnergyitemcodeToString(attributelist);
				// set WebService Query URL
				wsUrl = getQueryUrl(chartsetting, tagids,
						chartsetting.getStarttimeValue(),
						chartsetting.getEndtimeValue(),
						chartsetting.getDefCount());
				result = getQueryresult(wsUrl);
				// 取第一个TagID根据报表类型,建立日期X轴
				if (index == 0) {
					index++;
					mapCategory = getMultiSeriesChartCategories(result,
							chartsetting.getQueryType(), serieTimes);
				}

				itemEnergyVal = getEnergySumVal(result, energyitemdict
						.getEnergydict().getEnergydictRate());
				// buildEnergyVal.put(buildinfo.getBuildName(),
				// itemEnergyVal.setScale(2, RoundingMode.HALF_UP));

			} catch (NullPointerException e) {
				e.printStackTrace();
			} catch (MalformedURLException e) {

				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {

				e.printStackTrace();
			}

			Map<String, Object> mapDataset = new LinkedHashMap<String, Object>();
			// 报表明细列对象
			Map<String, Object> mapReportdetail = new LinkedHashMap<String, Object>();
			mapDataset.put("seriesname", buildinfo.getBuildName());
			List<Object> sumValfortime = new LinkedList<Object>();
			for (String timeVal : serieTimes) {
				itemEnergyVal = getEnergySumVal(result, energyitemdict
						.getEnergydict().getEnergydictRate(), timeVal);
				itemEnergyVal = itemEnergyVal.setScale(2, RoundingMode.HALF_UP);
				Map<String, Object> mapValue = new LinkedHashMap<String, Object>();
				mapValue.put("value", itemEnergyVal);
				sumValfortime.add(mapValue);
				// 添加报表明细行数据
				mapReportdetail.put(timeVal, itemEnergyVal);
			}
			reportDetailData.put(buildinfo.getBuildName(), mapReportdetail);
			mapDataset.put("data", sumValfortime);

			listDataset.add(mapDataset);
		}

		chartElementMap.put("chart", chart);
		chartElementMap.put("categories", mapCategory);
		chartElementMap.put("dataset", listDataset);

		return chartElementMap;
	}

	@Transactional(readOnly = true)
	public Map<String, Object> getMultiSeriesChartForContrastCircuit(
			Chartsetting chartsetting, Map<String, Object> reportDetailData) {
		// 保存ChartJsonData
		Map<String, Object> chartElementMap = new HashMap<String, Object>();
		// save chart category element
		Map<String, Object> mapCategory = new HashMap<String, Object>();
		// save chart dataset element
		List<Object> listDataset = new ArrayList<Object>();
		// 时间序列
		List<String> serieTimes = new ArrayList<String>();

		List<String> messages = new ArrayList<String>();
		int index = 0;

		Map<String, Object> chart = getFusionChartSetting(chartsetting);

		// 支路ID
		List<String> ids = parseDatasourceid(chartsetting.getDatasourceid());
		if (ids == null) {
			chartElementMap.put("chart", chart);
			chartElementMap.put("categories", mapCategory);
			chartElementMap.put("dataset", listDataset);
			messages.add("支路ID为空");
			return chartElementMap;
		}

		Buildinfo buildinfo = null;
		Buildsettinginfo settinginfo = null;
		List<Queryresult> result = null;
		List<Meteruseattribute> attributelist = null;
		BigDecimal itemEnergyVal = null;
		String wsUrl = null, tagids = null;

		Map<String, String> mapTagids = new LinkedHashMap<String, String>();

		for (String circuitId : ids) {
			Circuitinfo circuitinfo = circuitinfoService
					.getCircuitinfo(circuitId);
			buildinfo = circuitinfo.getBuildinfo();
			if (buildinfo != null)
				settinginfo = buildinfo.getBuildsettinginfo();
			if (settinginfo == null) {
				messages.add(String.format("支路ID:%s对应的建筑网络地址未设置", circuitId));
				continue;
			}
			wsUrl = settinginfo.getSettingWsurl();
			chartsetting.setSettingWsUrl(wsUrl);
			attributelist = meteruseinfoService
					.getMeteruseattributeByCircuitId(circuitId);
			tagids = meteruseinfoService
					.getMeteruseattributesByEnergyitemcodeToString(attributelist);
			mapTagids.put(circuitinfo.getCircuitName(), tagids);

			tagids = null;
			String childtagids = "";
			Set<Circuitinfo> childCircuitinfos = circuitinfo.getCircuitinfos();
			if (childCircuitinfos != null) {
				for (Iterator<Circuitinfo> it = childCircuitinfos.iterator(); it
						.hasNext();) {
					Circuitinfo c = (Circuitinfo) it.next();
					if (c != null) {
						attributelist = meteruseinfoService
								.getMeteruseattributeByCircuitId(circuitId);
						childtagids += meteruseinfoService
								.getMeteruseattributesByEnergyitemcodeToString(attributelist);
					}
				}
				if (childCircuitinfos.size() > 0) {
					mapTagids.put(circuitinfo.getCircuitName() + "下级支路",
							childtagids);
				}
			}

			Iterator mit = mapTagids.entrySet().iterator();
			while (mit.hasNext()) {
				Map.Entry entry = (Map.Entry) mit.next();
				String key = (String) entry.getKey();
				String tagid = (String) entry.getValue();
				try {
					// set WebService Query URL
					wsUrl = getQueryUrl(chartsetting, tagid,
							chartsetting.getStarttimeValue(),
							chartsetting.getEndtimeValue(),
							chartsetting.getDefCount());
					result = getQueryresult(wsUrl);
					// 取第一个TagID根据报表类型,建立日期X轴
					if (index == 0) {
						index++;
						mapCategory = getMultiSeriesChartCategories(result,
								chartsetting.getQueryType(), serieTimes);
					}
					// itemEnergyVal = getEnergySumVal(result, null);
				} catch (NullPointerException e) {
					e.printStackTrace();
				} catch (MalformedURLException e) {

					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} catch (Exception e) {

					e.printStackTrace();
				}

				Map<String, Object> mapDataset = new LinkedHashMap<String, Object>();

				// 报表明细列对象
				Map<String, Object> mapReportdetail = new LinkedHashMap<String, Object>();
				mapDataset.put("seriesname", key);
				List<Object> sumValfortime = new LinkedList<Object>();
				for (String timeVal : serieTimes) {
					itemEnergyVal = getEnergySumVal(result, null, timeVal);
					itemEnergyVal = itemEnergyVal.setScale(2,
							RoundingMode.HALF_UP);
					Map<String, Object> mapValue = new LinkedHashMap<String, Object>();
					mapValue.put("value", itemEnergyVal);
					sumValfortime.add(mapValue);
					// 添加报表明细行数据
					mapReportdetail.put(timeVal, itemEnergyVal);
				}
				reportDetailData.put(buildinfo.getBuildName(), mapReportdetail);
				mapDataset.put("data", sumValfortime);
				listDataset.add(mapDataset);
			}
		}

		chartElementMap.put("chart", chart);
		chartElementMap.put("categories", mapCategory);
		chartElementMap.put("dataset", listDataset);

		return chartElementMap;
	}

	/**
	 * 获取指定时间段内能耗合计值
	 * 
	 * @param result
	 *            能耗查询结果列表
	 * @param rate
	 *            转标煤系数
	 * @param timeVal
	 *            时间值
	 * */
	public BigDecimal getEnergySumVal(List<Queryresult> result,
			BigDecimal rate, String timeVal) {
		BigDecimal sumval = BigDecimal.valueOf(0);
		BigDecimal val = BigDecimal.valueOf(0);
		for (Queryresult qr : result) {
			if (qr.getTime().equals(timeVal)) {
				val = new BigDecimal(qr.getVal());
				sumval = sumval.add(val);
			}
		}
		if (rate != null) {
			sumval = sumval.multiply(rate);
		}
		return sumval;
	}

	/**
	 * 获取指定时间段内能耗合计值
	 * 
	 * @param result
	 *            能耗查询结果列表
	 * @param rate
	 *            转标煤系数
	 * @param timeVal
	 *            时间值
	 * */
	public BigDecimal getEnergySumVal(List<Queryresult> result, BigDecimal rate) {
		BigDecimal sumval = BigDecimal.valueOf(0);
		BigDecimal val = BigDecimal.valueOf(0);
		for (Queryresult qr : result) {
			val = new BigDecimal(qr.getVal());
			sumval = sumval.add(val);
		}
		if (rate != null) {
			sumval = sumval.multiply(rate);
		}
		return sumval;
	}

	/**
	 * 解析数据来源
	 * 
	 * @param datasrcid
	 *            源ID
	 * */
	private List<String> parseDatasourceid(String datasrcid) {
		if (!StringUtils.hasLength(datasrcid)) {
			return null;
		}
		List<String> result = new ArrayList<String>();
		if (datasrcid.trim().indexOf(",") > 0) {
			String ids[] = datasrcid.split(",");
			for (String id : ids) {
				if (StringUtils.hasLength(id)) {
					result.add(id);
				}
			}
		} else {
			result.add(datasrcid);
		}
		return result;
	}

	/**
	 * 获取多序列图表X轴数据
	 * 
	 * @param qrlist
	 *            查询结果列表
	 * @param queryType
	 *            查询类型
	 * @param serieTimes
	 *            时间序列
	 * */
	private Map<String, Object> getMultiSeriesChartCategories(
			List<Queryresult> qrlist, String queryType, List<String> serieTimes) {
		Map<String, Object> chartCategories = new HashMap<String, Object>();
		// 取Tag值,选择列表的第一个对象的TAGID
		String tagid = null;
		if (qrlist.size() > 0)
			tagid = qrlist.get(0).getTagid();
		// X轴名称
		Set<Object> xaxisnames = new LinkedHashSet<Object>();
		if (serieTimes == null)
			serieTimes = new ArrayList<String>();
		Map<String, String> mapLable = null;
		for (Queryresult qr : qrlist) {
			mapLable = new LinkedHashMap<String, String>();
			if (qr.getTagid().equals(tagid)) {
				serieTimes.add(qr.getTime());
				String dateFormat = getSeriesDatetimeFormat(queryType);
				try {
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					Date date = df.parse(qr.getTime());
					String ret = new SimpleDateFormat(dateFormat).format(date);
					mapLable.put("label", ret);
				} catch (ParseException e) {
					e.printStackTrace();
					mapLable.put("label", qr.getTime());
				}
				xaxisnames.add(mapLable);
			}
		}
		chartCategories.put("category", xaxisnames);
		return chartCategories;
	}

	private ReadmeterService readmeterService;

	@Autowired
	public void setReadmeterService(ReadmeterService readmeterService) {
		this.readmeterService = readmeterService;
	}

	@Transactional(readOnly = true)
	@Override
	public List<Object> getSingleSeriesChartDataByReadmeter(
			Chartsetting chartsetting, String from, String to, String count) {

		List<Object> result = new LinkedList<Object>();

		String queryType = chartsetting.getQueryType().toLowerCase();
		Date startDate = null, endDate = null;

		startDate = parseDate(getQueryStartdatetime(chartsetting, from, to));
		endDate = parseDate(getQueryEnddatetime(chartsetting, from, to));

		QueryType type = QueryType.findCode(queryType);
		switch (type) {
		case USAGE:
		case DAYREPORT:
			result = readmeterService.getReadingDataByDayToChart(
					chartsetting.getBuildId(), chartsetting.getEnergyName(),
					startDate, endDate, chartsetting.getEnergyRate());
			break;
		case QUERY:
		case MONTHREPORT:
			result = readmeterService.getReadingDataByMonthToChart(
					chartsetting.getBuildId(), chartsetting.getEnergyName(),
					startDate, endDate, chartsetting.getEnergyRate());
			break;
		case WEEKREPORT:
			result = readmeterService.getReadingDataByWeekToChart(
					chartsetting.getBuildId(), chartsetting.getEnergyName(),
					startDate, endDate, chartsetting.getEnergyRate());
			break;
		case YEARREPORT:
			result = readmeterService.getReadingDataByYearToChart(
					chartsetting.getBuildId(), chartsetting.getEnergyName(),
					startDate, endDate, chartsetting.getEnergyRate());
			break;
		}
		return result;
	}
	
	/**
	 * 将表头key -value 反置存储 
	 */
	private Map<String,String> localRevertMap=null; 
	private ReportSetting reportSetting=null;
	/**
	  通过表头的value,tagid,得到表头名称key
	 @author allchin
	 modified@2013年7月29日 下午4:21:55
	 * @param rsIncome
	 * @param value
	 * @return
	 */
	private String getKeyByValue(ReportSetting rsIncome,String value){
		String result =null;
		if(localRevertMap ==null){
	  
			localRevertMap=new HashMap<String,String>();
			Map<String, String> tagidSeries =  rsIncome.getTagidSeries();
			Iterator<Entry<String, String>> it = tagidSeries.entrySet().iterator();
			while (it.hasNext()) { 
					Map.Entry<String, String> entry = (Map.Entry<String, String>) it
							.next();
					localRevertMap.put(entry.getValue().trim(), entry.getKey());				  
			}				 
			 
		}
		else{
			result =localRevertMap.get(value);
			if(result==null){
				Map<String, String> tagidSeries =  rsIncome.getTagidSeries();
				Iterator<Entry<String, String>> it = tagidSeries.entrySet().iterator();
				while (it.hasNext()) { 
						Map.Entry<String, String> entry = (Map.Entry<String, String>) it
								.next();
						localRevertMap.put(entry.getValue().trim(), entry.getKey());				  
				}
				
			}
		}
		result =localRevertMap.get(value.trim());
		return result;
		
	}
	

	
	/**
	 * 利用线程，异步查询服务，分割结果集，产生输出
	 * @author Administrator
	 *
	 */
	class Queryer extends Thread {

		private String url;
		private int paramIdCount;
		private ReportSetting rptSet;
		 
		private LinkedHashMap resultMap=new LinkedHashMap();
		private int stepLength=0;
		
		public Queryer() { }
		public Queryer(String url,int paramIdCount,ReportSetting rptSet) {
			this.url=url;
			this.paramIdCount=paramIdCount;
			this.rptSet=rptSet;
		}
		
		@Override
		public void run() {
			try {
				StopWatch sw=new StopWatch();
				sw.start();
				//结果查询
				List<Queryresult> tempQueryResultList=getQueryresult(url);
				
				sw.split();
				logger.info("thread :"+this.getName()+"query cost :"+sw.getSplitTime()+"`params`" +paramIdCount);
			 
				
				//根据返回数据，计算步长,只求一次
				stepLength=tempQueryResultList.size() / paramIdCount;
				
				//分解结果列表 
				for(int start=0;start<tempQueryResultList.size();start=start+stepLength){
					List  subList=new ArrayList ();
					int end=start+stepLength;
					if(end>tempQueryResultList.size()){
						end=tempQueryResultList.size()-1;
					}
					//
					subList=tempQueryResultList.subList(start,end);
					//根据tagid获取key
					Queryresult qr=(Queryresult)subList.get(0);
					String cellName=getKeyByValue(rptSet,qr.getTagid());
					resultMap.put(cellName, subList);
					
				}
				sw.split();
				logger.info("thread :"+this.getName()+"devide data to list cost :"+sw.getSplitTime());
	 
			} catch (Exception e) {
			 
				e.printStackTrace();
			}
			 
		}
		
	}
	/**
	 * 计算能够分成几组
	 * @param groupSize 每组大小
	 * @param idCount 总共id成员数目
	 * @return
	 */
	public static int calcGroupCount(int groupSize,int idCount){
		int groupCount=(idCount % groupSize  ==0)?(idCount / groupSize ):((idCount / groupSize )+1);
		return groupCount;
	}
	
	
 
	/**
	 分组得到报表内容，
	 每组记录不能超过64个参数。
	 @author allchin
	 modified@2013年8月1日 上午11:38:20
	 * @param reportSetting
	 * @param from
	 * @param to
	 * @param partId
	 * @param base
	 * @return
	 * @throws NullPointerException
	 * @throws MalformedURLException
	 * @throws IOException
	 * @throws Exception
	 */
	public Map<String,List<Queryresult>> getEnergyReportPartly( ReportSetting reportSetting, 
																 String from, 
																 String to ,
																 int partId,
																 int base
																 )  {

		Map<String, String> tagidSeries =  reportSetting.getTagidSeries();
		
		//对id分组 
		int groupSize=calcGroupCount(base,tagidSeries.size()); 
		int groupCount=base;
		
		//存参数分组后的参数字符串
		StringBuffer[] tagids=new StringBuffer[groupCount];
		//存放参数个数记录
		int[] tagCounts=new int[groupCount];
		
		//tagids 初始化
		for(int i=0;i<groupCount;i++){
			tagids[i]=new StringBuffer();
		}
		
		
		//迭代构造查询数据id集合
		int nowGroup=0; 
		int nowCount=0;
		
		Iterator<Entry<String, String>> it = tagidSeries.entrySet().iterator();
		while (it.hasNext()) {

			Map.Entry<String, String> entry = (Map.Entry<String, String>) it
					.next();
 
			//序列集合
			tagids[nowGroup].append(entry.getValue()+",");
			tagCounts[nowGroup]++;
			
			nowCount++;
			if(nowCount % groupSize ==0){ nowGroup++ ;}
		}
 
		//构造请求地址集合
		String[] wsURLs=new String[groupCount]; 
		//异步请求
		Queryer[] queryers=new Queryer[groupCount];
		
		for(int k=0;k<groupCount;k++){
			wsURLs[k]=getQueryUrl(reportSetting, tagids[k].toString(),from,to,reportSetting.getDefCount());
			
			queryers[k]=new Queryer(wsURLs[k],tagCounts[k],reportSetting);
			 
			//queryers[k].start();
			 
		}
		queryers[partId-1].start();
		//结果集合
		Map<String, List<Queryresult>> result = new LinkedHashMap<String, List<Queryresult>>();
		for(int l=0;l<groupCount;l++){
			try {
				queryers[l].join();
			} catch (InterruptedException e) {
				 
			}
			result.putAll(queryers[l].resultMap);
		}
		 
		return result;
		 
		
		
	}
	
	/**
	 新的查询方法，按照参数个数分组，并发查询。
	 无参数限制，需求服务有高吞吐量。
	 @author allchin
	 modified@2013年7月29日 下午2:00:35
	 * @return
	 * @throws Exception 
	 * @throws IOException 
	 * @throws MalformedURLException 
	 * @throws NullPointerException 
	 */
	public Map<String,List<Queryresult>> getEnergyReportInBatch( ReportSetting reportSetting, 
																 String from, 
																 String to 
																 ) throws NullPointerException, MalformedURLException, IOException, Exception{
		Map<String, String> tagidSeries =  reportSetting.getTagidSeries();
		
		//对id分组
		int groupSize=50; 
		int groupCount=calcGroupCount(groupSize,tagidSeries.size());
		
		//存参数分组后的参数字符串
		StringBuffer[] tagids=new StringBuffer[groupCount];
		//存放参数个数记录
		int[] tagCounts=new int[groupCount];
		
		//tagids 初始化
		for(int i=0;i<groupCount;i++){
			tagids[i]=new StringBuffer();
		}
		
		
		//迭代构造查询数据id集合
		int nowGroup=0; 
		int nowCount=0;
		
		Iterator<Entry<String, String>> it = tagidSeries.entrySet().iterator();
		while (it.hasNext()) {

			Map.Entry<String, String> entry = (Map.Entry<String, String>) it
					.next();
 
			//序列集合
			tagids[nowGroup].append(entry.getValue()+",");
			tagCounts[nowGroup]++;
			
			nowCount++;
			if(nowCount % groupSize ==0){ nowGroup++ ;}
		}
 
		//构造请求地址集合
		String[] wsURLs=new String[groupCount]; 
		//异步请求
		Queryer[] queryers=new Queryer[groupCount];
		
		for(int k=0;k<groupCount;k++){
			wsURLs[k]=getQueryUrl(reportSetting, tagids[k].toString(),from,to,reportSetting.getDefCount());
			
			queryers[k]=new Queryer(wsURLs[k],tagCounts[k],reportSetting);
			 
			queryers[k].start();
			 
		}
		//结果集合
		Map<String, List<Queryresult>> result = new LinkedHashMap<String, List<Queryresult>>();
		for(int l=0;l<groupCount;l++){
			queryers[l].join();
			result.putAll(queryers[l].resultMap);
		}
		 
		return result;
		 
	}
	
	

	/* 
	重写的方法: 入口方法,会选择支线执行
	Version :@author:allchin@2013年7月30日
	(non-Javadoc)
	 * @see com.managementsystem.energy.portlet.chart.service.ChartService#getEnergyReport(com.managementsystem.energy.portlet.chart.model.ReportSetting, java.lang.String, java.lang.String)
	 */
	@Override
	public Map<String, List<Queryresult>> getEnergyReport(
			ReportSetting reportSetting, String from, String to) { 
		//新的并发查询方法
		try {
			return getEnergyReportInBatch(reportSetting, from, to);
		}  
		catch (Exception e1) {
			 
			e1.printStackTrace();
		}
		return getEnergyReportTimeX(reportSetting, from, to);
	}
	
	/**
	 旧的查询方法
	 */
	public Map<String, List<Queryresult>> getEnergyReportTimeX(
			ReportSetting reportSetting, String from, String to) {

		
		Map<String, List<Queryresult>> result = new LinkedHashMap<String, List<Queryresult>>();
		Map<String, String> tagidSeries = null;
		try {
			tagidSeries = reportSetting.getTagidSeries();
		}catch(Exception e) {
			return result;
		}
		
		//循环序列
		Iterator<Entry<String, String>> it = tagidSeries.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, String> entry = (Map.Entry<String, String>) it
					.next();
			//序列名称
			String key = entry.getKey();
			//序列值
			String tagid = entry.getValue() == null ? "" : entry.getValue();
			
			if(!StringUtils.hasLength(from)) {
				from = reportSetting.getStarttimeValue();
			} 
			if(!StringUtils.hasLength(to)) {
				to = reportSetting.getEndtimeValue();
			}
			
			//设置序列数据地址
			String wsUrl = getQueryUrl(reportSetting, tagid,from,to,reportSetting.getDefCount());
			
			List<Queryresult> resultlist = null;
			try {
				resultlist = getQueryresult(wsUrl);
			} catch (NullPointerException e) {
				e.printStackTrace();
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if (isEnabledFormula(reportSetting.getFormula())) {
				Energyformula formula = new Energyformula();
				formula.setFormula(getSerieFormulaByKey(reportSetting.getFormula(), key));
				formula.setResultList(resultlist); // 第一次计算
			}
			
			//判断是否存在多个序列
			String[] arrTagIds = null;
			if (tagid.indexOf(",") > 0) {
				arrTagIds = tagid.split(",");
			} else {
				arrTagIds = new String[] { tagid };
			}
			
			String firstTagId = "";
			if(arrTagIds.length>0) {
				firstTagId = arrTagIds[0];
			}
			List<String> timeList = new LinkedList<String>();
			if(StringUtils.hasLength(firstTagId)) {
				for (Queryresult qr : resultlist) {
					if(qr.getTagid().equals(firstTagId)) {
						timeList.add(qr.getTime());
					}
				}
			} else {
				return result;
			}
			
			List<Queryresult> qrList = new LinkedList<Queryresult>();
			for(String time : timeList) {
				Double countVal = 0d;
				for (Queryresult qr : resultlist) {
					for (String tag : arrTagIds) {
						if (qr.getTagid().equals(tag)
									&& qr.getTime().equals(time)) {
							double tempVal = Double.parseDouble(qr
										.getVal());
							countVal += tempVal < 0 ? 0 : tempVal;
						}
					}
				}
				Queryresult newQr = new Queryresult();
				newQr.setTime(time);
				newQr.setVal(countVal.toString());
				qrList.add(newQr);
			}
			result.put(key, qrList);
			
		}
		return result;
	}
	

}
