package com.managementsystem.energy.web;

import java.util.HashMap;
import java.util.Map;

import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Circuitinfo;
import com.managementsystem.energy.service.CircuitinfoService;
import com.managementsystem.util.dao.Page;

@Controller
@RequestMapping("VIEW")
public class ViewCircuitController {

	@Autowired
	private CircuitinfoService circuitinfoService;
	
	/**
	 * 设置支路列表
	 * */
	@RenderMapping
	public ModelAndView setupListCircuitinfo() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("searchform",new Circuitinfo());
		mav.setViewName("circuit/listCircuitinfo");
		return mav;
	}
	
	/**
	 * 返回支路信息
	 * */
	@ResourceMapping(value="getCircuitinfos")
	public Page getCircuitinfos(ResourceRequest request,
			ResourceResponse response) {
		
		Integer page = 1;
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		Integer rows = -1;
		if(request.getParameter("rows")!=null) {
			rows = Integer.parseInt(request.getParameter("rows"));
		}
		
		Map<String, Object> mapConditon = new HashMap<String, Object>();
		if(request.getParameter("circuitId")!=null) {
			mapConditon.put("circuitId", request.getParameter("circuitId"));
		}
		if(request.getParameter("circuitName")!=null) {
			mapConditon.put("circuitName", request.getParameter("circuitName"));
		}
		if(request.getParameter("circuitState")!=null) {
			mapConditon.put("circuitState", Integer.parseInt(request.getParameter("circuitState")));
		}
		Page circuitinfos = circuitinfoService.getCircuitinfos(page, rows, mapConditon);
		return circuitinfos;
	}
	
	
}
