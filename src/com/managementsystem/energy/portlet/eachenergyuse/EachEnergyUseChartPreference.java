package com.managementsystem.energy.portlet.eachenergyuse;

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

import com.managementsystem.energy.portlet.common.CommonChartPreferenceController;
import com.managementsystem.energy.portlet.energystatic.model.EnergyStaticPreferenceInfo;
import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("Edit")
public class EachEnergyUseChartPreference extends BaseController {

	private final Log logger = LogFactory
			.getLog(EachEnergyUseChartPreference.class);//

	@Autowired
	private PreferenceInfoService preferenceInfoService;

	/**
	 * 设置
	 * */
	@RenderMapping
	public ModelAndView setup(RenderRequest request, RenderResponse response,
			PortletPreferences prefs) {

		ModelAndView mav = new ModelAndView();

		EnergyStaticPreferenceInfo energyStaticPreferenceInfo = null;
		if (prefs.getMap().size() == 0) {
			energyStaticPreferenceInfo = new EnergyStaticPreferenceInfo();
		} else {
			try {
				energyStaticPreferenceInfo = (EnergyStaticPreferenceInfo)preferenceInfoService.getPreferenceInfo(prefs,new EnergyStaticPreferenceInfo());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		mav.addObject("eachEnergy", energyStaticPreferenceInfo);

		mav.setViewName(PORTLETFOLDER + "eachenergyuse/eachEnergyUseChartPreferences");
		return mav;
	}

	/**
	 * 保存
	 * 
	 * @param buildinfo
	 *            设置对象
	 * @param prefs
	 *            首选项对象
	 * */
	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(
			@ModelAttribute("energyStaticPreferenceInfo") EnergyStaticPreferenceInfo energyStaticPreferenceInfo,
			PortletPreferences prefs, ActionRequest request,
			ActionResponse response) throws PortletException,
			ReadOnlyException, IOException {

		List<String> errorMessages = new ArrayList<String>();
		try {
			preferenceInfoService.savePreferenceInfo(prefs, energyStaticPreferenceInfo);
		} catch (Exception e) {
			e.printStackTrace();
			errorMessages.add(e.getMessage());
			logger.error(e);
		}
		request.setAttribute("errorMessages", errorMessages);
		request.setAttribute("successMessages", "操作成功");
	}
}
