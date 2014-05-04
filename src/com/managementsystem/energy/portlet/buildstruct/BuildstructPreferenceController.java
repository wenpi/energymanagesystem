package com.managementsystem.energy.portlet.buildstruct;

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
public class BuildstructPreferenceController extends BaseController {
	private final Log logger = LogFactory.getLog(BuildstructPreferenceController.class);
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
			if(StringUtils.hasLength(buildId)){
			buildinfo = buildService.getBuildinfo(buildId);
			}
		}
		mav.addObject("buildinfo", buildinfo);
		mav.addObject("bz", "");
		mav.setViewName(PORTLETFOLDER + "buildstruct/preferences");
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
		try {
			String buildId = "",regionId = "";
			if(request.getParameter("buildId")!=null) {
				buildId = request.getParameter("buildId");
				prefs.setValue("buildId",buildId);
			}
			
			if(request.getParameter("regionId")!=null) {
				regionId = request.getParameter("regionId");
				prefs.setValue("regionId",regionId);
			}
			
			for(int par=1;par<=8;par++){
				String str = "serie"+String.valueOf(par);
				if(request.getParameter(str)!=null) {
					String serieId = str+ regionId;
					String val =  request.getParameter(str);
					prefs.setValue(serieId,val);
				}
				for(int park=1;park<=4;park++){
					 String strPark = str+String.valueOf(park);
					 if(request.getParameter(strPark)!=null) {
							String serieId11 = strPark+ regionId;
							String a1 =  request.getParameter(strPark);
							prefs.setValue(serieId11,a1);
						}
				 }
			}
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
	
	@ResourceMapping(value = "getbuildregionByID")
	public JsonResult getbuildregionByID(
			@RequestParam("Id") String Id) {
		JsonResult result = new JsonResult();
		List<Buildregioninfo> list =  new ArrayList<Buildregioninfo>();
		Set<Buildregioninfo> buildregionParentList = buildregioninfoService.getParentBuildregioninfos(Id);
		for(Iterator<Buildregioninfo> it = buildregionParentList.iterator();it.hasNext();) {
			Buildregioninfo buildregioninfo = it.next();
			list.add(buildregioninfo);
		}
	    result.setData(list);
		return result;
	}
	
	@RenderMapping(params = "action=editForm")
	public ModelAndView setEditForm(PortletPreferences prefs,
			@RequestParam("regionId") String regionId) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bz", "1");
		mav.addObject("regionId", regionId);
		for(int par=1;par<=8;par++){
			String str = "serie"+String.valueOf(par)+regionId;
			String serie = prefs.getValue(str, "");
			mav.addObject("serie"+String.valueOf(par), serie);
			for(int park=1;park<=4;park++){
				 String strPark = "serie"+String.valueOf(par)+String.valueOf(park)+regionId;
				 String serie1 = prefs.getValue(strPark, "");
					mav.addObject("serie"+String.valueOf(par)+String.valueOf(park), serie1);
			 }
		}
		mav.setViewName(PORTLETFOLDER + "buildstruct/preferences");
		return mav;
	}
}
