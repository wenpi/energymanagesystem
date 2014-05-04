package com.managementsystem.energy.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

/**
 * 文章帮助
 * */
@Controller
@RequestMapping("HELP")
public class HelpArticleController extends BaseController {

	@RenderMapping
	public String showHelp() {
		return PORTLETFOLDER + "article/helpArticle";
	}
}
