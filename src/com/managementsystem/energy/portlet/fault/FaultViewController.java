package com.managementsystem.energy.portlet.fault;

import javax.portlet.PortletPreferences;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.portlet.preferenceinfo.NavigationPreferenceInfo;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.web.BaseController;

/**
 * 故障诊断
 * 
 * @author ZOUZHIXIANG
 * 
 */
@Controller
@RequestMapping("VIEW")
public class FaultViewController extends BaseController {

	@Autowired
	private PreferenceInfoService preferenceInfoService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		PreferenceInfo preferenceinfo = new PreferenceInfo();

		if (prefs.getMap().size() != 0) {
			try {
				preferenceinfo = (PreferenceInfo) preferenceInfoService
						.getPreferenceInfo(prefs, preferenceinfo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("tbinfo", preferenceinfo);// 保存首选项信息
		return PORTLETFOLDER + "fault/faultView";// 返回视图
	}
}