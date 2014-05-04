package com.managementsystem.energy.portlet.coreinfo;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Buildaddfile;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Dictitem;
import com.managementsystem.energy.domain.Districtinfo;
import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.portlet.energystatistic.service.EnergyStatisticService;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.DistrictService;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.ui.easyui.Resultmsg;

/**
 * 首页关键信息
 * 
 * @author zouzhixiang
 * 
 */
@Controller
@RequestMapping("VIEW")
public class CoreInfoViewController extends BaseController {

	@Autowired
	private BuildService buildService;

	@Autowired
	private PreferenceInfoService preferenceInfoService;

	@Autowired
	private DistrictService districtService;

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
		model.addAttribute("coreinfo", preferenceinfo);

		// 求 建筑基本信息 相关的数值
		Buildinfo buildinfo = null;
		String addfilePath = "";
		String buildDistrictName = "";
		String buildStrutype = "";
		String buildFunction = ""; // 建筑类型
		String buildAirtype = "";
		if (prefs.getMap().size() == 0) {
			buildinfo = new Buildinfo();
		} else {
			String buildId = prefs.getValue("buildId", "");

			if (StringUtils.hasLength(buildId)) {
				buildinfo = buildService.getBuildcover(buildId);
				if (buildinfo != null
						&& buildinfo.getBuildaddfiles().size() > 0) {
					Set<Buildaddfile> addfiles = buildinfo.getBuildaddfiles();
					for (Iterator<Buildaddfile> it = addfiles.iterator(); it
							.hasNext();) {
						Buildaddfile addfile = it.next();
						if (addfile.getAddfileFunctype() == 0) {
							addfilePath = addfile.getAddfilePath();
							break;
						}
					}
				}
			}
		}

		model.addAttribute("addfilePath", addfilePath);
		model.addAttribute("buildinfo", buildinfo);
		if (buildinfo.getBuildDistrictid() != null) {
			Districtinfo districtinfo = new Districtinfo();
			districtinfo = districtService.getDistrictinfo(buildinfo
					.getBuildDistrictid());
			buildDistrictName = districtinfo.getDistrictName();
			model.addAttribute("buildDistrictName", buildDistrictName);
		}
		if (buildinfo.getBuildStrutype() != null) {
			Dictitem dictitem = null;
			dictitem = dictionaryService.getDictitemByItemcode(
					"build_strutype", buildinfo.getBuildStrutype().toString());
			buildStrutype = dictitem.getItemName();
			model.addAttribute("buildStrutype", buildStrutype);
		}
		// 建筑类型
		if (buildinfo.getBuildFunction() != null) {
			Dictitem dictitem = null;
			dictitem = dictionaryService.getDictitemByItemcode(
					"build_function", buildinfo.getBuildFunction().toString());
			buildFunction = dictitem.getItemName();
			model.addAttribute("buildFunction", buildFunction);
		}
		if (buildinfo.getBuildAirtype() != null) {
			Dictitem dictitem = new Dictitem();
			dictitem = dictionaryService.getDictitemByItemcode("build_airtype",
					buildinfo.getBuildAirtype().toString());
			buildAirtype = dictitem.getItemName();
			model.addAttribute("buildAirtype", buildAirtype);
		}

		return PORTLETFOLDER + "index/coreInfoView";
	}
}
