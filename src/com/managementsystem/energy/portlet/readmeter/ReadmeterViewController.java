package com.managementsystem.energy.portlet.readmeter;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Energydict;
import com.managementsystem.energy.portlet.chart.service.ChartService;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.EnergydictService;
import com.managementsystem.energy.service.ReadmeterService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.util.dao.Page;

@Controller
@RequestMapping("VIEW")
public class ReadmeterViewController extends BaseController {
	
	@Autowired
	private BuildService buildService;
	@Autowired
	private ReadmeterService readmeterService;
	@Autowired
	private ChartService chartService;
	@Autowired
	private EnergydictService energydictService;
	

	@RenderMapping
	public String setup(PortletPreferences prefs,Model model) {
//		if (prefs.getMap().size() == 0) {
//		   } 
//		else {
//		   String addfilePath ="/energymanagesystem/images/icons/xj.png";
//		   String xj = prefs.getValue("xj", "");
//		   model.addAttribute("xj", xj);
//		   model.addAttribute("addfilePath", addfilePath);
//		   }
		return PORTLETFOLDER + "readmeter/listReadmeter";
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
	
	@ResourceMapping(value = "getReadmeters")
	public Page getReadmetersGriddata(
			@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows,
			ResourceRequest resourceRequest, ResourceResponse resourceResponse) {
		String buildId ="", readingPerson="",readingDate="",energydictId="";
		//Date readingParamDate = null;
		if(resourceRequest.getParameter("buildId")!=null&&(!resourceRequest.getParameter("buildId").equals(""))) {
			buildId = resourceRequest.getParameter("buildId");
		}
		if(resourceRequest.getParameter("readingDate")!=null&&(!resourceRequest.getParameter("readingDate").equals(""))) {
			readingDate = resourceRequest.getParameter("readingDate");
		//	readingParamDate =  strinfToDate(readingDate);
		}
		if(resourceRequest.getParameter("readingPerson")!=null&&(!resourceRequest.getParameter("readingPerson").equals(""))) {
			readingPerson = resourceRequest.getParameter("readingPerson");
		}
		if(resourceRequest.getParameter("energydictId")!=null&&(!resourceRequest.getParameter("energydictId").equals(""))) {
			energydictId = resourceRequest.getParameter("energydictId");
		}
		Page readmeterPaged = readmeterService.getPagedReadmeters(page, rows,buildId,readingDate,readingPerson,energydictId);
		return readmeterPaged;
	}
	
	@ResourceMapping(value = "getEnergydicts")
	public JsonResult getEnergydicts() {
		JsonResult result = new JsonResult();
		Set<Energydict> energydicts = energydictService.getEnergydicts();
		result.setData(new ArrayList<Energydict>(energydicts));
		return result;
	}
	
	public Date strinfToDate(String src) {
		DateFormat df = null;
		if (src.indexOf(":") > 0) {
			df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		} else {
			df = new SimpleDateFormat("yyyy-MM-dd");
		}
		Date ret;
		try {
			ret = df.parse(src);
		} catch (ParseException e) {
			e.printStackTrace();
			ret = new Date();
		}
		return ret;
	}
	
	@ResourceMapping(value = "getBuildinfoByBuildId")
	public JsonResult getBuildinfoByBuildId(
			@RequestParam("buildId") String buildId) {
		JsonResult result = new JsonResult();
		Buildinfo buildinfo = buildService.getBuildinfo(buildId);
		List list = new ArrayList();
		list.add(buildinfo.getBuildName());	
		result.setData(list);
		return result;
	}
}