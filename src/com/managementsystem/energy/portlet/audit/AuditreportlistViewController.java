package com.managementsystem.energy.portlet.audit;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Auditreport;
import com.managementsystem.energy.service.AuditreportService;
import com.managementsystem.energy.web.PortletBaseController;
import com.managementsystem.util.dao.Page;

@Controller
@RequestMapping("VIEW")
public class AuditreportlistViewController extends PortletBaseController {
	@Autowired
	private AuditreportService auditreportService;

	@RenderMapping
	public ModelAndView viewRepair() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("portlet/auditreport/auditreportList");
		return mav;
	}
	
	@ResourceMapping(value = "auditreportList")
	public Page getRepairGridData(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows,
			ResourceRequest resourceRequest, ResourceResponse resourceResponse) {
		 Map<String,Object> mapCondition = new HashMap<String,Object>();
		 Page repairPaged = auditreportService.auditreportList(page, rows, mapCondition);
		 return repairPaged;
		}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, false));
	}
}
