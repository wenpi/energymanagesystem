package com.managementsystem.energy.portlet.weather;


import java.util.List;

import javax.portlet.PortletPreferences;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Districtinfo;
import com.managementsystem.energy.portlet.weather.model.Weather;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.DistrictService;
import com.managementsystem.energy.service.WeatherViewService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.portlet.weather.WeatherService;


@Controller
@RequestMapping("VIEW")
public class WeatherViewController extends BaseController {
	private final Log logger = LogFactory.getLog(WeatherViewController.class);

	@Autowired
	private WeatherViewService weatherViewService;
	@Autowired
	private BuildService buildService;
	@Autowired
	private DistrictService districtService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		String districtPinyin = "";
		Buildinfo buildinfo = null;
		String errmsg = "";
		if (prefs.getMap().size() == 0) {
			buildinfo = new Buildinfo();
		} else {
			String buildId = prefs.getValue("buildId", "");
			String fate = prefs.getValue("fate", "");
			if (StringUtils.hasLength(buildId)) {
				buildinfo = buildService.getBuildinfo(buildId);

				String buildDistrictid = buildinfo.getBuildDistrictid();
				Districtinfo districtinfo = districtService
						.getDistrictinfo(buildDistrictid);
				districtPinyin = districtinfo.getWoeid();
			}
			model.addAttribute("fate", fate);
		}
		List<Weather> weathers = null;
		if (StringUtils.hasLength(districtPinyin)) {
			try {
				weathers = weatherViewService.getQueryresult(districtPinyin);
			} catch (Exception e) {
				e.printStackTrace();
				logger.error(e);
				errmsg = "天气数据获取失败,失败原因可能是:" + e.getMessage();
			}
		} else {
			errmsg = "";
		}
		model.addAttribute("weathers", weathers);
		model.addAttribute("errmsg", errmsg);
		return PORTLETFOLDER + "weather/weatherView";
	}
	
	
	
}
