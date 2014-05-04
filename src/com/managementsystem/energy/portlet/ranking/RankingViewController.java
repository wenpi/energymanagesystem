package com.managementsystem.energy.portlet.ranking;

import java.util.ArrayList;
import java.util.List;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.web.PortletBaseController;
import com.managementsystem.ui.easyui.Datagrid;
import com.managementsystem.ui.easyui.JsonResult;

/**
 * 能耗排名模块
 * */
@Controller
@RequestMapping("VIEW")
public class RankingViewController extends PortletBaseController {
	
	@Autowired
	private BuildService buildService;
	
	
	@RenderMapping
	public ModelAndView setup(PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		mav.setView(PORTLETFOLDER + "ranking/rankingView");
		return mav;
	}
	
	/**
	 * 获取指定类型的能耗排名建筑
	 * @param buildfunc 建筑类型
	 * @return 指定类型的能耗排名建筑
	 * */
	@ResourceMapping(value="getRankingByBuildfunc")
	public JsonResult findRankingByBuildfunc(@RequestParam("buildfunc") Integer buildfunc,ResourceRequest request) {
		JsonResult result = new JsonResult();
		if(buildfunc==null){
			buildfunc = 0;
		}
		int topnum = 8;
		if(request.getParameter("topnum")!=null) {
			String strNum = request.getParameter("topnum");
			if(org.apache.commons.lang.StringUtils.isNumeric(strNum)) {
				topnum = Integer.parseInt(strNum);
			}
		}
		List<Buildinfo> buildinfos = new ArrayList<Buildinfo>(buildService.findBuildinfosByBuildfunc(buildfunc, topnum));
		result.setData(buildinfos);
		return result;
	}
	
}
