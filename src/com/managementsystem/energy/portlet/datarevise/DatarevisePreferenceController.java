package com.managementsystem.energy.portlet.datarevise;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("Edit")
public class DatarevisePreferenceController extends BaseController {
	private final Log logger = LogFactory
			.getLog(DatarevisePreferenceController.class);

	/**
	 * 设置
	 * */
	@RenderMapping
	public ModelAndView setup(RenderRequest request, RenderResponse response,
			PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(PORTLETFOLDER + "datarevise/datareviseEdit");
		return mav;
	}

	/**
	 * 保存
	 * 
	 * @param buildinfo
	 *            设置对象
	 * @param prefs
	 *            首选项对象
	 * */

	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(PortletPreferences prefs,
			ActionRequest request, ActionResponse response)
			throws PortletException, ReadOnlyException, IOException {

		List<String> errorMessages = new ArrayList<String>();
		try {
			String buildId = "", width = "", height = "";
			if (request.getParameter("buildId") != null) {
				buildId = request.getParameter("buildId");
			}
			prefs.setValue("buildId", buildId);
			if (request.getParameter("width") != null) {
				width = request.getParameter("width");
			}
			prefs.setValue("width", width);

			if (request.getParameter("height") != null) {
				height = request.getParameter("height");
			}
			prefs.setValue("height", height);
			prefs.store();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
		}
		response.setRenderParameter("", "");
		request.setAttribute("errorMessages", errorMessages);
		request.setAttribute("successMessages", "操作成功");
	}

}