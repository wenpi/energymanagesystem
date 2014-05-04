package com.managementsystem.energy.portlet.energysavingtechbuild;

import javax.portlet.PortletPreferences;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.web.PortletBaseController;

/**
 * 节能技术应用建筑列表模块
 * */
@Controller
@RequestMapping("VIEW")
public class EnergysavingtechbuildViewController extends PortletBaseController  {
	@RenderMapping
	public ModelAndView setup(PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		mav.setView(PORTLETFOLDER + "energysavingtechbuild/buildlistView");
		return mav;
	}
}
