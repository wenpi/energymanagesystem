package com.managementsystem.energy.portlet.eachenergyuse;

import javax.portlet.PortletPreferences;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.portlet.energystatic.model.EnergyStaticPreferenceInfo;
import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.portlet.energystatistic.service.EnergyStatisticService;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("VIEW")
public class EachEnergyUseChartView extends BaseController {

	@Autowired
	private PreferenceInfoService preferenceInfoService;

	@Autowired
	private EnergyStatisticService energyStatisticService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
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
		model.addAttribute("eachEnergy", energyStaticPreferenceInfo);

		return PORTLETFOLDER + "eachenergyuse/eachEnergyUseChartView";
	}
	
}
