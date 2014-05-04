package com.managementsystem.energy.portlet.energypublicity;

import java.util.ArrayList;
import java.util.List;

import javax.portlet.PortletPreferences;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.domain.Bigdistrictinfo;
import com.managementsystem.energy.domain.Buildaddfile;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Dictitem;
import com.managementsystem.energy.domain.Districtinfo;
import com.managementsystem.energy.service.BigdistrictinfoService;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.BuildgroupService;
import com.managementsystem.energy.service.DictionaryService;
import com.managementsystem.energy.service.DistrictService;
import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("VIEW")
public class EnergypublicityViewController extends BaseController {
	private final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private BuildService buildService;

	@Autowired
	private DictionaryService dictionaryService;
	@Autowired
	private DistrictService districtService;
	@Autowired
	private BigdistrictinfoService bigdistrictinfoService;
	
	@Autowired
	private BuildgroupService buildgroupService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		String buildWinframetype = "";
		String buildGlasstype = "";
		String buildWallwintype = "";
		String buildWallwarmtype = "";
		String buildWallmattype = "";
		String buildStrutype = "";
		String buildFunction = "";
		String buildHeattype = "";
		String buildAirtype = "";
		String buildDistrictName = "";
		String addfilePath = "";

		String showDesc = prefs.getValue("showDesc", "");
		Buildinfo buildinfo = new Buildinfo();

		if (showDesc.equals("true")) {
			String buildId = prefs.getValue("buildId", "");
			if (!buildId.equals("")) {
				buildinfo = buildService.getBuildinfo(buildId);
				if (buildinfo != null
						&& buildinfo.getBuildaddfiles().size() > 0) {
					List<Buildaddfile> buildaddfiles = new ArrayList<Buildaddfile>(buildinfo.getBuildaddfiles());
					addfilePath = buildaddfiles.get(0).getAddfilePath();
					model.addAttribute("addfilePath", addfilePath);
				}
			}
			model.addAttribute("mark", "false");
		}
		
		if (showDesc.equals("false")) {
			String buildgroupId = prefs.getValue("buildgroupId", "");
			List<Buildinfo> buildinfoList = new ArrayList<Buildinfo>();
			if (!buildgroupId.equals("")) {
				buildinfoList = new ArrayList<Buildinfo>(buildgroupService.getBuildinfosByBuildgroupId(0, -1, buildgroupId));
			}
			if (buildinfoList.size() > 0)
				buildinfo = buildinfoList.get(0);
			if (buildinfo != null
					&& buildinfo.getBuildaddfiles().size() > 0) {
				List<Buildaddfile> buildaddfiles = new ArrayList<Buildaddfile>(buildinfo.getBuildaddfiles());
				addfilePath = buildaddfiles.get(0).getAddfilePath();
				model.addAttribute("addfilePath", addfilePath);
			}
			model.addAttribute("buildinfoList", buildinfoList);
			model.addAttribute("mark", "true");
		}

		if (showDesc.equals("PT")) {
			List<Buildinfo> buildinfoList = new ArrayList<Buildinfo>();
			buildinfoList = new ArrayList<Buildinfo>(buildService.getAllBuilds(0, -1));
			buildinfo = buildinfoList.get(0);
			if (buildinfo != null
					&& buildinfo.getBuildaddfiles().size() > 0) {
				List<Buildaddfile> buildaddfiles = new ArrayList<Buildaddfile>(buildinfo.getBuildaddfiles());
				addfilePath = buildaddfiles.get(0).getAddfilePath();
				model.addAttribute("addfilePath", addfilePath);
			}
			model.addAttribute("buildinfoList", buildinfoList);
			model.addAttribute("mark", "true");
		}
		if (buildinfo.getBuildWinframetype() != null) {
			Dictitem dictitem = new Dictitem();
			dictitem = dictionaryService.getDictitemByItemcode(
					"build_winframetype", buildinfo.getBuildWinframetype()
							.toString());
			buildWinframetype = dictitem.getItemName();
			model.addAttribute("buildWinframetype", buildWinframetype);
		}
		if (buildinfo.getBuildGlasstype() != null) {
			Dictitem dictitem = new Dictitem();
			dictitem = dictionaryService
					.getDictitemByItemcode("build_glasstype", buildinfo
							.getBuildGlasstype().toString());
			buildGlasstype = dictitem.getItemName();
			model.addAttribute("buildGlasstype", buildGlasstype);
		}
		if (buildinfo.getBuildWallwintype() != null) {
			Dictitem dictitem = new Dictitem();
			dictitem = dictionaryService.getDictitemByItemcode(
					"build_wallwintype", buildinfo.getBuildWallwintype()
							.toString());
			buildWallwintype = dictitem.getItemName();
			model.addAttribute("buildWallwintype", buildWallwintype);
		}
		if (buildinfo.getBuildWallwarmtype() != null) {
			Dictitem dictitem = new Dictitem();
			dictitem = dictionaryService.getDictitemByItemcode(
					"build_wallwarmtype", buildinfo.getBuildWallwarmtype()
							.toString());
			buildWallwarmtype = dictitem.getItemName();
			model.addAttribute("buildWallwarmtype", buildWallwarmtype);
		}
		if (buildinfo.getBuildWallmattype() != null) {
			Dictitem dictitem = new Dictitem();
			dictitem = dictionaryService.getDictitemByItemcode(
					"build_wallmattype", buildinfo.getBuildWallmattype()
							.toString());
			buildWallmattype = dictitem.getItemName();
			model.addAttribute("buildWallmattype", buildWallmattype);
		}
		if (buildinfo.getBuildStrutype() != null) {
			Dictitem dictitem = new Dictitem();
			dictitem = dictionaryService.getDictitemByItemcode(
					"build_strutype", buildinfo.getBuildStrutype().toString());
			buildStrutype = dictitem.getItemName();
			model.addAttribute("buildStrutype", buildStrutype);
		}
		if (buildinfo.getBuildHeattype() != null) {
			Dictitem dictitem = new Dictitem();
			dictitem = dictionaryService.getDictitemByItemcode(
					"build_heattype", buildinfo.getBuildHeattype().toString());
			buildHeattype = dictitem.getItemName();
			model.addAttribute("buildHeattype", buildHeattype);
		}
		if (buildinfo.getBuildAirtype() != null) {
			Dictitem dictitem = new Dictitem();
			dictitem = dictionaryService.getDictitemByItemcode("build_airtype",
					buildinfo.getBuildAirtype().toString());
			buildAirtype = dictitem.getItemName();
			model.addAttribute("buildAirtype", buildAirtype);
		}
		if (buildinfo.getBuildFunction() != null) {
			Dictitem dictitem = new Dictitem();
			dictitem = dictionaryService.getDictitemByItemcode(
					"build_function", buildinfo.getBuildFunction().toString());
			buildFunction = dictitem.getItemName();
			model.addAttribute("buildFunction", buildFunction);
		}
		if (buildinfo.getBuildDistrictid() != null) {
			Districtinfo districtinfo = districtService.getDistrictinfo(buildinfo
					.getBuildDistrictid());
			buildDistrictName = districtinfo.getDistrictName();
			model.addAttribute("buildDistrictName", buildDistrictName);
		}
		String buildClimaticregion = null;
		if (StringUtils.hasLength(buildinfo.getBuildClimaticregion())) {
			Bigdistrictinfo bigdistrictinfo = bigdistrictinfoService
					.getBigdistrictinfo(buildinfo.getBuildClimaticregion());
			if (bigdistrictinfo != null) {
				buildClimaticregion = bigdistrictinfo.getBigdistrictName();
			}
		}
		model.addAttribute("buildClimaticregion", buildClimaticregion);
		model.addAttribute("buildinfo", buildinfo);
		return PORTLETFOLDER + "energypublicity/energypublicityView";
	}

	@RenderMapping(params = "action=gets")
	public ModelAndView gets(
			@RequestParam(value = "buildId", required = true) String buildId,
			PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName(PORTLETFOLDER + "energypublicity/energypublicityView");
		String buildWinframetype = "";
		String buildGlasstype = "";
		String buildWallwintype = "";
		String buildWallwarmtype = "";
		String buildWallmattype = "";
		String buildStrutype = "";
		String buildFunction = "";
		String buildHeattype = "";
		String buildAirtype = "";
		String buildDistrictName = "";
		String buildClimaticregion = "";
		String addfilePath = "";
		try {
			List<Buildinfo> buildinfoList = new ArrayList<Buildinfo>();
			Buildinfo buildinfo = buildService.getBuildinfo(buildId);
			if (buildinfo != null
					&& buildinfo.getBuildaddfiles().size() > 0) {
				List<Buildaddfile> buildaddfiles = new ArrayList<Buildaddfile>(buildinfo.getBuildaddfiles());
				addfilePath = buildaddfiles.get(0).getAddfilePath();
				mav.addObject("addfilePath", addfilePath);
			}
			String buildgroupId = prefs.getValue("buildgroupId", "");
			if (StringUtils.hasLength(buildgroupId)) {
				buildinfoList = 
				new ArrayList<Buildinfo>(buildgroupService.getBuildinfosByBuildgroupId(0, -1, buildgroupId));
				
			} else {
				buildinfoList = new ArrayList<Buildinfo>(buildService.getAllBuilds(0, -1));
			}
			mav.addObject("buildinfoList", buildinfoList);
			mav.addObject("buildinfo", buildinfo);
			mav.addObject("mark", "true");
			Dictitem dictitem = null;
			if (buildinfo.getBuildWinframetype() != null) {
				dictitem = dictionaryService.getDictitemByItemcode(
						"build_winframetype", buildinfo.getBuildWinframetype()
								.toString());
				if (dictitem != null) {
					buildWinframetype = dictitem.getItemName();
				}
			}
			mav.addObject("buildWinframetype", buildWinframetype);

			if (buildinfo.getBuildGlasstype() != null) {
				dictitem = dictionaryService.getDictitemByItemcode(
						"build_glasstype", buildinfo.getBuildGlasstype()
								.toString());
				buildGlasstype = dictitem.getItemName();
			}
			mav.addObject("buildGlasstype", buildGlasstype);

			if (buildinfo.getBuildWallwintype() != null) {
				dictitem = dictionaryService.getDictitemByItemcode(
						"build_wallwintype", buildinfo.getBuildWallwintype()
								.toString());
				if (dictitem != null) {
					buildWallwintype = dictitem.getItemName();
				}
			}
			mav.addObject("buildWallwintype", buildWallwintype);

			if (buildinfo.getBuildWallwarmtype() != null) {
				dictitem = dictionaryService.getDictitemByItemcode(
						"build_wallwarmtype", buildinfo.getBuildWallwarmtype()
								.toString());
				if (dictitem != null) {
					buildWallwarmtype = dictitem.getItemName();
				}
			}
			mav.addObject("buildWallwarmtype", buildWallwarmtype);

			if (buildinfo.getBuildWallmattype() != null) {
				dictitem = dictionaryService.getDictitemByItemcode(
						"build_wallmattype", buildinfo.getBuildWallmattype()
								.toString());
				if (dictitem != null)
					buildWallmattype = dictitem.getItemName();
			}
			mav.addObject("buildWallmattype", buildWallmattype);

			if (buildinfo.getBuildStrutype() != null) {
				dictitem = dictionaryService.getDictitemByItemcode(
						"build_strutype", buildinfo.getBuildStrutype()
								.toString());
				if (dictitem != null)
					buildStrutype = dictitem.getItemName();
			}
			mav.addObject("buildStrutype", buildStrutype);

			if (buildinfo.getBuildHeattype() != null) {
				dictitem = dictionaryService.getDictitemByItemcode(
						"build_heattype", buildinfo.getBuildHeattype()
								.toString());
				if (dictitem != null)
					buildHeattype = dictitem.getItemName();
			}
			mav.addObject("buildHeattype", buildHeattype);

			if (buildinfo.getBuildAirtype() != null) {
				dictitem = dictionaryService
						.getDictitemByItemcode("build_airtype", buildinfo
								.getBuildAirtype().toString());
				if (dictitem != null)
					buildAirtype = dictitem.getItemName();
			}
			mav.addObject("buildAirtype", buildAirtype);

			if (buildinfo.getBuildFunction() != null) {
				dictitem = dictionaryService.getDictitemByItemcode(
						"build_function", buildinfo.getBuildFunction()
								.toString());
				if (dictitem != null)
					buildFunction = dictitem.getItemName();
			}
			mav.addObject("buildFunction", buildFunction);

			if (StringUtils.hasLength(buildinfo.getBuildDistrictid())) {
				Districtinfo districtinfo = districtService
						.getDistrictinfo(buildinfo.getBuildDistrictid());
				if (districtinfo != null) {
					buildDistrictName = districtinfo.getDistrictName();
				}
			}
			mav.addObject("buildDistrictName", buildDistrictName);

			if (StringUtils.hasLength(buildinfo.getBuildClimaticregion())) {
				Bigdistrictinfo bigdistrictinfo = bigdistrictinfoService
						.getBigdistrictinfo(buildinfo.getBuildClimaticregion());
				if (bigdistrictinfo != null) {
					buildClimaticregion = bigdistrictinfo.getBigdistrictName();
				}
			}
			mav.addObject("buildClimaticregion", buildClimaticregion);

		} catch (Exception e) {
			logger.error(e);
		}
		return mav;
	}
}
