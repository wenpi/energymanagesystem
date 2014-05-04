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
 * 故障诊断/节能评估
 * 
 * @author liuchao
 * 
 */
@Controller
@RequestMapping("VIEW")
public class FaultDiagnosisChartViewController extends BaseController {

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
			}
		}
		model.addAttribute("tbinfo", navigationPreferenceInfo);//保存首选项信息
		return PORTLETFOLDER + "othermodules/faultDiagnosisView";//返回视图
	}
}