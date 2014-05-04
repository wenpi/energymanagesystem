package com.managementsystem.energy.portlet.highcharts;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletPreferences;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.portlet.highcharts.constants.HighchartsConstants;
import com.managementsystem.energy.portlet.highcharts.jackson.JacksonIgnoreNullWapper;

/**  
编辑portlet配置控制器
 @author allchin
 modified@2013年8月1日  下午4:53:35
 */
@Controller
@RequestMapping("EDIT")
public class HighChartsPrefController {
	private final Log logger = LogFactory.getLog(HighChartsController.class);
	@RenderMapping()
	public ModelAndView setup(){
		ModelAndView mav = new ModelAndView("portlet/highcharts/config");
  
		return mav;
	}
	
	@ActionMapping(params = "action=savePreferences")
	public ConfigFormat buildConfigFormat(
										@ModelAttribute("cf") ConfigFormat cf,
										PortletPreferences prefs, 
										ActionRequest request,
										ActionResponse response){
		String json=null;
		String errorMsg=null;
		
		try {
			json = JacksonIgnoreNullWapper.writeValueAsString(cf);
			prefs.setValue(HighchartsConstants.CONFIG_JSON_KEY, json);
			prefs.store();
		}   
		catch (Exception e) { 	 
			e.printStackTrace();
			errorMsg=e.getMessage();
		}
		
		//
		response.setRenderParameter("", "");
		request.setAttribute("errorMessages", errorMsg);
		request.setAttribute("successMessages", "操作成功");
		 
		return cf;
	}
}
