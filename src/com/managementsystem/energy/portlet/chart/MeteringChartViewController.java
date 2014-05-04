package com.managementsystem.energy.portlet.chart;

import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.portlet.chart.model.Chartsetting;
import com.managementsystem.energy.portlet.chart.service.ChartService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.fusionchart.ui.Fusionchart;

/**
 * 计量表数据图表分析
 * */
@Controller
@RequestMapping("VIEW")
public class MeteringChartViewController extends BaseController {

	private final Log logger = LogFactory.getLog(MeteringChartViewController.class);
	
	@Autowired
	private ChartService chartService;

	/**
	 * 显示图表PORTLET
	 * 
	 * @param prefs
	 *            PORTLET首选项
	 * @param model
	 *            数据模块
	 * */
	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		// 获取首选项设置
		Chartsetting chartsetting = chartService.getChartsetting(prefs);
		if (chartsetting == null)
			chartsetting = new Chartsetting();
		model.addAttribute("chartsetting", chartsetting);

		return PORTLETFOLDER + "chart/meteringChartView";
	}

	/**
	 * 获取图表
	 * 
	 * @param prefs
	 *            图表首选项
	 * @param request
	 *            资源请求对象
	 * */
	@ResourceMapping(value = "getChartData")
	public Fusionchart getChartData(PortletPreferences prefs,
			ResourceRequest request) {

		Map<String, String> queryParams = new HashMap<String, String>();
		
		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		// 获取首选项设置
		Chartsetting chartsetting = chartService.getChartsetting(prefs);

		// 设置查询条件
		String from = "", to = "", count = "", queryType = "";
		if (request.getParameter("from") != null) {
			from = request.getParameter("from");
			from = from.replace(" ", "T");
			if (StringUtils.hasLength(from)) {
				queryParams.put("from", from);
			}
		}
		if (request.getParameter("to") != null) {
			to = request.getParameter("to");
			to = to.replace(" ", "T");
			if (StringUtils.hasLength(to)) {
				queryParams.put("to", to);
			}
		}
		if (request.getParameter("count") != null) {
			count = request.getParameter("count");
			if (StringUtils.hasLength(count)) {
				queryParams.put("count", count);
			}
		}

		if (request.getParameter("queryType") != null) {
			queryType = request.getParameter("queryType");
			if (StringUtils.hasLength(queryType)) {
				chartsetting.setQueryType(queryType);
			}
		}

		logger.info("图表'"+ chartsetting.getCaption() +"' remote query starttime:"+ Calendar.getInstance(Locale.CHINESE).getTime());

		resultMap = FusionChartUtil.getInstance().generateFusionChart(
				chartService, chartsetting, from, to, count, null, null);

		Fusionchart fusionchart = new Fusionchart();
		fusionchart.setChart(resultMap);

		logger.info("图表'"+ chartsetting.getCaption() +"' remote query endtime:"+ Calendar.getInstance(Locale.CHINESE).getTime());
		return fusionchart;
	}
}
