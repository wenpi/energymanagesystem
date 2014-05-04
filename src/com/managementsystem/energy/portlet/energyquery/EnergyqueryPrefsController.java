package com.managementsystem.energy.portlet.energyquery;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletPreferences;
import javax.portlet.ReadOnlyException;
import javax.portlet.ValidatorException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.web.PortletBaseController;

/**
 * 能耗查询首选项设置
 * @author CHENPING 2012-09-04
 * */
@Controller
@RequestMapping("EDIT")
public class EnergyqueryPrefsController extends PortletBaseController  {

	
	@RenderMapping
	public ModelAndView showEnergyquery(PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		mav.setView(PORTLETFOLDER + "energyquery/energyqueryPrefs");
		return mav;
	}

	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(PortletPreferences prefs, ActionRequest request,
			ActionResponse response) {	
		Enumeration<String> keys = request.getParameterNames();
		String key = null;
		while (keys.hasMoreElements()) {
			key = keys.nextElement().toString();
			try {
				prefs.setValue(key,request.getParameter(key).toString());
			} catch (ReadOnlyException e) {
				e.printStackTrace();
			}
		}
		try {
			prefs.store();
		} catch (ValidatorException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		response.setRenderParameter("", "");
		request.setAttribute("successMessages", "操作成功");
	}
	
	
}
