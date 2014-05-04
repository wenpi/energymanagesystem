package com.managementsystem.energy.portlet.chart;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletPreferences;
import javax.portlet.ReadOnlyException;
import javax.portlet.ValidatorException;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;


import com.managementsystem.energy.portlet.chart.model.ReportSetting;
import com.managementsystem.energy.portlet.chart.service.ChartService;
import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("EDIT")
public class ReportPrefsController extends BaseController {

	private static final Log logger = LogFactory
			.getLog(ReportPrefsController.class);

	@Autowired
	private ChartService chartService;

	/**
	 * 设置道选项表单
	 * */
	@RenderMapping
	public ModelAndView setupPrefsForm(PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		logger.debug("Requesting of setupPrefsForm "
				+ ReportPrefsController.class);
		ReportSetting reportSetting = null;
		if (prefs.getMap().size() == 0) {
			reportSetting = new ReportSetting();
		} else {
			reportSetting = chartService.getReportSetting(prefs);
		}
		mav.addObject("reportSetting", reportSetting);
		mav.setViewName(PORTLETFOLDER + "chart/reportPrefs");
		return mav;
	}

	/**
	 * 保存首选项信息
	 * */
	@SuppressWarnings("rawtypes")
	@ActionMapping(params = "action=savePreferences")
	public void processSavePrefs(
			@ModelAttribute("reportSetting") ReportSetting reportSetting,
			PortletPreferences prefs, ActionRequest request,
			ActionResponse response) {

		List<String> errorMessages = new ArrayList<String>();
		Map mapField;
		try {
			mapField = BeanUtils.describe(reportSetting);
			Object[] keyValuePairs = mapField.entrySet().toArray();
			for (int i = 0; i < keyValuePairs.length; i++) {
				Map.Entry entry = (Map.Entry) keyValuePairs[i];
				String key = entry.getKey().toString();
				String val = entry.getValue() == null ? "" : entry.getValue()
						.toString();
				prefs.setValue(key, val);
			}
			// 开始拼凑tagid 序列
			String[] tagids = chartService.getTagids(request,reportSetting);
			prefs.setValue("formula", tagids[0]);
			prefs.setValue("tagids", tagids[1]);

			prefs.store();
		} catch (IllegalAccessException e) {
			errorMessages.add(e.getMessage());
			e.printStackTrace();
			logger.error(e);
		} catch (InvocationTargetException e) {
			errorMessages.add(e.getMessage());
			e.printStackTrace();
			logger.error(e);
		} catch (NoSuchMethodException e) {
			errorMessages.add(e.getMessage());
			e.printStackTrace();
			logger.error(e);
		} catch (ReadOnlyException e) {
			errorMessages.add(e.getMessage());
			e.printStackTrace();
			logger.error(e);
		} catch (ValidatorException e) {
			errorMessages.add(e.getMessage());
			e.printStackTrace();
			logger.error(e);
		} catch (IOException e) {
			errorMessages.add(e.getMessage());
			e.printStackTrace();
			logger.error(e);
		}

		// String[] tagids = chartService.getTagids(request);
		// prefs.setValue("tagids", tagids[1]);
		response.setRenderParameter("", "");
		request.setAttribute("errorMessages", errorMessages);
		request.setAttribute("successMessages", "操作成功");
	}

}
