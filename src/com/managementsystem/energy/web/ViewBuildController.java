package com.managementsystem.energy.web;

import java.util.HashMap;
import java.util.Map;

import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.BuildgroupService;
import com.managementsystem.energy.service.DatacenterService;
import com.managementsystem.util.dao.Page;

@Controller
@RequestMapping("VIEW")
public class ViewBuildController  extends BaseController {

	private final Log logger = LogFactory.getLog(EditSettingController.class);
	
	@Autowired
	private BuildService buildService;
	
	@Autowired
	private BuildgroupService buildgroupService;
	
	@Autowired
	private DatacenterService datacenterService;
	
	
	/**
	 * 设置模块显示首页
	 * */
	@RenderMapping
	public ModelAndView setupListBuild() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("buildinfo", new Buildinfo());
		mav.setViewName("build/listBuild");
		return mav;
	} 
	
	/**
	 * 获取数据中心数据
	 * @param page 当前页
	 * @param rows 每页显示条数
	 * 
	 * @return 数据中心数据
	 * */
	@ResourceMapping(value="getBuildinfos")
	public Page getBuildinfos(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Page dcPaged = buildService.getBuildinfos(page, rows);
		return dcPaged;
	}
	
	@ResourceMapping(value = "searchBuildinfo")
	public Page searchBuildinfoGriddata(
			@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows,
			ResourceRequest resourceRequest, ResourceResponse resourceResponse) {
        Map<String,Object> mapCondition = new HashMap<String,Object>();
		
		String buildId ="",buildName="",buildAliasname="",buildOwner="",datacenterId="";
		int buildState;
		if(resourceRequest.getParameter("datacenterId")!=null) {
			datacenterId = resourceRequest.getParameter("datacenterId");
			mapCondition.put("datacenterinfo.datacenterId", datacenterId);
		}
		if(resourceRequest.getParameter("buildId")!=null) {
			buildId = resourceRequest.getParameter("buildId");
			mapCondition.put("buildId", buildId);
		}
		if(resourceRequest.getParameter("buildName")!=null) {
			buildName = resourceRequest.getParameter("buildName");	
			mapCondition.put("buildName", buildName);
		}
		if(resourceRequest.getParameter("buildAliasname")!=null) {
			buildAliasname = resourceRequest.getParameter("buildAliasname");
			mapCondition.put("buildAliasname", buildAliasname);
		}
		if(resourceRequest.getParameter("buildOwner")!=null) {
			buildOwner = resourceRequest.getParameter("buildOwner");
			mapCondition.put("buildOwner", buildOwner);
		}
		if(resourceRequest.getParameter("buildState")!=null) {
			String sta = resourceRequest.getParameter("buildState");
			if(!sta.equals("null")&&!sta.equals("")){
				buildState = Integer.parseInt(sta); 
			mapCondition.put("buildState", buildState);
			}
		}
		
		Page buildinfoPaged = buildService.getBuildinfos(page, rows, mapCondition);
		return buildinfoPaged;
	}
	
	/**
	 * 设置建筑群
	 * */
	@RenderMapping(params="action=listBuildgroup")
	public ModelAndView setupListBuildgroup() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("build/listBuildgroupTab");
		return mav;
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
	
	@ResourceMapping(value = "getDatacenters")
	public Page getDatacenters(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Page dcPaged = datacenterService.getPagedDatacenters(page, rows);
		return dcPaged;
	}
}
