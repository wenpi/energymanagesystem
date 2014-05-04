package com.managementsystem.energy.portlet.regionalEnergy;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

import com.managementsystem.energy.domain.Auditreport;
import com.managementsystem.energy.domain.Buildaddfile;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Buildregioninfo;
import com.managementsystem.energy.domain.Buildsettinginfo;
import com.managementsystem.energy.domain.Meteruseattribute;
import com.managementsystem.energy.portlet.chart.model.Chartsetting;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.BuildregioninfoService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.util.dao.Page;

@Controller
@RequestMapping("Edit")
public class RegionalEnergyPreferenceController extends BaseController {
	private final Log logger = LogFactory
			.getLog(RegionalEnergyPreferenceController.class);
	@Autowired
	private BuildService buildService;

	@Autowired
	private BuildregioninfoService buildregioninfoService;

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
		String buildWidth = prefs.getValue("buildWidth", "");
		String buildHeight = prefs.getValue("buildHeight", "");
		mav.addObject("buildWidth", buildWidth);
		mav.addObject("buildHeight", buildHeight);
		mav.addObject("buildinfo", buildinfo);
		mav.addObject("bz", "");
		mav.setViewName(PORTLETFOLDER + "regionalEnergy/preferences");
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
	public void savePreferences(PortletPreferences prefs,
			ActionRequest request, ActionResponse response)
			throws PortletException, ReadOnlyException, IOException {

		List<String> errorMessages = new ArrayList<String>();
		try {
			String buildId = "", regionId = "", width = "", height = "", widthcg = "", heightcg = "", buildWidth = "", buildHeight = "";
			if (request.getParameter("buildId") != null) {
				buildId = request.getParameter("buildId");
				prefs.setValue("buildId", buildId);
			}

			if (request.getParameter("regionId") != null) {
				regionId = request.getParameter("regionId");
				prefs.setValue("regionId", regionId);
			}

			for (int park = 1; park <= 6; park++) {
				String strPark = "seriech" + String.valueOf(park);
				if (request.getParameter(strPark) != null) {
					String serieId11 = strPark + regionId;
					String a1 = request.getParameter(strPark);
					prefs.setValue(serieId11, a1);
				}
			}

			for (int park = 1; park <= 6; park++) {
				String strPark = "seriecg" + String.valueOf(park);
				if (request.getParameter(strPark) != null) {
					String serieId11 = strPark + regionId;
					String a1 = request.getParameter(strPark);
					prefs.setValue(serieId11, a1);
				}
			}
			
			if (request.getParameter("width") != null) {
				width = request.getParameter("width");
				prefs.setValue("width", width);
			}
			
			if (request.getParameter("height") != null) {
				height = request.getParameter("height");
				prefs.setValue("height", height);
			}
			
			if (request.getParameter("widthcg") != null) {
				widthcg = request.getParameter("widthcg");
				prefs.setValue("widthcg", widthcg);
			}
			
			if (request.getParameter("heightcg") != null) {
				heightcg = request.getParameter("heightcg");
				prefs.setValue("heightcg", heightcg);
			}
			
			if (request.getParameter("buildWidth") != null) {
				buildWidth = request.getParameter("buildWidth");
				prefs.setValue("buildWidth", buildWidth);
			}
			
			if (request.getParameter("buildHeight") != null) {
				buildHeight = request.getParameter("buildHeight");
				prefs.setValue("buildHeight", buildHeight);
			}
			
			prefs.store();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
		}
		response.setRenderParameter("", "");
		request.setAttribute("errorMessages", errorMessages);
		request.setAttribute("successMessages", "操作成功");
	}

	@RenderMapping(params = "action=editForm")
	public ModelAndView setEditForm(PortletPreferences prefs,
			@RequestParam("regionId") String regionId) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bz", "1");
		mav.addObject("regionId", regionId);
		for (int park = 1; park <= 6; park++) {
			String strPark = "seriech" + String.valueOf(park) + regionId;
			String serie1 = prefs.getValue(strPark, "");
			mav.addObject("seriech" + String.valueOf(park), serie1);
		}
		String width = prefs.getValue("width", "");
		String height = prefs.getValue("height", "");
		mav.addObject("width", width);
		mav.addObject("height", height);
		mav.setViewName(PORTLETFOLDER + "regionalEnergy/preferences");
		return mav;
	}

	@RenderMapping(params = "action=editGrandsonForm")
	public ModelAndView editGrandsonForm(PortletPreferences prefs,
			@RequestParam("regionId") String regionId) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bz", "2");
		mav.addObject("regionId", regionId);
		for (int park = 1; park <= 6; park++) {
			String strPark = "seriecg" + String.valueOf(park) + regionId;
			String serie1 = prefs.getValue(strPark, "");
			mav.addObject("seriecg" + String.valueOf(park), serie1);
		}
		String widthcg = prefs.getValue("widthcg", "");
		String heightcg = prefs.getValue("heightcg", "");
		mav.addObject("widthcg", widthcg);
		mav.addObject("heightcg", heightcg);
		mav.setViewName(PORTLETFOLDER + "regionalEnergy/preferences");
		return mav;
	}
}
