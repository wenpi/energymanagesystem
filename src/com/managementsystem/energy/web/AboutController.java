package com.managementsystem.energy.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

@Controller
@RequestMapping("VIEW")
public class AboutController  extends BaseController {
	
	@RenderMapping
	public String setupAbout() {
		return "about/about";
	}
	
	
	@RenderMapping(params="action=help")
	public String setupHelp() {
		return "about/viewHelp";
	}
}
