package com.managementsystem.energy.portlet.energymanagement;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletPreferences;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.managementsystem.energy.domain.Buildaddfile;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.util.dao.Page;

@Controller
@RequestMapping("VIEW")
public class EnergymanagementViewController extends BaseController {

	@RenderMapping
	public String setup(PortletPreferences prefs,Model model) {
		return PORTLETFOLDER + "energymanagement/energymanagementView";
	}
}
