package com.managementsystem.energy.portlet.map;

import java.util.Set;

import javax.portlet.PortletPreferences;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Dictitem;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.DictionaryService;
import com.managementsystem.energy.web.PortletBaseController;


/**
 * 能耗地图模块
 * */
@Controller
@RequestMapping("VIEW")
public class MapViewController extends PortletBaseController {

	@Autowired
	private BuildService buildService;
	@Autowired
	private DictionaryService dictionaryService;

	@RenderMapping
	public ModelAndView setup(PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		Set<Buildinfo> buildinfos = buildService.getBuildFullinfos();
		Set<Dictitem> buildfunctions = dictionaryService.getDictitemBygroupCode("build_function");
		mav.addObject("buildinfos", buildinfos);
		mav.addObject("buildfunctions", buildfunctions);
		mav.setView(PORTLETFOLDER + "map/mapView");
		return mav;
	}
	
	
}
