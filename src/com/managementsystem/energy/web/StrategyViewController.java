package com.managementsystem.energy.web;

import java.util.HashMap;
import java.util.Map;

import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Strategy;
import com.managementsystem.energy.service.StrategyService;
import com.managementsystem.util.dao.Page;

@Controller
@RequestMapping("VIEW")
public class StrategyViewController extends BaseController {
	@Autowired
	private StrategyService strategyService;
	
	@RenderMapping
	public ModelAndView setup() {

		ModelAndView mav = new ModelAndView();
		mav.addObject("searchform",new  Strategy());
		mav.setViewName("strategy/strategyView");
		return mav;
	}
	
	/**
	 * 返回策略列表信息
	 * */
	@ResourceMapping(value="getStrategies")
	public Page getStrategies(ResourceRequest request,
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
		String buildId = "";
		if(request.getParameter("buildinfo.buildId")!=null  && !"".equals(request.getParameter("buildinfo.buildId"))) {
			buildId = request.getParameter("buildinfo.buildId");
		}
		if(request.getParameter("strategyname")!=null && !"".equals(request.getParameter("strategyname"))) {
			mapConditon.put("strategyname", request.getParameter("strategyname"));
		}
		if(request.getParameter("author")!=null  && !"".equals(request.getParameter("author"))) {
			mapConditon.put("author", request.getParameter("author"));
		}
		if(request.getParameter("status")!=null && !"".equals(request.getParameter("status"))) {
			mapConditon.put("status", Integer.parseInt(request.getParameter("status")));
		}
		Page pagedStrategies = strategyService.getStrategies(buildId, page, rows, mapConditon);
		return pagedStrategies;
	}
	
}
