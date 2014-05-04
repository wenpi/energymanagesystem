package com.managementsystem.energy.portlet.regionalEnergy;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.validator.routines.DateValidator;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.type.TypeFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Buildaddfile;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Buildregioninfo;
import com.managementsystem.energy.domain.Buildsettinginfo;
import com.managementsystem.energy.domain.Energyitemdict;
import com.managementsystem.energy.domain.Meteruseattribute;
import com.managementsystem.energy.domain.QueryTotalresult;
import com.managementsystem.energy.portlet.chart.FusionChartUtil;
import com.managementsystem.energy.portlet.chart.model.Chartsetting;
import com.managementsystem.energy.portlet.chart.model.Queryresult;
import com.managementsystem.energy.portlet.chart.service.ChartService;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.BuildregioninfoService;
import com.managementsystem.energy.service.DistrictService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.fusionchart.ui.Fusionchart;
import com.managementsystem.ui.easyui.Datagrid;
import com.managementsystem.ui.easyui.JsonResult;

@Controller
@RequestMapping("VIEW")
public class RegionalEnergyViewController extends BaseController {
	private final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private BuildService buildService;
	@Autowired
	private DistrictService districtService;
	@Autowired
	private BuildregioninfoService buildregioninfoService;
	@Autowired
	private ChartService chartService;

	private Map<String, Object> reportDetailData;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		List<Buildregioninfo> buildregionParentList = new ArrayList<Buildregioninfo>();
		List<Buildregioninfo> dlList = new ArrayList<Buildregioninfo>();
		List<Buildregioninfo> buildregionChildList = new ArrayList<Buildregioninfo>();
		Buildinfo buildinfo = null;
		String imagefilePath = "";
		String parentId = "";
		if (prefs.getMap().size() == 0) {
		} else {
			String buildId = prefs.getValue("buildId", "");
			if (StringUtils.hasLength(buildId)) {
				buildregionParentList = new ArrayList<Buildregioninfo>(
						buildregioninfoService
								.getParentBuildregioninfos(buildId));
				if (buildregionParentList.size() > 0) {
					for (int pat = 0; pat < buildregionParentList.size(); pat++) {
						parentId = buildregionParentList.get(pat).getRegionId();
						dlList = new ArrayList<Buildregioninfo>(
								buildregioninfoService
										.getBuildregioninfosByParentId(parentId));
						if (dlList.size() > 0) {
							for (int dl = 0; dl < dlList.size(); dl++) {
								buildregionChildList.add(dlList.get(dl));
							}
						}
					}
				}
				buildinfo = buildService.getBuildcover(buildId);
				if (buildinfo != null
						&& buildinfo.getBuildaddfiles().size() > 0) {
					Set<Buildaddfile> addfiles = buildinfo.getBuildaddfiles();
					for (Iterator<Buildaddfile> it = addfiles.iterator(); it
							.hasNext();) {
						Buildaddfile addfile = it.next();
						if (addfile.getAddfileFunctype() == 0) {
							imagefilePath = addfile.getAddfilePath();
							break;
						}
					}
				}
			}
		}
		model.addAttribute("buildregionParentList", buildregionParentList);
		model.addAttribute("buildregionChildList", buildregionChildList);
		model.addAttribute("imagefilePath", imagefilePath);
		model.addAttribute("imageChildfilePath", "");
		model.addAttribute("imageGrandsonfilePath", "");
		model.addAttribute("tb", "0");
		return PORTLETFOLDER + "regionalEnergy/regionalEnergyView";
	}

	@RenderMapping(params = "action=getbuildregion")
	public ModelAndView getsChildbuildregion(
			@RequestParam(value = "regionId", required = true) String regionId,
			PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		String url = PORTLETFOLDER + "regionalEnergy/regionalEnergyView";
		List<Buildregioninfo> buildregionParentList = new ArrayList<Buildregioninfo>();
		List<Buildregioninfo> dlList = new ArrayList<Buildregioninfo>();
		List<Buildregioninfo> buildregionChildList = new ArrayList<Buildregioninfo>();
		String parentId = "";
		String pid = regionId;
		mav.setViewName(url);
		// String qdserie1 = "serie1" + regionId;
		// String fHserie1 = prefs.getValue(qdserie1, "");
		// String qdserie2 = "serie2" + regionId;
		// String fHserie2 = prefs.getValue(qdserie2, "");

		try {
			String buildId = prefs.getValue("buildId", "");
			if (StringUtils.hasLength(buildId)) {
				if (StringUtils.hasLength(buildId)) {
					buildregionParentList = new ArrayList<Buildregioninfo>(
							buildregioninfoService
									.getParentBuildregioninfos(buildId));
					if (buildregionParentList.size() > 0) {
						for (int pat = 0; pat < buildregionParentList.size(); pat++) {
							parentId = buildregionParentList.get(pat)
									.getRegionId();
							dlList = new ArrayList<Buildregioninfo>(
									buildregioninfoService
											.getBuildregioninfosByParentId(parentId));
							if (dlList.size() > 0) {
								for (int dl = 0; dl < dlList.size(); dl++) {
									buildregionChildList.add(dlList.get(dl));
								}
							}
						}
					}
				}
				Buildregioninfo buildregioninfo = buildregioninfoService
						.getBuildregioninfo(regionId);
				String imageChildfilePath = buildregioninfo.getRegionImage();
				String lcName = buildregioninfo.getRegionName();
				mav.addObject("imageChildfilePath", imageChildfilePath);
				mav.addObject("pid", pid);
				// mav.addObject("fHserie2", fHserie2);
				// mav.addObject("fHserie1", fHserie1);
				mav.addObject("imagefilePath", "");
				mav.addObject("imageGrandsonfilePath", "");
				mav.addObject("lcName", lcName);
			}
			mav.addObject("buildregionParentList", buildregionParentList);
			mav.addObject("buildregionChildList", buildregionChildList);
			mav.addObject("tb", "Child");
		} catch (Exception e) {
			logger.error(e);
		}
		return mav;
	}

	@RenderMapping(params = "action=getGrandsonbuildregion")
	public ModelAndView getGrandsonbuildregion(
			@RequestParam(value = "regionId", required = true) String regionId,
			PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		String url = PORTLETFOLDER + "regionalEnergy/regionalEnergyView";
		List<Buildregioninfo> buildregionParentList = new ArrayList<Buildregioninfo>();
		List<Buildregioninfo> dlList = new ArrayList<Buildregioninfo>();
		List<Buildregioninfo> buildregionChildList = new ArrayList<Buildregioninfo>();
		String parentId = "";
		String pid = regionId;
		mav.setViewName(url);
		try {
			String buildId = prefs.getValue("buildId", "");
			if (StringUtils.hasLength(buildId)) {
				if (StringUtils.hasLength(buildId)) {
					buildregionParentList = new ArrayList<Buildregioninfo>(
							buildregioninfoService
									.getParentBuildregioninfos(buildId));
					if (buildregionParentList.size() > 0) {
						for (int pat = 0; pat < buildregionParentList.size(); pat++) {
							parentId = buildregionParentList.get(pat)
									.getRegionId();
							dlList = new ArrayList<Buildregioninfo>(
									buildregioninfoService
											.getBuildregioninfosByParentId(parentId));
							if (dlList.size() > 0) {
								for (int dl = 0; dl < dlList.size(); dl++) {
									buildregionChildList.add(dlList.get(dl));
								}
							}
						}
					}
				}
				Buildregioninfo buildregioninfo = buildregioninfoService
						.getBuildregioninfo(regionId);
				String imageGrandsonfilePath = buildregioninfo.getRegionImage();
				String lcName = buildregioninfo.getRegionName();
				mav.addObject("imageGrandsonfilePath", imageGrandsonfilePath);
				mav.addObject("pid", pid);
				mav.addObject("imagefilePath", "");
				mav.addObject("imageChildfilePath", "");
				mav.addObject("lcName", lcName);
				mav.addObject("buildregionParentList", buildregionParentList);
				mav.addObject("buildregionChildList", buildregionChildList);
			}
			mav.addObject("tb", "Grandson");
		} catch (Exception e) {
			logger.error(e);
		}
		return mav;
	}

	@ResourceMapping(value = "getChartData")
	public Fusionchart getChartData(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {
		Chartsetting chartsetting = new Chartsetting();
		// 获取所有传入参数
		Enumeration<String> keys = request.getParameterNames();
		String tb = "", regionId = "";
		if (request.getParameter("tb") != null) {
			tb = request.getParameter("tb");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		String key = null;
		while (keys.hasMoreElements()) {
			// 参数健名称
			key = keys.nextElement().toString();
			// 设置对象值
			if (!"cform".equals(key)) {
				try {
					BeanUtils.setProperty(chartsetting, key,
							request.getParameter(key));
				} catch (IllegalAccessException e) {
					logger.error(e);
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					logger.error(e);
					e.printStackTrace();
				}
			}
		}
		Fusionchart fusionchart = new Fusionchart();
		Map<String, Object> reportDetailData = new HashMap<String, Object>();
		Map<String, Object> resultMap = this
				.getMultiSeriesChartForEnergyitemdict(chartsetting,
						reportDetailData, regionId, prefs, tb);
		fusionchart.setChart(resultMap);
		setReportDetailData(reportDetailData);
		return fusionchart;
	};

	/**
	 * 设置报表明细数据
	 * */
	public void setReportDetailData(Map<String, Object> reportDetailData) {
		this.reportDetailData = reportDetailData;
	}

	public Map<String, Object> getMultiSeriesChartForEnergyitemdict(
			Chartsetting chartsetting, Map<String, Object> reportDetailData,
			String regionId, PortletPreferences prefs, String tb) {

		Map<String, Object> chartElementMap = new HashMap<String, Object>();
		Map<String, Object> mapCategory = new HashMap<String, Object>();
		List<Object> listDataset = new ArrayList<Object>();
		// 时间序列
		List<String> serieTimes = new ArrayList<String>();
		ArrayList<Queryresult> tempQrTest = new ArrayList<Queryresult>();
		List<Queryresult> tempQr = null;
		int index = 0;
		Buildinfo buildinfo = null;
		Buildsettinginfo settinginfo = null;
		String wsUrl = null, tagids = null;
		List<Queryresult> result = null;
		BigDecimal itemEnergyVal = null;
		String strPark = "";
		String seriesname = "";
		buildinfo = buildService.getBuildinfo(prefs.getValue("buildId", ""));
		settinginfo = buildinfo.getBuildsettinginfo();
		if (settinginfo != null) {
			wsUrl = settinginfo.getSettingWsurl();
			chartsetting.setSettingWsUrl(wsUrl);
			if (tb.equals("Child")) {
				strPark = "seriech";
			}
			if (tb.equals("Grandson")) {
				strPark = "seriecg";
			}
			for (int park = 1; park <= 2; park++) {
				if (park == 1)
					seriesname = "电";
				else
					seriesname = "冷";
				tagids = prefs.getValue(strPark + String.valueOf(park)+regionId,"");
				if(!tagids.equals("")){
				wsUrl = getQueryUrl(chartsetting, tagids,
						chartsetting.getStarttimeValue(),
						chartsetting.getEndtimeValue(),
						chartsetting.getDefCount());
				try {
					if (result == null)
						result = new ArrayList<Queryresult>();
					tempQr = getQueryresult(wsUrl);
					result.addAll(tempQr);
					if (index == 0) {
						index++;
						mapCategory = getMultiSeriesChartCategories(result,
								chartsetting.getQueryType(), serieTimes);
					}
					itemEnergyVal = getEnergySumVal(tempQr);
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
			mapDataset.put("seriesname", seriesname);
			List<Object> sumValfortime = new LinkedList<Object>();
			for (String timeVal : serieTimes) {
				itemEnergyVal = getEnergySumVal(result, timeVal);
				Map<String, Object> mapValue = new LinkedHashMap<String, Object>();
				mapValue.put("value", itemEnergyVal);
				sumValfortime.add(mapValue);
			}
			mapDataset.put("data", sumValfortime);
			listDataset.add(mapDataset);
				}
		}
	}
		Map<String, Object> chart = getFusionChartSetting(chartsetting);
		// chartElementMap.put("chart", chart);
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
	public BigDecimal getEnergySumVal(List<Queryresult> result) {
		BigDecimal sumval = BigDecimal.valueOf(0);
		BigDecimal val = BigDecimal.valueOf(0);
		for (Queryresult qr : result) {
			val = new BigDecimal(qr.getVal());
			sumval = sumval.add(val);
		}
		return sumval;
	}

	public BigDecimal getEnergySumVal(List<Queryresult> result, String timeVal) {
		BigDecimal sumval = BigDecimal.valueOf(0);
		BigDecimal val = BigDecimal.valueOf(0);
		for (Queryresult qr : result) {
			if (qr.getTime().equals(timeVal)) {
				val = new BigDecimal(qr.getVal());
				sumval = sumval.add(val);
			}
		}
		return sumval;
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

	private String getQueryUrl(Chartsetting chartsetting, String tagids,
			String from, String to, String count) {
		String wsUrl = chartsetting.getSettingWsUrl();
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
		String tfrom = "".equals(from) ? getQueryStartdatetime(chartsetting,
				from, to) : from;
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

	public String getQueryStartdatetime(Chartsetting chartsetting, String from,
			String to) {
		return getChartQuerydatetime(chartsetting, true, from, to);
	}

	public String getQueryEnddatetime(Chartsetting chartsetting, String from,
			String to) {
		return getChartQuerydatetime(chartsetting, false, from, to);
	}

	private String getChartQuerydatetime(Chartsetting chartsetting,
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
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH),
					cal.get(Calendar.DATE), 0, 0, 0);
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
}
