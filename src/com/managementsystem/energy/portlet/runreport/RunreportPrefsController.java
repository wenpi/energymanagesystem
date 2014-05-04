package com.managementsystem.energy.portlet.runreport;

import java.io.IOException;
import java.util.Enumeration;

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

import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("EDIT")
public class RunreportPrefsController extends BaseController {

	@RenderMapping
	public ModelAndView showPrefrences() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(PORTLETFOLDER + "runreport/runreportPrefs");
		return mav;
	}

	/**
	 * 保存首选项
	 * 
	 * @param prefs 首选项对象
	 * @param request	请求对象
	 * @param response	响应对象
	 * */
	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(PortletPreferences prefs,
			ActionRequest request, ActionResponse response) {
		
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
