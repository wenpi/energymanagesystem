package com.managementsystem.energy.portlet.chart;

import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;
import org.springframework.web.servlet.View;

import com.managementsystem.energy.portlet.chart.model.Chartsetting;
import com.managementsystem.energy.portlet.chart.service.ChartService;
import com.managementsystem.energy.portlet.chart.view.ChartDataReportView;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.ui.easyui.JsonResult;

/**
 * 图表展示控制器
 * 
 * @author CHENPING
 * 
 * */
@Controller
@RequestMapping("VIEW")
public class ChartViewController extends BaseController {

	@Autowired
	private ChartService chartService;

	/**
	 * 显示图表PORTLET
	 * 
	 * @param prefs PORTLET首选项
	 * @param model 数据模块
	 * */
	@RenderMapping
	public String setup(PortletPreferences prefs,Model model) {
		//获取首选项设置
		Chartsetting chartsetting = chartService.getChartsetting(prefs);
		if(chartsetting==null)
			chartsetting = new Chartsetting();
		model.addAttribute("chartsetting", chartsetting);
		
		return PORTLETFOLDER + "chart/chartView";
	}

	/**
	 * 获取图表
	 * */
	@ResourceMapping(value = "getChartData")
	public Map<String,Object> getChartData(PortletPreferences prefs,ResourceRequest request,ResourceResponse response) {
		
		Map<String, String> queryParams = new HashMap<String,String>();
		
		//设置查询条件
		String from = "",to="",count="",queryType = "";
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
		
		//结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		//获取首选项设置
		Chartsetting chartsetting = chartService.getChartsetting(prefs);
		if(chartsetting!=null) {
			if(request.getParameter("queryType")!=null) {
				queryType = request.getParameter("queryType");
				if(StringUtils.hasLength(queryType)) {
					chartsetting.setQueryType(queryType);
				}
			}

			//开始执开时间
			System.out.println("chart remote query starttime:" + Calendar.getInstance(Locale.CHINESE).getTime());
			if("xml".equals(chartsetting.getDataFormat())) {
				resultMap.put("", chartsetting.getDataContent());
			}else if ("database".equals(chartsetting.getDataFormat())) {
				resultMap = FusionChartUtil.getInstance().generateDatabaseFusionChart(chartService, chartsetting, from, to, count, null, null);
			}else {
				resultMap = FusionChartUtil.getInstance().generateFusionChart(chartService,chartsetting,from,to,count,null,null);
			}
			System.out.println("chart remote query endtime:" + Calendar.getInstance(Locale.CHINESE).getTime());
		}

		return resultMap;
	}
	
	
	@RenderMapping(params = "action=addStrategy")
	public View processExportChartExcel() {
		
		ChartDataReportView reportView = new ChartDataReportView();
		reportView.addStaticAttribute("reportData", null);
		return reportView;
	}

}
