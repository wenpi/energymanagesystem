package com.managementsystem.energy.portlet.weather;

import java.io.IOException;
import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletPreferences;
import javax.portlet.ReadOnlyException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;


import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("Edit")
public class WeatherPreferenceController extends BaseController {
	private final Log logger = LogFactory.getLog(WeatherPreferenceController.class);
	
	@Autowired
	private BuildService buildService;
	/**
	 * 设置
	 * */
	@RenderMapping
	public ModelAndView setup(RenderRequest request, RenderResponse response,
			PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		
		Buildinfo buildinfo = null;
		if (prefs.getMap().size() == 0) {
			buildinfo = new Buildinfo();
		} else {
			String buildId = prefs.getValue("buildId", "");
			if(StringUtils.hasLength(buildId)){
			buildinfo = buildService.getBuildinfo(buildId);
			}
		}
		mav.addObject("buildinfo", buildinfo);
		mav.setViewName(PORTLETFOLDER + "weather/preferences");
		return mav;
	}
	
	/**
	 * 保存
	 * 
	 * @param buildinfo 设置对象
	 * @param prefs	 首选项对象
	 * */
	@SuppressWarnings("rawtypes")
	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(PortletPreferences prefs, ActionRequest request,
			ActionResponse response) throws PortletException,
			ReadOnlyException, IOException {
		
		List<String> errorMessages = new ArrayList<String>();
		Map mapField;
		try {
			String buildId = "", fate = "";
			if(request.getParameter("buildId")!=null) {
				buildId = request.getParameter("buildId");
			}
			prefs.setValue("buildId",buildId);
			
			if(request.getParameter("fate")!=null) {
				fate = request.getParameter("fate");
			}
			prefs.setValue("fate",fate);
			
			prefs.store();
		} catch(Exception e) {
			e.printStackTrace();
			logger.error(e);
		}
		response.setRenderParameter("", "");
		request.setAttribute("errorMessages", errorMessages);
		request.setAttribute("successMessages", "操作成功");
	}
}
