package com.managementsystem.energy.portlet.totalwateruse;

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
@RequestMapping("VIEW")//与配置文件对应
public class TotalWaterUseChartViewController extends BaseController {

	@Autowired
	private PreferenceInfoService preferenceInfoService;// 首选项信息

/*
 * 与Action相应-调用Service层方法，完成业务逻辑
 * 
 * return JSP页面路径-指引跳转到相应页面
 */
	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		EnergyStaticPreferenceInfo energyStaticPreferenceInfo= null;

		if (prefs.getMap().size()== 0) {
			energyStaticPreferenceInfo = new EnergyStaticPreferenceInfo();
		} else {
			try {
				energyStaticPreferenceInfo =(EnergyStaticPreferenceInfo) preferenceInfoService.getPreferenceInfo(prefs,new EnergyStaticPreferenceInfo());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		model.addAttribute("totalWater", energyStaticPreferenceInfo);
		return PORTLETFOLDER + "totalwateruse/totalWaterUseChartView";// jsp文件路径
	}
}
