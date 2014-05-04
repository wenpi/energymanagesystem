package com.managementsystem.portlet.integration;

import javax.portlet.PortletPreferences;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("VIEW")
public class IntegrationViewController extends BaseController {

	/**
	 * 设置展示设备运行数据
	 * */
	@RenderMapping
	public ModelAndView setup(PortletPreferences prefs) {
		
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName(PORTLETFOLDER + "integration/view");
		return mav;
	}
}
