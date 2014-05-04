package com.managementsystem.energy.web;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Dictitem;
import com.managementsystem.energy.service.MeterproService;
import com.managementsystem.util.dao.Page;

@Controller
@RequestMapping("VIEW")
public class ViewMeterController extends BaseController  {
	private final Log logger = LogFactory.getLog(ViewMeterController.class);
	
	@Autowired
	public MeterproService meterproService;
	
	@ModelAttribute("meterTypes")
	public Set<Dictitem> getMeterTypes() {
		return dictionaryService.getDictitemBygroupCode("meter_type");
	}
	
	@RenderMapping
	public ModelAndView setupMeterpro() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("meter/listMeterproinfo");
		return mav;
	}
	
	/**
	 *  获取仪表产品信息
	 *  @param page 当前页码
	 *  @param rows 每页显示条数
	 * */
	@ResourceMapping(value="getMeterproinfos")
	public Page getgetMeterproinfos(ResourceRequest request,
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
		if(request.getParameter("meterProductid")!=null) {
			mapConditon.put("meterProductid", request.getParameter("meterProductid"));
		}
		if(request.getParameter("meterProductname")!=null) {
			mapConditon.put("meterProductname", request.getParameter("meterProductname"));
		}
		if(request.getParameter("meterType")!=null) {
			if(StringUtils.hasLength(request.getParameter("meterType")) && request.getParameter("meterType")!="null")
				mapConditon.put("meterType", Integer.parseInt(request.getParameter("meterType")));
		}
	
		Page dcPaged = meterproService.getMeterproinfos(page, rows,mapConditon);
		return dcPaged;
	}
	
}
