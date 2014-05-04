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

import com.managementsystem.energy.service.EnergyitemdictService;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.util.dao.Page;

@Controller
@RequestMapping("VIEW")
public class ViewEnergyitemdictController extends BaseController {

	private final Log logger = LogFactory
			.getLog(ViewEnergyitemdictController.class);

	@Autowired
	private EnergyitemdictService energyitemdictService;
	
	@RenderMapping
	public ModelAndView setupEnergyitemdicts() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("energyitem/listEnergyitemdict");
		return mav;
	}
	
	/**
	 * 获取能耗分类分项数据
	 * 
	 * @param page 当前页码
	 * @param rows 每页显示行数
	 * */
	@ResourceMapping(value="getEnergyitemdicts")
	public Page getEnergyitemdicts(ResourceRequest request,
			ResourceResponse response) {
		Integer page = -1;
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		Integer rows = -1;
		if(request.getParameter("rows")!=null) {
			rows = Integer.parseInt(request.getParameter("rows"));
		}

		Page itemPage = energyitemdictService.getPagedEnergyitemdicts(page, rows);
		return itemPage;
	}
	
	@ResourceMapping(value = "searchEnergyitemdict")
	public Page searchEnergyitemdict(
			ResourceRequest request, ResourceResponse response) {
        Map<String,Object> mapCondition = new HashMap<String,Object>();
		
        Integer page = -1;
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		Integer rows = -1;
		if(request.getParameter("rows")!=null) {
			rows = Integer.parseInt(request.getParameter("rows"));
		}

		String energyItemcode ="",energyItemname="";
		int energyItemtype;
		
		if(request.getParameter("energyItemcode")!=null) {
			energyItemcode = request.getParameter("energyItemcode");
			mapCondition.put("energyItemcode", energyItemcode);
		}
		if(request.getParameter("energyItemname")!=null) {
			energyItemname = request.getParameter("energyItemname");	
			mapCondition.put("energyItemname", energyItemname);
		}
		
		if(request.getParameter("energyItemtype")!=null) {
			String sta = request.getParameter("energyItemtype");
			if(!sta.equals("null")&&!sta.equals("")){
				energyItemtype = Integer.parseInt(sta); 
			mapCondition.put("energyItemtype", energyItemtype);
			}
		}
		
		Page energyItemPaged = energyitemdictService.getPagedEnergyitemdict(page, rows, mapCondition);
		return energyItemPaged;
	}
	
	
	

}
