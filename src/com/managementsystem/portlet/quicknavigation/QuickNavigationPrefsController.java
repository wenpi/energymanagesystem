package com.managementsystem.portlet.quicknavigation;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
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

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;


import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("EDIT")
public class QuickNavigationPrefsController extends BaseController {

	
	private final Log logger = LogFactory.getLog(QuickNavigationPrefsController.class);
	
	private static final String VIEW_NAME = "quicknavigation/prefsNavigation";

	@Autowired
	private QuickNavigationService quickNavigationService;

	/**
	 * 显示快捷导航设置
	 * */
	@RenderMapping
	public ModelAndView showPrefrences(RenderRequest request,
			RenderResponse response, PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();

		NavigationForm navigationForm = null;

		if (prefs.getMap().size() == 0) {
			navigationForm = new NavigationForm();
		} else {
			navigationForm = quickNavigationService.getNavigationForm(prefs);
		}

		mav.addObject("navigationForm", navigationForm);
		mav.setViewName(PORTLETFOLDER + VIEW_NAME);
		return mav;
	}

	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(
			@ModelAttribute("navigationForm") NavigationForm navigationForm,
			PortletPreferences prefs, ActionRequest request,
			ActionResponse response) throws PortletException,
			ReadOnlyException, IOException {
		
		List<String> errorMessages = new ArrayList<String>();
		Map mapField;
		try {
			mapField = BeanUtils.describe(navigationForm);
			Object[] keyValuePairs = mapField.entrySet().toArray();
			for (int i = 0; i < keyValuePairs.length; i++) {
				Map.Entry entry = (Map.Entry) keyValuePairs[i];
				String key = entry.getKey().toString();
				String val = entry.getValue() == null ? "" : entry.getValue()
						.toString();
				prefs.setValue(key, val);
			}

			prefs.store();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			logger.error(e);
		} catch (InvocationTargetException e) {
			e.printStackTrace();
			logger.error(e);
		} catch (NoSuchMethodException e1) {
			e1.printStackTrace();
			logger.error(e1);
		} catch (Exception e) {
			errorMessages.add("Unexpected exception ocurred : Cause : "
					+ e.getCause() + ". Message : " + e.getMessage());
			request.setAttribute("errorMessages", errorMessages);
			logger.error(e);
		}
		response.setRenderParameter("", "");
		request.setAttribute("errorMessages", errorMessages);
		request.setAttribute("successMessages", "操作成功");
		
		
		
	}
}
