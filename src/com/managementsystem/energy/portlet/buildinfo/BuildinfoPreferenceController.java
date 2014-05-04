package com.managementsystem.energy.portlet.buildinfo;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
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

import org.apache.commons.beanutils.BeanUtils;
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
import com.managementsystem.energy.domain.Buildsettinginfo;
import com.managementsystem.energy.portlet.chart.ChartPreferenceController;
import com.managementsystem.energy.portlet.chart.model.Chartsetting;
import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.portlet.holographic.vo.MirrowData;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.util.dao.Page;

@Controller
@RequestMapping("Edit")
public class BuildinfoPreferenceController extends BaseController {
	private final Log logger = LogFactory
			.getLog(BuildinfoPreferenceController.class);
	@Autowired
	private BuildService buildService;

	@Autowired
	private PreferenceInfoService preferenceInfoService;

	/**
	 * 设置
	 * */
	@RenderMapping
	public ModelAndView setup(RenderRequest request, RenderResponse response,
			PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();

		Buildinfo buildinfo = null;
		if (prefs.getMap().size() == 0) {
			buildinfo = new Buildinfo();
		} else {
			String buildId = prefs.getValue("buildId", "");
			if (StringUtils.hasLength(buildId)) {
				buildinfo = buildService.getBuildinfo(buildId);
			}
		}
		mav.addObject("buildinfo", buildinfo);
		mav.setViewName(PORTLETFOLDER + "buildinfo/preferences");
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

	/**
	 * 返回所有建筑信息
	 * */
	@ResourceMapping(value = "getBuildinfos")
	public Page getBuildinfos(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Map<String, Object> mapCondition = new HashMap<String, Object>();

		if (request.getParameter("keyword") != null) {
			String keyword = request.getParameter("keyword");
			mapCondition.put("buildName", keyword);
		}
		Page buildinfos = buildService.getBuildinfos(page, rows);
		return buildinfos;
	}
}
