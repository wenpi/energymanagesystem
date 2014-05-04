package com.managementsystem.energy.portlet.chart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;
import org.springframework.web.servlet.View;

import com.managementsystem.energy.portlet.chart.model.Queryresult;
import com.managementsystem.energy.portlet.chart.model.ReportSetting;
import com.managementsystem.energy.portlet.chart.service.ChartService;
import com.managementsystem.energy.portlet.chart.view.ChartDataReportView;
import com.managementsystem.energy.web.BaseController;

/**
 * 能源报表展示页
 * */
@Controller
@RequestMapping("VIEW")
public class ReportViewController extends BaseController {
	private final Log logger = LogFactory.getLog(ReportViewController.class);
	
	@Autowired
	private ChartService chartService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {

		ReportSetting reportSetting = chartService.getReportSetting(prefs);
		if (reportSetting == null)
			reportSetting = new ReportSetting();

		model.addAttribute("reportSetting", reportSetting);

		return PORTLETFOLDER + "chart/reportView";
	}
	
	
	@ResourceMapping(value="exportExcel")
	public View processExportExcel(PortletPreferences prefs,ResourceRequest request,
			ResourceResponse response) {
		response.setContentType("application/vnd.ms-excel");
		response.addProperty("Content-Disposition", "attachment; filename=EnergyReport.xls");	

		Map<String, List<Queryresult>> reportData = getEnergyReportData(prefs,request,response);

		ChartDataReportView view = new ChartDataReportView();
		view.addStaticAttribute("reportData", reportData);
		return view;
	}

	@ResourceMapping(value="getReportData")
	public Map<String, List<Queryresult>> getReportData(PortletPreferences prefs,ResourceRequest request,ResourceResponse response) {
		int partId=1;
		
		int base=1;
		try{
			if(request.getParameter("base")!=null) {
				base = Integer.parseInt( request.getParameter("base") );
				 
			}
			if(request.getParameter("partId")!=null) {
				partId = Integer.parseInt( request.getParameter("partId") );
				 
			}
		}
		catch(Exception e){  
		}
	
		return getEnergyReportData(prefs,request,response,partId,base);
	}
	
	private Map<String, List<Queryresult>> getEnergyReportData(PortletPreferences prefs,
			ResourceRequest request,
			ResourceResponse response ) {
			
			
			//设置查询条件
			String from = "",to="",count="",queryType = "";
			if(request.getParameter("from")!=null) {
			from = request.getParameter("from");
			from = from.replace(" ", "T");
			}
			if(request.getParameter("to")!=null) {
			to = request.getParameter("to");
			to = to.replace(" ", "T");
			}
			if(request.getParameter("queryType")!=null) {
			queryType = request.getParameter("queryType");
			}
			if(request.getParameter("count")!=null) {
			count = request.getParameter("count");
			}
			Map<String, List<Queryresult>> reportData = new HashMap<String, List<Queryresult>>();
			ReportSetting reportSetting = chartService.getReportSetting(prefs);
			//ReportSetting reportSetting = chartService.getReportSettingPartly(prefs, partId, base);
			
			reportSetting.setQueryType(queryType);
			reportSetting.setStarttimeValue(from);
			reportSetting.setEndtimeValue(to);
			
			//log start time
			long start=System.currentTimeMillis();
			logger.info("start query data ...start count time "+System.currentTimeMillis());
			
			
			reportData = chartService.getEnergyReport(reportSetting, from, to);
			//reportData = chartService.getEnergyReportPartly(reportSetting, from, to, partId, base);
			//log get data cost time
			logger.info("end query data ...cost time "+(System.currentTimeMillis()-start));
			
			
			return reportData;
}
	
 
	/**
	 通过参数，分割首选项部分配置，拿取数据
	 @author allchin
	 modified@2013年8月1日 上午10:17:08
	 * @param prefs
	 * @param request
	 * @param response
	 * @param partId
	 * @param base
	 * @return
	 */
	private Map<String, List<Queryresult>> getEnergyReportData(PortletPreferences prefs,
																ResourceRequest request,
																ResourceResponse response,
																int partId,
																int base) {
		
		
		//设置查询条件
		String from = "",to="",count="",queryType = "";
		if(request.getParameter("from")!=null) {
			from = request.getParameter("from");
			from = from.replace(" ", "T");
		}
		if(request.getParameter("to")!=null) {
			to = request.getParameter("to");
			to = to.replace(" ", "T");
		}
		if(request.getParameter("queryType")!=null) {
			queryType = request.getParameter("queryType");
		}
		if(request.getParameter("count")!=null) {
			count = request.getParameter("count");
		}
		Map<String, List<Queryresult>> reportData = new HashMap<String, List<Queryresult>>();
		ReportSetting reportSetting = chartService.getReportSetting(prefs);
		//ReportSetting reportSetting = chartService.getReportSettingPartly(prefs, partId, base);
		
		reportSetting.setQueryType(queryType);
		reportSetting.setStarttimeValue(from);
		reportSetting.setEndtimeValue(to);
		
		//log start time
		long start=System.currentTimeMillis();
		logger.info("start query data ...start count time "+System.currentTimeMillis());
		
		
		//reportData = chartService.getEnergyReport(reportSetting, from, to);
		reportData = chartService.getEnergyReportPartly(reportSetting, from, to, partId, base);
		//log get data cost time
		logger.info("end query data ...cost time "+(System.currentTimeMillis()-start));
				
		
		return reportData;
	}
	
	
	
	
	
}
