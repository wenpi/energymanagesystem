package com.managementsystem.energy.portlet.energymark;

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
public class EnergymarkViewController extends BaseController {
	
	@Autowired
	private BuildService buildService;

	@RenderMapping
	public String setup(PortletPreferences prefs,Model model) {
		if (prefs.getMap().size() == 0) {
		   } 
		else {
		   String addfilePath ="/energymanagesystem/images/icons/xj.png";
		   String xj = prefs.getValue("xj", "");
		   model.addAttribute("xj", xj);
		   model.addAttribute("addfilePath", addfilePath);
		   }
		return PORTLETFOLDER + "energymark/energymarkView";
	}
}
