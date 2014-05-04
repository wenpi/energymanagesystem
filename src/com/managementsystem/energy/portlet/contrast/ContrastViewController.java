package com.managementsystem.energy.portlet.contrast;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.portlet.chart.model.Chartsetting;
import com.managementsystem.energy.portlet.chart.service.ChartService;
import com.managementsystem.energy.portlet.energyquery.EnergyqueryViewController;
import com.managementsystem.energy.portlet.energyquery.domain.BuildEnergyItem;
import com.managementsystem.energy.service.EnergyitemdictService;
import com.managementsystem.energy.web.PortletBaseController;
import com.managementsystem.fusionchart.ui.Fusionchart;
import com.managementsystem.ui.easyui.Datagrid;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.ui.easyui.Tree;

/**
 * 能耗比较模块
 * */
@Controller
@RequestMapping("VIEW")
public class ContrastViewController extends PortletBaseController {

	private final Log logger = LogFactory
	.getLog(ContrastViewController.class);
	
	@Autowired
	private EnergyitemdictService energyitemdictService;
	

	@Autowired
	private ChartService chartService;

	private Map<String, Object> reportDetailData;

	/**
	 * 获取报表明细数据
	 * */
	public Map<String, Object> getReportDetailData() {
		return reportDetailData;
	}

	/**
	 * 设置报表明细数据
	 * */
	public void setReportDetailData(Map<String, Object> reportDetailData) {
		this.reportDetailData = reportDetailData;
	}
	
	@RenderMapping
	public ModelAndView setup(PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		mav.setView(PORTLETFOLDER + "contrast/contrastView");
		return mav;
	}
	
	/**
	 * 获取能源分类分项数据
	 * */
	@ResourceMapping(value="getEnergyitemdicts")
	public JsonResult getEnergyitemdicts(ResourceResponse response) {
		JsonResult result = new JsonResult();
		List<Tree> list = energyitemdictService.getEnergyitemdictComboTree();
		result.setData(list);
		return result;
	}
	
	
	/**
	 * 获取图表
	 * */
	@ResourceMapping(value = "getContrastChartData")
	public Fusionchart getContrastChartData(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {

		Chartsetting chartsetting = new Chartsetting();
		// 获取所有传入参数
		Enumeration<String> keys = request.getParameterNames();
		String key = null;
		while (keys.hasMoreElements()) {
			// 参数健名称
			key = keys.nextElement().toString();
			// 设置对象值
			if (!"cfrom".equals(key)) {
				try {
					BeanUtils.setProperty(chartsetting, key,request.getParameter(key));
				} catch (IllegalAccessException e) {
					logger.error(e);
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					logger.error(e);
					e.printStackTrace();
				}
			}
		}
		if(!StringUtils.hasLength(chartsetting.getEnergyitemcode())) {
			if(request.getParameter("energyitemcode")!=null) {
				chartsetting.setEnergyitemcode(request.getParameter("energyitemcode").toString());
			}
		}
		Fusionchart fusionchart = new Fusionchart();
		Map<String, Object> reportDetailData = new HashMap<String, Object>();
		Map<String, Object> resultMap = 
			chartService.getMultiSeriesChartForContrastEnergyitemdict(chartsetting, reportDetailData);
		fusionchart.setChart(resultMap);
		setReportDetailData(reportDetailData);
		return fusionchart;
	};

	/**
	 * 获取指定分类名称的能耗数据
	 * 
	 * @param energyItemname
	 *            能耗分类名称
	 * @return 指定分类名称的能耗数据
	 * */
	@ResourceMapping(value = "getReportData")
	public Map getReportData() {
		if(reportDetailData!=null) {
			return reportDetailData;
		}
		return null;
	}

}
