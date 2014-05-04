package com.managementsystem.energy.portlet.energymark;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.util.dao.Page;

@Controller
@RequestMapping("Edit")
public class EnergymarkPreferenceController extends BaseController {
	private final Log logger = LogFactory.getLog(EnergymarkPreferenceController.class);
	@Autowired
	private BuildService buildService;
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
			if(StringUtils.hasLength(buildId)){
			buildinfo = buildService.getBuildinfo(buildId);
			}
		}
		mav.addObject("buildinfo", buildinfo);
		mav.setViewName(PORTLETFOLDER + "energymark/preferences");
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
			String buildId = "", rjhn="", jzpjhn="",   rjhd="", zhd="",zjnl="", ztpfjsl="", xj="", starttime="", jstime="";
			if(request.getParameter("buildId")!=null) {
				buildId = request.getParameter("buildId");
			}
			prefs.setValue("buildId",buildId);
			
			if(request.getParameter("rjhn")!=null) {
				rjhn = request.getParameter("rjhn");
			}
			prefs.setValue("rjhn",rjhn);
			
			if(request.getParameter("jzpjhn")!=null) {
				jzpjhn = request.getParameter("jzpjhn");
			}
			prefs.setValue("jzpjhn",jzpjhn);
			
			if(request.getParameter("rjhd")!=null) {
				rjhd = request.getParameter("rjhd");
			}
			prefs.setValue("rjhd",rjhd);
			
			if(request.getParameter("zhd")!=null) {
				zhd = request.getParameter("zhd");
			}
			prefs.setValue("zhd",zhd);
			
			if(request.getParameter("zjnl")!=null) {
				zjnl = request.getParameter("zjnl");
			}
			prefs.setValue("zjnl",zjnl);
			
			if(request.getParameter("ztpfjsl")!=null) {
				ztpfjsl = request.getParameter("ztpfjsl");
			}
			prefs.setValue("ztpfjsl",ztpfjsl);
			
			if(request.getParameter("xj")!=null) {
				xj = request.getParameter("xj");
			}
			prefs.setValue("xj",xj);
			
			if(request.getParameter("starttime")!=null) {
				starttime = request.getParameter("starttime");
			}
			prefs.setValue("starttime",starttime);
			
			if(request.getParameter("jstime")!=null) {
				jstime = request.getParameter("jstime");
			}
			prefs.setValue("jstime",jstime);
			
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
}
