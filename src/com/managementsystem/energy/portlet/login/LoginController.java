package com.managementsystem.energy.portlet.login;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Buildaddfile;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Dictitem;
import com.managementsystem.energy.domain.Districtinfo;
import com.managementsystem.energy.portlet.energystatistic.service.EnergyStatisticService;
import com.managementsystem.energy.portlet.preferenceinfo.NavigationPreferenceInfo;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.DistrictService;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.ui.easyui.Resultmsg;

/**
 * 登录页面
 * 
 * @author zouzhixiang
 * @date 2014-12-03
 * 
 */
@Controller
@RequestMapping("VIEW")
public class LoginController extends BaseController {

	@Autowired
	private BuildService buildService;

	@Autowired
	private PreferenceInfoService preferenceInfoService;

	@Autowired
	private DistrictService districtService;

	@Autowired
	private EnergyStatisticService energyStatisticService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		return PORTLETFOLDER + "login/login";
	}
}
