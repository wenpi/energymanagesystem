package com.managementsystem.portlet.quicknavigation;

import javax.portlet.PortletPreferences;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("VIEW")
public class QuickNavigationViewController extends BaseController {

	private static final String VIEW_NAME = "quicknavigation/viewNavigation";

	/**
	 * 显示快捷导航
	 * */
	@RenderMapping
	public ModelAndView setup(PortletPreferences prefs) {

		ModelAndView mav = new ModelAndView();

		mav.setViewName(PORTLETFOLDER + VIEW_NAME);
		return mav;
	}

}
