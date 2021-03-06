package com.managementsystem.energy.portlet.hologram;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletPreferences;
import javax.portlet.ReadOnlyException;
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

import com.managementsystem.energy.portlet.othermodules.RunningMonitorChartPreferenceController;
import com.managementsystem.energy.portlet.preferenceinfo.HologramPreferenceInfo;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.web.BaseController;

/**
 * 全息图
 * 
 * @author liuchao
 * 
 */
@Controller
@RequestMapping("Edit")
public class HologramChartPreferenceController extends BaseController {
	private final Log logger = LogFactory
			.getLog(RunningMonitorChartPreferenceController.class);

	@Autowired
	private PreferenceInfoService preferenceInfoService;

	/**
	 * 设置
	 * */
	@RenderMapping
	public ModelAndView setup(RenderRequest request, RenderResponse response,
			PortletPreferences prefs) {

		ModelAndView mav = new ModelAndView();

		HologramPreferenceInfo hologramPreferenceInfo = new HologramPreferenceInfo();
		if (prefs.getMap().size() != 0) {
			try {
				hologramPreferenceInfo = (HologramPreferenceInfo)preferenceInfoService.getPreferenceInfo(prefs,hologramPreferenceInfo);
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		mav.addObject("tbinfo", hologramPreferenceInfo);//将首选项保存进入ModelAndView对象中，其key为tbinfo

		mav.setViewName(PORTLETFOLDER + "hologram/hologramInfoPreferences");//返回一个视图，并保存进入ModelAndView对象中
		return mav;
	}

	/**
	 * 保存
	 * 
	 * @param prefs
	 *            首选项对象
	 * */
	@SuppressWarnings("rawtypes")
	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(
			@ModelAttribute("hologramPreferenceInfo") HologramPreferenceInfo hologramPreferenceInfo,
			PortletPreferences prefs, ActionRequest request,
			ActionResponse response) throws PortletException,
			ReadOnlyException, IOException {

		List<String> errorMessages = new ArrayList<String>();
		try {
			preferenceInfoService.savePreferenceInfo(prefs, hologramPreferenceInfo); //保存首选项信息

		} catch (Exception e) {
			e.printStackTrace();
			errorMessages.add(e.getMessage());
			logger.error(e);
		}
		response.setRenderParameter("", "");
		//返回操作信息
		request.setAttribute("errorMessages", errorMessages);
		request.setAttribute("successMessages", "操作成功");
	}

}