package com.managementsystem.energy.portlet.energypublicity;

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
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.BuildgroupService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.util.dao.Page;

@Controller
@RequestMapping("Edit")
public class EnergypublicityPreferenceController extends BaseController {
	private final Log logger = LogFactory.getLog(EnergypublicityPreferenceController.class);
	@Autowired
	private BuildService buildService;
	@Autowired
	private BuildgroupService buildgroupService;
	
	/**
	 * 设置
	 * */
	@RenderMapping
	public ModelAndView setup(RenderRequest request, RenderResponse response,
			PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(PORTLETFOLDER + "energypublicity/preferences");
		return mav;
	}
	
	/**
	 * 保存
	 * 
	 * @param buildinfo 设置对象
	 * @param prefs	 首选项对象
	 * */
	@SuppressWarnings("rawtypes")
	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(PortletPreferences prefs, ActionRequest request,
			ActionResponse response) throws PortletException,
			ReadOnlyException, IOException {
		
		List<String> errorMessages = new ArrayList<String>();
		Map mapField;
		try {
			String buildId = "",showDesc="true", buildgroupId="";
			
			showDesc = request.getParameter("showDesc");
			if(showDesc.equals("true")){
			buildId = request.getParameter("buildId");
			prefs.setValue("buildId",buildId);
			}
			else{
			buildgroupId = request.getParameter("buildgroupId");
			prefs.setValue("buildgroupId",buildgroupId);	
			}
			prefs.setValue("showDesc",showDesc);
			prefs.store();
		} catch(Exception e) {
			e.printStackTrace();
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
	
	/**
	 * 获取建筑群信息
	 * */
	@ResourceMapping(value = "getBuildgroupinfos")
	public Page getBuildgroupinfos(ResourceRequest request,
			ResourceResponse response) {
	
		Integer page = 1;
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		Integer rows = 10;
		if(request.getParameter("rows")!=null) {
			rows = Integer.parseInt(request.getParameter("rows"));
		}
		Map<String, Object> mapConditon = new HashMap<String, Object>();
		if(request.getParameter("buildgroupName")!=null) {
			mapConditon.put("buildgroupName", request.getParameter("buildgroupName"));
		}
		return buildgroupService.getBuildgroups(page, rows, mapConditon);
	}
}
