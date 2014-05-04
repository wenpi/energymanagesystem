package com.managementsystem.energy.portlet.subscription;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.User;
import com.liferay.portal.theme.ThemeDisplay;
import com.managementsystem.energy.web.PortletBaseController;

/**
 * 订阅模块显示页
 * */
@Controller
@RequestMapping("VIEW")
public class SubscriptionViewController extends PortletBaseController {

	@RenderMapping
	public ModelAndView showSubscriptionSetting(RenderRequest req,
			RenderResponse res) {
		ModelAndView mav = new ModelAndView();

		ThemeDisplay themeDisplay = (ThemeDisplay) req
				.getAttribute(WebKeys.THEME_DISPLAY);
		User user = null;
		boolean isSignedIn = false;
		if (themeDisplay.isSignedIn()) {
			user = themeDisplay.getUser();
			isSignedIn = true;
		}
		mav.addObject("isSignedIn",isSignedIn);
		mav.addObject("user",user);
		mav.setView(PORTLETFOLDER + "subscription/subscriptionView");
		return mav;
	}
}
