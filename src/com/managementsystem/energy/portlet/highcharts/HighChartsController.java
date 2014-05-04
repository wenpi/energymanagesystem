package com.managementsystem.energy.portlet.highcharts;

import javax.portlet.PortletPreferences;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.portlet.highcharts.constants.HighchartsConstants;
import com.managementsystem.energy.portlet.highcharts.jackson.JacksonIgnoreNullWapper;

/**  
HighCharts图标展示portlet
 @author allchin
 modified@2013年8月1日  下午3:40:18
 */
@Controller
@RequestMapping("VIEW")
public class HighChartsController {
	private final Log logger = LogFactory.getLog(HighChartsController.class);
	@RenderMapping()
	public ModelAndView setup(PortletPreferences prefs){
		ModelAndView mav = new ModelAndView("portlet/highcharts/highcharts");
		String json=null;
		try {
			json = JacksonIgnoreNullWapper.writeValueAsString(getConfigFormat(prefs));
		}   catch ( Exception e) {
			 
			e.printStackTrace();
		}
		mav.addObject("configJson", json); 
		
		return mav;
	}
	
	@ResourceMapping(value="config")
	public ConfigFormat getConfigFormat(PortletPreferences prefs){
		ConfigFormat cf=new ConfigFormat();
		String json = prefs.getValue(HighchartsConstants.CONFIG_JSON_KEY, "{}");
				
		try {
			cf=JacksonIgnoreNullWapper.jsonToBean(json, ConfigFormat.class);
		} catch ( Exception e) {
			 
			e.printStackTrace();
		}
	 
		return cf;
	}
}
