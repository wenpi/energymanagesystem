package com.managementsystem.energy.portlet.audit;

import java.util.ArrayList;
import java.util.List;

import javax.portlet.PortletPreferences;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Auditreport;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.service.AuditreportService;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.web.PortletBaseController;
import com.managementsystem.ui.easyui.Resultmsg;

/**
 * 平台审计报表
 * */
@Controller
@RequestMapping("VIEW")
public class AuditreportViewController extends PortletBaseController {
	private final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private AuditreportService auditreportService;
	@Autowired
	private BuildService buildService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		List<Auditreport> auditreportList = new ArrayList<Auditreport>();
		List<Auditreport> auditreportListByBuild = new ArrayList<Auditreport>();
		List<Buildinfo> buildinfoList = new ArrayList<Buildinfo>();
		auditreportList = auditreportService.getAllAuditreportList();
		auditreportListByBuild = auditreportService.auditreportListByBuild();
		if(auditreportList.size()>0){
//		Auditreport auditreport	= new Auditreport();
//		model.addAttribute("auditreport", auditreport);
		String buildId ="abc";
		for(int i=0;i<auditreportListByBuild.size();i++ ){
			if(!buildId.equals(auditreportListByBuild.get(i).getBuildId())){
			buildId = auditreportListByBuild.get(i).getBuildId();
			Buildinfo buildinfo =  buildService
					.getBuildinfo(buildId);
			buildinfoList.add(buildinfo);
			
			}
		}
		model.addAttribute("buildinfoList", buildinfoList);
		for(int i=0;i<auditreportList.size();i++ ){
			if(auditreportList.get(i).getBuildId().equals(buildinfoList.get(0).getBuildId())){
				Auditreport auditreport = auditreportList.get(i);
				model.addAttribute("auditreport", auditreport);
				i = auditreportList.size();
			}
		}
		}
		model.addAttribute("auditreportList", auditreportList);
		return PORTLETFOLDER + "auditreport/auditreportView";
	}
	
	@RenderMapping(params="action=gets")
	public ModelAndView gets(@RequestParam(value="reportid",required=true) String reportid,PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		String url = PORTLETFOLDER + "auditreport/auditreportView";
		mav.setViewName(url);
		
		try {
			List<Auditreport> auditreportList = new ArrayList<Auditreport>();
			List<Auditreport> auditreportListByBuild = new ArrayList<Auditreport>();
			List<Buildinfo> buildinfoList = new ArrayList<Buildinfo>();
			auditreportList = auditreportService.getAllAuditreportList();
			auditreportListByBuild = auditreportService.auditreportListByBuild();
			if(auditreportList.size()>0){
				String buildId = "abc";
				for(int i=0;i<auditreportListByBuild.size();i++ ){
					if(!buildId.equals(auditreportListByBuild.get(i).getBuildId())){
					buildId = auditreportListByBuild.get(i).getBuildId();
					Buildinfo buildinfo =  buildService
							.getBuildinfo(buildId);
					buildinfoList.add(buildinfo);
				}	
			}
				mav.addObject("buildinfoList", buildinfoList);
		}	
			Auditreport auditreport =  auditreportService
					.getAuditreport(reportid);
			mav.addObject("auditreport", auditreport);
			mav.addObject("auditreportList", auditreportList);
		} catch (Exception e) {
			logger.error(e);
		}
		return mav;
	}
	
	@ResourceMapping(value = "remove")
	public Resultmsg remove(@RequestParam("reportid") String reportid) {
		Resultmsg msg = new Resultmsg();
			try {
				    auditreportService.delete(reportid);
					msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		return msg;
	}
	
	@RenderMapping(params="action=Refreash")
	public ModelAndView gets(PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		String url = PORTLETFOLDER + "auditreport/auditreportView";
		mav.setViewName(url);
		
		try {
			List<Auditreport> auditreportList = new ArrayList<Auditreport>();
			List<Auditreport> auditreportListByBuild = new ArrayList<Auditreport>();
			List<Buildinfo> buildinfoList = new ArrayList<Buildinfo>();
			auditreportList = auditreportService.getAllAuditreportList();
			auditreportListByBuild = auditreportService.auditreportListByBuild();
			if(auditreportList.size()>0){
				String buildId = "abc";
				for(int i=0;i<auditreportListByBuild.size();i++ ){
					if(!buildId.equals(auditreportListByBuild.get(i).getBuildId())){
					buildId = auditreportListByBuild.get(i).getBuildId();
					Buildinfo buildinfo =  buildService
							.getBuildinfo(buildId);
					buildinfoList.add(buildinfo);
				}	
			}
				mav.addObject("buildinfoList", buildinfoList);
				for(int i=0;i<auditreportList.size();i++ ){
					if(auditreportList.get(i).getBuildId().equals(buildinfoList.get(0).getBuildId())){
						Auditreport auditreport = auditreportList.get(i);
						mav.addObject("auditreport", auditreport);
						i = auditreportList.size();
					}
				}
		}
			mav.addObject("auditreportList", auditreportList);
		} catch (Exception e) {
			logger.error(e);
		}
		return mav;
	}
}
