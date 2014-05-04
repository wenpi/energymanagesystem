package com.managementsystem.energy.portlet.subscription;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.web.PortletBaseController;

/**
 * 订阅模块帮助页
 * */
@Controller
@RequestMapping("HELP")
public class SubscriptionHelpController extends PortletBaseController {

	@RenderMapping
	public String showHelp() {
		return PORTLETFOLDER + "subscription/subscriptionHelp";
	}

}
