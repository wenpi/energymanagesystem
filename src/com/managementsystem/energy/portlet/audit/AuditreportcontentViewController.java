package com.managementsystem.energy.portlet.audit;

import javax.portlet.PortletPreferences;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.theme.PortletDisplay;
import com.liferay.portal.theme.ThemeDisplay;
import com.managementsystem.energy.domain.Auditreport;
import com.managementsystem.energy.service.AuditreportService;
import com.managementsystem.energy.web.PortletBaseController;


/**
 * 审计报告内容
 * */
@Controller
@RequestMapping("VIEW")
public class AuditreportcontentViewController extends PortletBaseController {
	
	@Autowired
	private AuditreportService auditreportService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model,RenderRequest request, RenderResponse response) {
		Auditreport auditreport = new Auditreport();
		ThemeDisplay themeDisplay= (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);  
		PortletDisplay portletDisplay= themeDisplay.getPortletDisplay();  
		String portletId= portletDisplay.getId();
		auditreport = auditreportService.getAuditreportList(portletId);
		model.addAttribute("auditreport", auditreport);
		return PORTLETFOLDER + "auditreport/auditreportContentView";
	}
}
