package com.managementsystem.energy.portlet.chart;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;
import com.managementsystem.energy.portlet.weather.SunriseSunset;
import com.managementsystem.energy.service.EnergyCommonService;
import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("VIEW")
public class BoardViewController extends BaseController {

	@Autowired
	private EnergyCommonService energyCommonService;

	/**
	 * 显示仪表盘图表
	 * */
	@RenderMapping
	public ModelAndView setup() {
		ModelAndView mav = new ModelAndView();

		mav.setView(PORTLETFOLDER + "dashboard/boardView");
		return mav;
	}

	/**
	 * 获取对应url上的内容
	 * */
	@ResourceMapping(value = "getContentByUrl")
	public Map<String, Object> getContentByUrl(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {

		String url = request.getParameter("url");
		String latitude = request.getParameter("latitude"); // 纬度
		String longitude = request.getParameter("longitude"); // 经度
		String timezone = request.getParameter("timezone");
		String api = request.getParameter("api");
		String charset = request.getParameter("charset");
		
		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			// 求对应的json数据
			resultMap = energyCommonService.getContentByUrl(url, api, charset);
			
			// 根据经纬度求日出日落时间 
			if (latitude != null && latitude.trim().length() > 0 && longitude != null && longitude.trim().length() > 0) {
				// 获取日出日落时间 
				String sunup = SunriseSunset.getSunrise(new Date(), Double.parseDouble(latitude), Double.parseDouble(longitude), Integer.parseInt(timezone));
				String sundown = SunriseSunset.getSunset(new Date(), Double.parseDouble(latitude), Double.parseDouble(longitude), Integer.parseInt(timezone));
				
				resultMap.put("sunup", sunup); // 日出
				resultMap.put("sundown", sundown); // 日落
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultMap;
	}
}
