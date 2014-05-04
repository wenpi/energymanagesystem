package com.managementsystem.energy.portlet.ranking;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.web.PortletBaseController;

/**
 * 能耗排名模块帮助页
 * */
@Controller
@RequestMapping("HELP")
public class RankingHelpController extends PortletBaseController {
	
	@RenderMapping
	public String showHelp() {
		return PORTLETFOLDER + "ranking/rankingHelp";
	}
}
