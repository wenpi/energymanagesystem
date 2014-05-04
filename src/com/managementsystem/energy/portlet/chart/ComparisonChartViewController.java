package com.managementsystem.energy.portlet.chart;

import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.portlet.chart.model.Chartsetting;
import com.managementsystem.energy.portlet.chart.service.ChartService;
import com.managementsystem.energy.web.PortletBaseController;
import com.managementsystem.fusionchart.ui.Fusionchart;
import com.managementsystem.ui.easyui.JsonResult;

/**
 * 对比图表视图
 * */
@Controller
@RequestMapping("VIEW")
public class ComparisonChartViewController extends PortletBaseController {

	@Autowired
	private ChartService chartService;

	/**
	 * 设置对比图视图
	 * */
	@RenderMapping
	public ModelAndView setup(PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();

		Chartsetting chartsetting = chartService.getChartsetting(prefs);
		if (chartsetting == null)
			chartsetting = new Chartsetting();
		mav.addObject("chartsetting", chartsetting);
		
		String from = "",to="",count="";
		String cfrom = "",cto="";
		
		mav.addObject("from", from);
		mav.addObject("to", to);
		mav.addObject("count", count);
		mav.addObject("cfrom", cfrom);
		mav.addObject("cto", cto);
		
		
		
		
		mav.setView(PORTLETFOLDER + "chart/comparisonChartView");
		return mav;
	}

	/**
	 * 获取图表
	 * @param prefs 首选项
	 * @param request 资源请求对象
	 * */
	@ResourceMapping(value = "getChartData")
	public Fusionchart getChartData(PortletPreferences prefs,
			ResourceRequest request) {
	Map<String, String> queryParams = new HashMap<String,String>();
		
		//设置查询条件
		String from = "",to="",count="",cfrom="";
		if(request.getParameter("from")!=null) {
			from = request.getParameter("from");
			from = from.replace(" ", "T");
			if(StringUtils.hasLength(from)) {
				queryParams.put("from", from);
			}
		}
		if(request.getParameter("to")!=null) {
			to = request.getParameter("to");
			to = to.replace(" ", "T");
			if(StringUtils.hasLength(to)) {
				queryParams.put("to", to);
			}
		}
		if(request.getParameter("count")!=null) {
			count = request.getParameter("count");
			if(StringUtils.hasLength(count)) {
				queryParams.put("count", count);
			}
		}
		if(request.getParameter("cfrom")!=null) {
			cfrom = request.getParameter("cfrom");
			cfrom = cfrom.replace(" ", "T");
			if(StringUtils.hasLength(cfrom)) {
				queryParams.put("cfrom", cfrom);
			}
		}
		
		//开始执开时间
		System.out.println("starttime:"
				+ Calendar.getInstance(Locale.CHINESE).getTime());
		//结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		//获取首选项设置
		Chartsetting chartsetting = chartService.getChartsetting(prefs);

		resultMap =  FusionChartUtil.getInstance().generateFusionChart(chartService,chartsetting, from,to,count,cfrom,null);

		Fusionchart fusionchart = new Fusionchart();
		fusionchart.setChart(resultMap);

		System.out.println("endtime:"
				+ Calendar.getInstance(Locale.CHINESE).getTime());
		return fusionchart;
	}
}
