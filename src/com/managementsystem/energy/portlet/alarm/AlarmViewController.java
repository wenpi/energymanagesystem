package com.managementsystem.energy.portlet.alarm;

import java.util.List;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.portlet.alarm.model.Prefsinfo;
import com.managementsystem.energy.portlet.alarm.model.TagInfo;
import com.managementsystem.energy.portlet.alarm.service.AlarmService;
import com.managementsystem.energy.web.PortletBaseController;
import com.managementsystem.ui.easyui.JsonResult;

@Controller
@RequestMapping("VIEW")
public class AlarmViewController extends PortletBaseController {

	@Autowired
	private AlarmService alarmService;

	@RenderMapping
	public ModelAndView setup(PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		Prefsinfo prefsinfo = alarmService.getPrefsinfo(prefs);
		mav.addObject("prefsinfo", prefsinfo);
		mav.setView(PORTLETFOLDER + "alarm/alarmView");
		return mav;
	}

	/**
	 * 获取报警列表
	 * */
	@ResourceMapping(value = "getAlarmList")
	public JsonResult getAlarmList(PortletPreferences prefs,
			ResourceRequest request) {
		String from = "", to = "";
		if (request.getParameter("from") != null) {
			from = request.getParameter("from");
			from = from.replace(" ", "T");
		}
		if (request.getParameter("to") != null) {
			to = request.getParameter("to");
			to = to.replace(" ", "T");
		}
		Prefsinfo prefsinfo = alarmService.getPrefsinfo(prefs);
		List<TagInfo> alarmlist = alarmService
				.getAlarmList(prefsinfo, from, to);
		JsonResult result = new JsonResult();
		result.setData(alarmlist);
		return result;
	}

}
