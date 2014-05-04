package com.managementsystem.energy.portlet.energystatistic;

import java.util.Iterator;
import java.util.Set;

import javax.portlet.PortletPreferences;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.domain.Buildaddfile;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Dictitem;
import com.managementsystem.energy.domain.Districtinfo;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.DistrictService;
import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("VIEW")
public class CarbonFootprintViewController extends BaseController {

	@Autowired
	private BuildService buildService;
	@Autowired 
	private DistrictService districtService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		return PORTLETFOLDER + "energystatistic/carbonFootprintView";
	}
}
