package com.managementsystem.energy.portlet.running;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletPreferences;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.portlet.chart.ChartPreferenceController;
import com.managementsystem.energy.portlet.running.model.PreferenceModel;
import com.managementsystem.energy.portlet.running.service.PreferenceService;
import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("EDIT")
public class RunningPreferenceController extends BaseController {

	private final Log logger = LogFactory.getLog(ChartPreferenceController.class);
	
	@Autowired
	private PreferenceService preferenceService;

	/**
	 * 设置首选项
	 * */
	@RenderMapping
	public ModelAndView setup(RenderRequest request, RenderResponse response,
			PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();

		PreferenceModel preferenceModel = null;
		if (prefs.getMap().size() == 0) {
			preferenceModel = new PreferenceModel();
			preferenceModel.setSvgFolder("svg");
		} else {
			preferenceModel = preferenceService.getPreferenceModel(prefs);
		}
		mav.addObject("preferenceModel", preferenceModel);
		mav.setViewName(PORTLETFOLDER + "running/preferences");
		return mav;
	}

	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(
			@ModelAttribute("preferenceModel") PreferenceModel preferenceModel,
			PortletPreferences prefs, ActionRequest request,
			ActionResponse response) {
		try {
			preferenceService.savePreferenceModel(preferenceModel, prefs);
		}catch(Exception e) {
			e.printStackTrace();
			logger.error(e);
			request.setAttribute("errorMessages", e.getMessage());
		}
		response.setRenderParameter("", "");
		request.setAttribute("successMessages", "操作成功");
	}

}
