package com.managementsystem.energy.portlet.buildingarea;

import java.util.ArrayList;
import java.util.List;

import javax.portlet.PortletPreferences;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.domain.Buildregioninfo;
import com.managementsystem.energy.service.BuildregioninfoService;
import com.managementsystem.energy.web.PortletBaseController;

@Controller
@RequestMapping("VIEW")
public class BuildingareaViewController extends PortletBaseController {

	@Autowired
	private BuildregioninfoService buildregioninfoService;

	/**
	 * 显示建筑区域
	 * */
	@RenderMapping
	public ModelAndView setup(PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		String buildId = prefs.getValue("buildId", "");
		List<Buildregioninfo> rootRegions = null;
		if (StringUtils.hasLength(buildId)) {
			rootRegions = new ArrayList<Buildregioninfo>(
					buildregioninfoService.getParentBuildregioninfos(buildId));
		}
		mav.addObject("parentRegions", rootRegions);
		mav.setView(PORTLETFOLDER + "buildingarea/buildingareaView");
		return mav;
	}

}
