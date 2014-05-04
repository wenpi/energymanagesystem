package com.managementsystem.energy.portlet.energyquery;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.web.PortletBaseController;

/**
 * 能耗查询帮助页
 * @author CHENPING 2012-09-04
 * */
@Controller
@RequestMapping("HELP")
public class EnergyqueryHelpController extends PortletBaseController  {
	
	/**
	 * 显示模块帮助信息
	 * */
	@RenderMapping
	public String showHelp() {
		return PORTLETFOLDER + "energyquery/energyqueryHelp";
	}
}
