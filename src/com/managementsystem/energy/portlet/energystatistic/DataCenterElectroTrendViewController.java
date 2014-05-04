package com.managementsystem.energy.portlet.energystatistic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.portlet.chart.model.Queryresult;
import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.DistrictService;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.web.BaseController;

/**
 * 数据中心用电趋势
 * 
 * @author zouzhixiang
 * 
 */
@Controller
@RequestMapping("VIEW")
public class DataCenterElectroTrendViewController extends BaseController {

	@Autowired
	private PreferenceInfoService preferenceInfoService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		PreferenceInfo preferenceinfo = null;

		if (prefs.getMap().size() == 0) {
			preferenceinfo = new PreferenceInfo();
		} else {
			preferenceinfo = preferenceInfoService.getPreferenceInfo(prefs);
		}
		model.addAttribute("datacenterelectrotrend", preferenceinfo);
		
		return PORTLETFOLDER + "energystatistic/dataCenterElectroTrendView";
	}

}
