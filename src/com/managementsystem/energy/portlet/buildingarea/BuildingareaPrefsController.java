package com.managementsystem.energy.portlet.buildingarea;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletPreferences;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.web.PortletBaseController;

@Controller
@RequestMapping("EDIT")
public class BuildingareaPrefsController extends PortletBaseController {
	
	private final Log logger = LogFactory
			.getLog(BuildingareaPrefsController.class);

	/**
	 * 设置建筑区域首选项
	 * */
	@RenderMapping
	public ModelAndView setup() {
		ModelAndView mav = new ModelAndView();
		mav.setView(PORTLETFOLDER + "buildingarea/buildingareaPrefs");
		return mav;
	}

	/**
	 * 保存建筑区域首选项信息
	 * */
	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(PortletPreferences prefs,
			ActionRequest request, ActionResponse response) {
		try {
			String buildId = "";
			if (request.getParameter("buildId") != null) {
				buildId = request.getParameter("buildId");
			}
			if (StringUtils.hasLength(buildId)) {
				prefs.setValue("buildId", buildId);
				prefs.store();
				response.setRenderParameter("", "");
				request.setAttribute("message", "操作成功");
			}
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
			request.setAttribute("message", "操作失败");
		}
	}

}
