package com.managementsystem.energy.portlet.audit;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletPreferences;
import javax.portlet.ReadOnlyException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.theme.PortletDisplay;
import com.liferay.portal.theme.ThemeDisplay;
import com.managementsystem.energy.domain.Auditreport;
import com.managementsystem.energy.portlet.alarm.AlarmPreferenceController;
import com.managementsystem.energy.service.AuditreportService;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.web.PortletBaseController;

@Controller
@RequestMapping("EDIT")
public class AuditreportcontentEditController extends PortletBaseController {
	
	private final Log logger = LogFactory
			.getLog(AlarmPreferenceController.class);

	@Autowired
	private BuildService buildService;

	@Autowired
	private AuditreportService auditreportService;
	
	@RenderMapping
	public ModelAndView setup(RenderRequest request, RenderResponse response,
			PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		ThemeDisplay themeDisplay= (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);  
		PortletDisplay portletDisplay= themeDisplay.getPortletDisplay();  
		String portletId= portletDisplay.getId();
		Auditreport auditreport = new Auditreport();
		auditreport = auditreportService.getAuditreportList(portletId);
		auditreport.setArticleid(portletId);
		mav.addObject("auditreport", auditreport);
		mav.setViewName(PORTLETFOLDER + "auditreport/auditreportContentEdit");
		return mav;
	}
	
	/**
	 * 保存报警模块配置首选项信息
	 * */
	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(
			@ModelAttribute("auditreport") Auditreport auditreport,
			PortletPreferences prefs, ActionRequest request,
			ActionResponse response) throws PortletException,
			ReadOnlyException, IOException {
		try {
			auditreportService.saveOrUpdate(auditreport);
			response.setRenderParameter("", "");
			request.setAttribute("successMessages", "操作成功");
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
			request.setAttribute("errorMessages", e.getMessage());
		}

	}
}
