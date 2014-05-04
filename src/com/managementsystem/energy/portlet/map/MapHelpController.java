package com.managementsystem.energy.portlet.map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.web.PortletBaseController;

/**
 * 能耗比较模块帮助页
 * */
@Controller
@RequestMapping("HELP")
public class MapHelpController extends PortletBaseController {
	
	@RenderMapping
	public String showHelp() {
		return PORTLETFOLDER + "contrast/contrastHelp";
	}
}
