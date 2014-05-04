package com.managementsystem.energy.portlet.coreinfo;

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
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.service.QuerySchemeService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.util.dao.Page;

/**
 * 首页关键信息
 * 
 * @author zouzhixiang
 * 
 */
@Controller
@RequestMapping("Edit")
public class CoreInfoPreferenceController extends BaseController {
	private final Log logger = LogFactory
			.getLog(CoreInfoPreferenceController.class);

	@Autowired
	private PreferenceInfoService preferenceInfoService;

	/**
	 * 设置
	 * */
	@RenderMapping
	public ModelAndView setup(RenderRequest request, RenderResponse response,
			PortletPreferences prefs) {

		ModelAndView mav = new ModelAndView();

		PreferenceInfo preferenceinfo = null;
		if (prefs.getMap().size() == 0) {
			preferenceinfo = new PreferenceInfo();
		} else {
			preferenceinfo = preferenceInfoService.getPreferenceInfo(prefs);
		}
		mav.addObject("coreinfo", preferenceinfo);

		mav.setViewName(PORTLETFOLDER + "index/coreInfoPreferences");
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
	@SuppressWarnings("rawtypes")
	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(
			@ModelAttribute("preferenceinfo") PreferenceInfo preferenceinfo,
			PortletPreferences prefs, ActionRequest request,
			ActionResponse response) throws PortletException,
			ReadOnlyException, IOException {

		List<String> errorMessages = new ArrayList<String>();
		try {
			preferenceInfoService.savePreferenceInfo(prefs, preferenceinfo);

		} catch (Exception e) {
			e.printStackTrace();
			errorMessages.add(e.getMessage());
			logger.error(e);
		}
		response.setRenderParameter("", "");
		request.setAttribute("errorMessages", errorMessages);
		request.setAttribute("successMessages", "操作成功");
	}

}
