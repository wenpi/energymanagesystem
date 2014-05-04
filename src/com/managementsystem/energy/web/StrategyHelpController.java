package com.managementsystem.energy.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

@Controller
@RequestMapping("HELP")
public class StrategyHelpController {
	@RenderMapping
	public String showHelp() {
		return "strategy/strategyHelp";
	}
}
