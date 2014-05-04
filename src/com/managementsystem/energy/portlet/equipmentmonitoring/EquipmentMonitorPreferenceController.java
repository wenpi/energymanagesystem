package com.managementsystem.energy.portlet.equipmentmonitoring;

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
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.web.BaseController;

/**
 * 运行监测——设备检测页面首选项
 * 
 * @author zhangtianle
 * 
 *         引导页面 保存首选项
 */
@Controller
@RequestMapping("Edit")
public class EquipmentMonitorPreferenceController extends BaseController {
	private final Log logger = LogFactory
			.getLog(EquipmentMonitorPreferenceController.class);
	@Autowired
	private PreferenceInfoService preferenceInfoService;

	@RenderMapping
	public ModelAndView setup(RenderRequest request, RenderResponse response,
			PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		EnergyStaticPreferenceInfo energyStaticPreferenceInfo = null;
		if (prefs.getMap().size() == 0) {
			energyStaticPreferenceInfo = new EnergyStaticPreferenceInfo();
		} else {
			try {
				energyStaticPreferenceInfo = (EnergyStaticPreferenceInfo) preferenceInfoService
						.getPreferenceInfo(prefs,
								new EnergyStaticPreferenceInfo());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		mav.addObject("equipmentMonitor", energyStaticPreferenceInfo);
		mav.setViewName(PORTLETFOLDER + "equipmentmonitor/equipmentMoniotrPreference");
		return mav;
	}

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
			logger.equals(e);
		}
		response.setRenderParameter("","");
		request.setAttribute("errorMessages", errorMessages);
		request.setAttribute("successMessages", "操作成功");
	}
}
