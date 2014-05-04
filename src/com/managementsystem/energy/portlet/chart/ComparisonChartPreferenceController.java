package com.managementsystem.energy.portlet.chart;


import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletPreferences;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.domain.Buildsettinginfo;
import com.managementsystem.energy.portlet.chart.model.Chartsetting;
import com.managementsystem.energy.portlet.chart.service.ChartService;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.web.BaseController;

/**
 * 对比图表首选项
 * */
@Controller
@RequestMapping("EDIT")
public class ComparisonChartPreferenceController extends BaseController {
	
	private final Log logger = LogFactory.getLog(ChartPreferenceController.class);
	@Autowired
	private BuildService buildService;
	
	@Autowired
	private ChartService chartService;
	
	/**
	 * 设置图表首选项
	 * */
	@RenderMapping
	public ModelAndView setup(PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		Chartsetting setting = null;
		if (prefs.getMap().size() == 0) {
			setting = new Chartsetting();
		} else {
			setting = chartService.getChartsetting(prefs);
		}

		mav.addObject("chartsetting", setting);
		mav.setView(PORTLETFOLDER + "chart/comparisonChartPreference");
		return mav;
	}
	
	
	/**
	 * 保存首选项信息
	 * 
	 * @param chartsetting
	 *            设置对象
	 * @param prefs
	 *            首选项对象
	 * */
	@SuppressWarnings("rawtypes")
	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(
			@ModelAttribute("chartsetting") Chartsetting chartsetting,
			PortletPreferences prefs, ActionRequest request,
			ActionResponse response) {

		List<String> errorMessages = new ArrayList<String>();
		Map mapField;
		try {
			mapField = BeanUtils.describe(chartsetting);
			Object[] keyValuePairs = mapField.entrySet().toArray();
			for (int i = 0; i < keyValuePairs.length; i++) {
				Map.Entry entry = (Map.Entry) keyValuePairs[i];
				String key = entry.getKey().toString();
				String val = entry.getValue() == null ? "" : entry.getValue()
						.toString();
				prefs.setValue(key, val);
			}
			String buildId = chartsetting.getBuildId();
			if (StringUtils.hasLength(buildId)) {
				Buildsettinginfo buildsettinginfo = buildService
						.getBuildsettinginfo(buildId);
				prefs.setValue("settingWsUrl",
						buildsettinginfo.getSettingWsurl());
			}
			// 开始拼凑tagid 序列
			String[] tagids = chartService.getTagids(request,chartsetting);
			prefs.setValue("formula", tagids[0]);
			prefs.setValue("tagids", tagids[1]);

			prefs.store();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			logger.error(e);
		} catch (InvocationTargetException e) {
			e.printStackTrace();
			logger.error(e);
		} catch (NoSuchMethodException e1) {
			e1.printStackTrace();
			logger.error(e1);
		} catch (Exception e) {
			logger.error(e);
		}
		response.setRenderParameter("", "");
		request.setAttribute("errorMessages", errorMessages);
		request.setAttribute("successMessages", "操作成功");
	}

	
}
