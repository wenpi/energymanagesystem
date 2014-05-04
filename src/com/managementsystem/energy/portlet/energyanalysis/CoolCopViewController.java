package com.managementsystem.energy.portlet.energyanalysis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.portlet.chart.model.Queryresult;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.DistrictService;
import com.managementsystem.energy.web.BaseController;

@Controller
@RequestMapping("VIEW")
public class CoolCopViewController extends BaseController {
	// 冷机COP
	@Autowired
	private BuildService buildService;
	@Autowired
	private DistrictService districtService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		return PORTLETFOLDER + "energyanalysis/coolCopView";
	}
}
