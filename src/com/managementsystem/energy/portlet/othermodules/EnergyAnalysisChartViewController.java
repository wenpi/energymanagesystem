package com.managementsystem.energy.portlet.othermodules;

import javax.portlet.PortletPreferences;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.portlet.preferenceinfo.NavigationPreferenceInfo;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.web.BaseController;

/**
 * 能效分析
 * 
 * @author liuchao
 * 
 */
@Controller
@RequestMapping("VIEW")
public class EnergyAnalysisChartViewController extends BaseController {

	@Autowired
	private PreferenceInfoService preferenceInfoService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		NavigationPreferenceInfo navigationPreferenceInfo = new NavigationPreferenceInfo();

		if (prefs.getMap().size() != 0) {
			try {
				navigationPreferenceInfo = (NavigationPreferenceInfo)preferenceInfoService.getPreferenceInfo(prefs,navigationPreferenceInfo);
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//读取首选项配置信息
		}
		model.addAttribute("tbinfo", navigationPreferenceInfo);//保存首选项信息
		return PORTLETFOLDER + "othermodules/energyAnalysisView";//返回视图
	}
}