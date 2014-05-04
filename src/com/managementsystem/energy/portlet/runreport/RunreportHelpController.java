package com.managementsystem.energy.portlet.runreport;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("HELP")
public class RunreportHelpController extends BaseController {

	@RenderMapping
	public String showHelp() {
		return PORTLETFOLDER + "runreport/runreportHelp";
	}
	
}
