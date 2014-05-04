package com.managementsystem.energy.portlet.totalwateruse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletPreferences;
import javax.portlet.ReadOnlyException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.portlet.energystatic.model.EnergyStaticPreferenceInfo;
import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("Edit")
public class TotalWaterUserChartPreferenceController extends BaseController {

	private final Log logger = LogFactory
			.getLog(TotalWaterUserChartPreferenceController.class); // 记录
	@Autowired
	private PreferenceInfoService prefernceInfoService;

	@RenderMapping
	public ModelAndView setup(RenderRequest request, RenderResponse response,
			PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		EnergyStaticPreferenceInfo energyStaticPreferenceInfo = null;

		if (prefs.getMap().size() == 0) {
			energyStaticPreferenceInfo = new EnergyStaticPreferenceInfo();
		} else {
			try {
				energyStaticPreferenceInfo = (EnergyStaticPreferenceInfo)prefernceInfoService
						.getPreferenceInfo(prefs,
								new EnergyStaticPreferenceInfo());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		mav.addObject("totalWater", energyStaticPreferenceInfo);
		mav.setViewName(PORTLETFOLDER
				+ "totalwateruse/totalWaterUseChartPreference");// 返回路径
		return mav;
	}

	/*
	 * 保存首选项内容
	 */
	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(
			@ModelAttribute("energyStaticPreferenceInfo") EnergyStaticPreferenceInfo energyStaticPreferenceInfo,
			PortletPreferences prefs, ActionRequest request,
			ActionResponse response) throws PortletException,
			ReadOnlyException, IOException {

		List<String> errorMessages = new ArrayList<String>();
		try {
			prefernceInfoService.savePreferenceInfo(prefs,
					energyStaticPreferenceInfo);

		} catch (Exception e) {
			e.printStackTrace();
			errorMessages.add(e.getMessage());
			logger.error(e);
		}
		response.setRenderParameter("", "");
		request.setAttribute("errorMessages", errorMessages);
		request.setAttribute("successMessages", "操作成功");
	}
}
