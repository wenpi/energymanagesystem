package com.managementsystem.energy.portlet.buildinfo;

import java.util.Iterator;
import java.util.Set;

import javax.portlet.PortletPreferences;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.domain.Buildaddfile;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Dictitem;
import com.managementsystem.energy.domain.Districtinfo;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.DistrictService;
import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("VIEW")
public class BuildViewController extends BaseController {

	@Autowired
	private BuildService buildService;
	@Autowired
	private DistrictService districtService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
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
			// buildId = "000001070001";
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
					"build_function", buildinfo.getBuildStrutype().toString());
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

		return PORTLETFOLDER + "buildinfo/buildView";
	}
}
