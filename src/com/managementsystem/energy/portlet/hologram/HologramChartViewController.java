package com.managementsystem.energy.portlet.hologram;

import java.util.LinkedHashMap;
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

import com.managementsystem.energy.portlet.energystatistic.service.EnergyStatisticService;
import com.managementsystem.energy.portlet.preferenceinfo.HologramPreferenceInfo;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.web.BaseController;

/**
 * 全息图
 * 
 * @author liuchao
 * 
 */
@Controller
@RequestMapping("VIEW")
public class HologramChartViewController extends BaseController {
	@Autowired
	private PreferenceInfoService preferenceInfoService;
	
	@Autowired
	private EnergyStatisticService energyStatisticService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		HologramPreferenceInfo hologramPreferenceInfo = new HologramPreferenceInfo();

		if (prefs.getMap().size() != 0) {
			try {
				hologramPreferenceInfo = (HologramPreferenceInfo)preferenceInfoService.getPreferenceInfo(prefs,hologramPreferenceInfo);
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}//读取首选项配置信息
		}
		model.addAttribute("tbinfo", hologramPreferenceInfo);//保存首选项信息
		return PORTLETFOLDER + "hologram/hologramInfoView";//返回视图
	}
	
	/**
	 * 获取报表数据
	 * */
	@ResourceMapping(value = "getReportDataList")
	public Map<String, Object> getReportDataList(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {

		// 获取前台传递过来的参数，分别是类型（day/week/month/year）、开始时间、结束时间
		String type = request.getParameter("type");
		String from_date = request.getParameter("from");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String ispd = request.getParameter("ispd");

		HologramPreferenceInfo hologramPreferenceInfo = new HologramPreferenceInfo();

		if (prefs.getMap().size() != 0) {
			try {
				hologramPreferenceInfo = (HologramPreferenceInfo) preferenceInfoService
						.getPreferenceInfo(prefs, hologramPreferenceInfo);
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			// 求对应的json数据
			resultMap = energyStatisticService.printReportInfo(name, id, ispd,
					type, from_date, "", "", "", "", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
}
