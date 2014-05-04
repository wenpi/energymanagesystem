package com.managementsystem.energy.portlet.running;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.portlet.PortletPreferences;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.portlet.running.model.PreferenceModel;
import com.managementsystem.energy.portlet.running.service.PreferenceService;
import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("VIEW")
public class RunningViewController extends BaseController {

	@Autowired
	private PreferenceService preferenceService;
	
	/**
	 * 设置展示设备运行数据
	 * */
	@RenderMapping
	public ModelAndView setup(PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		
		PreferenceModel preferenceModel  = preferenceService.getPreferenceModel(prefs);
		if(preferenceModel==null)
			preferenceModel = new PreferenceModel();
		
		mav.addObject("preferenceModel", preferenceModel);
		
		mav.setViewName(PORTLETFOLDER + "running/deviceView");
		return mav;
	}

}
