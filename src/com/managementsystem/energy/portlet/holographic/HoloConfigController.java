package com.managementsystem.energy.portlet.holographic;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletPreferences;
import javax.portlet.ReadOnlyException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.portlet.highcharts.jackson.JacksonIgnoreNullWapper;
import com.managementsystem.energy.portlet.holographic.config.HoloConifg;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.web.BaseController;

/**
 * 全息图配置控制器
 * 
 * @author allchin modified@2013年9月2日 下午1:19:29
 */
@Controller
@RequestMapping("EDIT")
public class HoloConfigController extends BaseController {

	/**
	 * I know you may care about this key ~
	 */
	public static String key = "holoCfg";
	@Autowired
	private PreferenceInfoService preferenceInfoService;

	/**
	 * 读取配置，配置页面初始化
	 * 
	 * @author allchin modified@2013年9月2日 下午1:18:57
	 * @param prefs
	 * @return
	 */
	@RenderMapping
	public ModelAndView setup(PortletPreferences prefs) {

		ModelAndView mav = new ModelAndView();

		PreferenceInfo preferenceinfo = null;
		if (prefs.getMap().size() == 0) {
			preferenceinfo = new PreferenceInfo();
		} else {
			preferenceinfo = preferenceInfoService.getPreferenceInfo(prefs);
		}
		mav.addObject("holoCfg", preferenceinfo);

		mav.setViewName("portlet/holographic/config/holoCfg");
		return mav;
	}

	/**
	 * 保存
	 * 
	 * @param prefs
	 *            首选项对象
	 * */
	@SuppressWarnings("rawtypes")
	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(
			@ModelAttribute("preferenceinfo") PreferenceInfo preferenceinfo,
			PortletPreferences prefs, ActionRequest request,
			ActionResponse response) throws PortletException,
			ReadOnlyException, IOException {

		List<String> errorMessages = new ArrayList<String>();
		try {
			preferenceInfoService.savePreferenceInfo(prefs, preferenceinfo);
		} catch (Exception e) {
			e.printStackTrace();
			errorMessages.add(e.getMessage());
		}
		request.setAttribute("errorMessages", errorMessages);
		request.setAttribute("successMessages", "操作成功");
	}
}
