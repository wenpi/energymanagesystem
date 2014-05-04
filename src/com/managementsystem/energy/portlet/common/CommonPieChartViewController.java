package com.managementsystem.energy.portlet.common;

import javax.portlet.PortletPreferences;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.portlet.energystatistic.service.EnergyStatisticService;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.web.BaseController;

/**
 * 共用的多个图表的渲染页面
 * 
 * @author zouzhixiang
 * 
 */
@Controller
@RequestMapping("VIEW")
public class CommonPieChartViewController extends BaseController {

	@Autowired
	private PreferenceInfoService preferenceInfoService;

	@Autowired
	private EnergyStatisticService energyStatisticService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		PreferenceInfo preferenceinfo = null;

		if (prefs.getMap().size() == 0) {
			preferenceinfo = new PreferenceInfo();
		} else {
			preferenceinfo = preferenceInfoService.getPreferenceInfo(prefs);
		}
		model.addAttribute("commonpiechart", preferenceinfo);

		return PORTLETFOLDER + "common/commonPieChartView";
	}
}