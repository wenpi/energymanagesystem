package com.managementsystem.energy.portlet.alarm;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletPreferences;
import javax.portlet.ReadOnlyException;
import javax.portlet.RenderRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.domain.Buildsettinginfo;
import com.managementsystem.energy.portlet.alarm.model.Prefsinfo;
import com.managementsystem.energy.portlet.alarm.service.AlarmService;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.web.PortletBaseController;

@Controller
@RequestMapping("EDIT")
public class AlarmPreferenceController extends PortletBaseController {

	private final Log logger = LogFactory
			.getLog(AlarmPreferenceController.class);

	@Autowired
	private BuildService buildService;

	@Autowired
	private AlarmService alarmService;

	/**
	 * 设备报警模块配置首选项
	 * */
	@RenderMapping
	public ModelAndView setup(RenderRequest request, PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		Prefsinfo prefsinfo = null;
		if (prefs.getMap().size() == 0) {
			prefsinfo = new Prefsinfo();
		} else {
			prefsinfo = alarmService.getPrefsinfo(prefs);
		}
		mav.addObject(prefsinfo);
		mav.setViewName(PORTLETFOLDER + "alarm/preferences");
		return mav;
	}

	/**
	 * 保存报警模块配置首选项信息
	 * */
	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(
			@ModelAttribute("prefsinfo") Prefsinfo prefsinfo,
			PortletPreferences prefs, ActionRequest request,
			ActionResponse response) throws PortletException,
			ReadOnlyException, IOException {
		try {
			alarmService.savePrefsinfo(prefs, prefsinfo);

			String buildId = prefsinfo.getBuildId();
			String settingWsUrl = request.getParameter("settingWsUrl");
			if (settingWsUrl != null && settingWsUrl.length() > 0) {
				prefs.setValue("settingWsUrl", settingWsUrl);
			} else {
				if (StringUtils.hasLength(buildId)) {
					Buildsettinginfo buildsettinginfo = buildService
							.getBuildsettinginfo(buildId);
					prefs.setValue("settingWsUrl",
							buildsettinginfo.getSettingWsurl());
				}
			}
			prefs.store();
			response.setRenderParameter("", "");
			request.setAttribute("successMessages", "操作成功");
		} catch (IllegalAccessException e) {
			logger.error(e);
			e.printStackTrace();
			request.setAttribute("errorMessages", e.getMessage());
		} catch (InvocationTargetException e) {
			logger.error(e);
			e.printStackTrace();
			request.setAttribute("errorMessages", e.getMessage());
		} catch (NoSuchMethodException e) {
			logger.error(e);
			e.printStackTrace();
			request.setAttribute("errorMessages", e.getMessage());
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
			request.setAttribute("errorMessages", e.getMessage());
		}

	}

}
