package com.managementsystem.energy.portlet.readmeter;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletMode;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.liferay.portal.model.User;
import com.liferay.portal.theme.ThemeDisplay;
import com.managementsystem.energy.domain.Energydict;
import com.managementsystem.energy.domain.Readmeter;
import com.managementsystem.energy.service.EnergydictService;
import com.managementsystem.energy.service.ReadmeterService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.ui.easyui.Resultmsg;

@Controller
@RequestMapping("Edit")
public class ReadmeterEditController extends BaseController {
	private final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private ReadmeterService readmeterService;
	
	@Autowired
	private EnergydictService energydictService;
	
	private final static String VIEW_NAME = PORTLETFOLDER+"readmeter/editReadmeter";
	
	
	/**
	 * 设置新增
	 * 
	 * 
	 * */
	@RenderMapping(params="action=addReadmeterForm")
	public ModelAndView setupAddLeaseForm() {
		ModelAndView mav = new ModelAndView();
		Readmeter readmeter = new Readmeter();
		mav.addObject("readmeter", readmeter);
		mav.addObject("isnew", true);
		mav.setViewName(VIEW_NAME);
		return mav;
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, false));
	}
	
	/**
	 * 设置
	 * */
	@RenderMapping(params="action=editReadmeterForm")
	public ModelAndView setupEditReadmeterForm(@RequestParam("readingid") String readingid) {
		ModelAndView mav = new ModelAndView();
		try {		
			Readmeter readmeter = new  Readmeter();
			readmeter = readmeterService.getReadmeter(readingid);
			mav.addObject("readmeter", readmeter);
			mav.addObject("isnew", false);
			mav.setViewName(VIEW_NAME);
		} catch (Exception e) {
			logger.error(e);
		}
		return mav;
	}
	
	/**
	 * 提交
	 * 
	 * */
	@ResourceMapping(value = "submitReadmeterForm")
	public Resultmsg processSubmitLeaseForm(@ModelAttribute("readmeter")Readmeter readmeter,
			BindingResult result,ResourceRequest resourceRequest, ResourceResponse resourceResponse,
			SessionStatus status) {
		        Resultmsg msg = new Resultmsg();
				ThemeDisplay themeDisplay = (ThemeDisplay) resourceRequest
				.getAttribute("THEME_DISPLAY");
				User user = null;
				user = themeDisplay.getUser();
				Long organizationid = user.getCompanyId();
				readmeter.setOrganizationid(organizationid);
				boolean isnew = true;
				if (resourceRequest.getParameter("isnew") == null) {
					msg.setMsg("页面缺少新增或编辑标记 isnew");
					return msg;
				} else {
					isnew = Boolean.valueOf(resourceRequest.getParameter("isnew"));
				}
				
				if (result.hasErrors()) {
					msg.setMsg(result.toString());
					logger.error(result);
				}else {
					try {
						if (isnew) {
							readmeterService.addReadmeter(readmeter);
						} else {
							readmeterService.updateReadmeter(readmeter);
						}
						status.setComplete();
						msg.setMsg(readmeter.getReadingid());
						msg.setSuccess("true");
					} catch (Exception e) {
						logger.error(e);
						msg.setMsg(e.getMessage());
					}
				}
				return msg;
	}
	
	@ActionMapping(params="action=removeReadmeters")
	public void processRemoveSells(ActionRequest actionRequest,ActionResponse actionResponse) {
		String readingids = "";
		try {
			if (actionRequest.getParameter("readingids") != null)
				readingids = actionRequest.getParameter("readingids");
			if (readingids.indexOf(",") > 0) {
				for (String readingid : readingids.split(",")) {
					readmeterService.deleteReadmeter(readingid);
				}
			} else {
				readmeterService.deleteReadmeter(readingids);
			}
			actionResponse.setPortletMode(PortletMode.VIEW);
		} catch (Exception e) {
			logger.error(e);
		}
	}
	
	
	@ResourceMapping(value = "getEnergydicts")
	public JsonResult getEnergydicts() {
		JsonResult result = new JsonResult();
		Set<Energydict> energydicts = energydictService.getEnergydicts();
		result.setData(new ArrayList<Energydict>(energydicts));
		return result;
	}
	
	@ResourceMapping(value = "getMeterIds")
	public JsonResult getMeteruseattribute(ResourceRequest request) {
		JsonResult result = new JsonResult();
		List<String> meterNos = new ArrayList<String>();
		String buildId = "";
		if(request.getParameter("buildId")!=null) {
			buildId = request.getParameter("buildId");
			meterNos = readmeterService.findMeterNos(buildId);
		}
		result.setData(meterNos);
		return result;
	}
  }
