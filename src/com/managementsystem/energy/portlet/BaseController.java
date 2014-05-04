package com.managementsystem.energy.portlet;

import java.util.HashMap;
import java.util.Map;

import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.service.BuildService;
import com.managementsystem.util.dao.Page;

public abstract class BaseController {
	
	private final Log logger = LogFactory.getLog(BaseController.class);

	/**
	 * 系统存放portlet的文件夹
	 * */
	public static final String PORTLETFOLDER = "portlet/";

	private BuildService buildService;

	@Autowired
	public void setBuildService(BuildService buildService) {
		this.buildService = buildService;
	}

	/**
	 * 获取所有建筑信息
	 * 
	 * @param page 所有页
	 * @param rows 行对象
	 * @param request 资源请求对象
	 * @param response 资源响应对象
	 * 
	 * @return 返回所有建筑信息分页信息
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
