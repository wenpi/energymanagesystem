package com.managementsystem.energy.portlet.runreport;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Meteruseattribute;
import com.managementsystem.energy.domain.Meteruseinfo;
import com.managementsystem.energy.portlet.chart.FusionChartUtil;
import com.managementsystem.energy.portlet.chart.model.Chartsetting;
import com.managementsystem.energy.portlet.chart.service.ChartService;
import com.managementsystem.energy.portlet.contrast.ContrastViewController;
import com.managementsystem.energy.service.BuildregioninfoService;
import com.managementsystem.energy.service.CircuitinfoService;
import com.managementsystem.energy.service.MeteruseinfoService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.fusionchart.ui.Fusionchart;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.ui.easyui.Tree;

@Controller
@RequestMapping("VIEW")
public class RunreportViewController extends BaseController {
	private final Log logger = LogFactory.getLog(RunreportViewController.class);

	@Autowired
	private CircuitinfoService circuitinfoService;

	@Autowired
	private BuildregioninfoService buildregioninfoService;

	@Autowired
	private MeteruseinfoService meteruseinfoService;

	@Autowired
	private ChartService chartService;

	/**
	 * 显示运行报表页
	 * */
	@RenderMapping
	public ModelAndView showPrefrences() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(PORTLETFOLDER + "runreport/runreportView");
		return mav;
	}

	/**
	 * 显示建筑区域页
	 * */
	@RenderMapping(params = "action=buildregionpage")
	public ModelAndView showBuildregionPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(PORTLETFOLDER + "runreport/buildregiontree");
		return mav;
	}

	/**
	 * 返回装表支路树形数据
	 * */
	@ResourceMapping(value = "getCircuitstree")
	public JsonResult getCircuitstree() {
		JsonResult result = new JsonResult();
		List<Tree> trees = circuitinfoService.getCircuitComboTree("");
		result.setData(trees);
		return result;
	}

	/**
	 * 返回建筑区域树形数据
	 * */
	@ResourceMapping(value = "getBuildregionstree")
	public JsonResult getBuildregionstree() {
		JsonResult result = new JsonResult();
		List<Tree> trees = buildregioninfoService.getBuildregionComboTree("");
		result.setData(trees);
		return result;
	}

	/**
	 * 获取指定支路的设备
	 * 
	 * @param circuitId
	 *            支路ID
	 * @return 指定支路的设备列表
	 * */
	@ResourceMapping(value = "getMeteruseinfosByCircuitid")
	public JsonResult getMeteruseinfosByCircuitid(
			@RequestParam("circuitId") String circuitId) {
		JsonResult result = new JsonResult();
		List<Meteruseinfo> data = new ArrayList<Meteruseinfo>(
				meteruseinfoService.getMeteruseinfosByCircuitId(circuitId));
		result.setData(data);
		return result;
	}

	/**
	 * 获取指定建筑区域的设备
	 * 
	 * @param regionId
	 *            建筑区域ID
	 * @return 指定建筑区域的设备列表
	 * */
	@ResourceMapping(value = "getMeteruseinfosByRegionid")
	public JsonResult getMeteruseinfosByRegionid(
			@RequestParam("regionId") String regionId) {
		JsonResult result = new JsonResult();
		List<Meteruseinfo> data = new ArrayList<Meteruseinfo>(
				meteruseinfoService.getMeteruseinfosByRegionId(regionId));
		result.setData(data);
		return result;
	}

	@ResourceMapping(value = "getChartData")
	public Fusionchart getChartData(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {

		Chartsetting chartsetting = new Chartsetting();

		// 获取所有传入参数
		Enumeration<String> keys = request.getParameterNames();
		String key = null,value=null;
		while (keys.hasMoreElements()) {
			// 参数健名称
			key = keys.nextElement().toString();
			// 设置对象值
			try {
				value = request.getParameter(key);
				BeanUtils.setProperty(chartsetting, key,value);
			} catch (IllegalAccessException e) {
				logger.error(e);
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				logger.error(e);
				e.printStackTrace();
			}
		}

		Fusionchart fusionchart = new Fusionchart();
		Map<String, Object> reportDetailData = new HashMap<String, Object>();
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		resultMap = chartService.getMultiSeriesChartForContrastCircuit(chartsetting, reportDetailData);
		fusionchart.setChart(resultMap);
		return fusionchart;
	}

}
