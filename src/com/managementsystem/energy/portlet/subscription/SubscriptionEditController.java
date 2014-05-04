package com.managementsystem.energy.portlet.subscription;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletPreferences;
import javax.portlet.ReadOnlyException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.User;
import com.liferay.portal.theme.ThemeDisplay;
import com.managementsystem.energy.domain.Articlecategory;
import com.managementsystem.energy.domain.Subscription;
import com.managementsystem.energy.portlet.buildinfo.BuildinfoPreferenceController;
import com.managementsystem.energy.portlet.subscription.service.SubscriptionService;
import com.managementsystem.energy.web.PortletBaseController;

/**
 * 订阅模块编辑页
 * */
@Controller
@RequestMapping("EDIT")
public class SubscriptionEditController extends PortletBaseController {
	
	private final Log logger = LogFactory.getLog(SubscriptionEditController.class);
	
	@Autowired
	private SubscriptionService subscriptionService;

	@RenderMapping
	public ModelAndView showSubscriptionSetting(RenderRequest req,
			RenderResponse res) {
		ModelAndView mav = new ModelAndView();
		Subscription subscription = new Subscription();
		ThemeDisplay themeDisplay = (ThemeDisplay) req
				.getAttribute(WebKeys.THEME_DISPLAY);
		User user = null;
		user = themeDisplay.getUser();
		Long companyid = user.getCompanyId();
		Long userid = user.getUserId();
		String username = user.getFullName();
		subscription = subscriptionService.getSubscriptionByUserid(userid);
		mav.addObject("subscription", subscription);
		mav.setViewName(PORTLETFOLDER + "subscription/subscriptionEdit");
		return mav;
	}
	
	@RenderMapping(params = "action=selectEnergyitemdict")
	public ModelAndView selectEnergyitemdict(RenderRequest req,
			RenderResponse res) {
		ModelAndView mav = new ModelAndView();
		Subscription subscription = new Subscription();
		ThemeDisplay themeDisplay = (ThemeDisplay) req
				.getAttribute(WebKeys.THEME_DISPLAY);
		User user = null;
		user = themeDisplay.getUser();
		Long companyid = user.getCompanyId();
		Long userid = user.getUserId();
		String username = user.getFullName();
		subscription = subscriptionService.getSubscriptionByUserid(userid);
		mav.addObject("subscription", subscription);
		mav.setViewName(PORTLETFOLDER + "subscription/subscriptionEdit");
		return mav;
    }
	
	/**
	 * 保存知识类别
	 * */
	@ActionMapping(params = "action=savePreferences")
	public void saveArticlecategory(
			@ModelAttribute("subscription") Subscription subscription,
			PortletPreferences prefs, ActionRequest request,
			ActionResponse response) throws PortletException,
			ReadOnlyException, IOException {
		try {
			ThemeDisplay themeDisplay = (ThemeDisplay) request
					.getAttribute(WebKeys.THEME_DISPLAY);
			User user = null;
			user = themeDisplay.getUser();
			Long companyid = user.getCompanyId();
			Long userid = user.getUserId();
			String username = user.getFullName();
			subscription.setUserid(userid);
			subscription.setUsername(username);
			subscription.setCompanyid(companyid);
		    subscriptionService.saveOrUpdateSubscription(subscription);
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
			request.setAttribute("errorMessages", e.getMessage());
		}

	}
}
