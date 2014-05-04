package com.managementsystem.energy.portlet.totalenergy;

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

import com.managementsystem.energy.portlet.energystatic.model.EnergyStaticPreferenceInfo;
import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.portlet.energystatistic.service.EnergyStatisticService;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.ui.easyui.Resultmsg;

@Controller
@RequestMapping("VIEW")
// 与配置文件对应
public class TotalEnergyUseViewController extends BaseController {

	@Autowired
	private PreferenceInfoService preferenceInfoService;// 首选项信息

	@Autowired
	private EnergyStatisticService energyStatisticService;// 能耗统计接口
	/*
	 * 与Action相应-调用Service层方法，完成业务逻辑
	 * 
	 * return JSP页面路径-指引跳转到相应页面
	 */

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		EnergyStaticPreferenceInfo energyStaticPreferenceInfo = null;

		if (prefs.getMap().size() == 0) {
			energyStaticPreferenceInfo = new EnergyStaticPreferenceInfo();
		} else {
			try {
				energyStaticPreferenceInfo = (EnergyStaticPreferenceInfo) preferenceInfoService
						.getPreferenceInfo(prefs,
								new EnergyStaticPreferenceInfo());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		model.addAttribute("totalEnergy", energyStaticPreferenceInfo);
		return PORTLETFOLDER + "totalenergyuse/totalEnergyUseViewChart";// jsp文件路径
	}

	@ResourceMapping(value = "expTotalEnergyDataToExcel")
	public Resultmsg expTotalEnergyDataToExcel(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {
		Resultmsg msg = new Resultmsg();

		// 设置查询条件
		String from = request.getParameter("from");
		String type = request.getParameter("type");
		String name = request.getParameter("name"); // 选择的name
		String id = request.getParameter("id"); // 选择的id
		String ispd = request.getParameter("ispd"); // ispd
		String att = request.getParameter("att"); // attribute属性
		String decimals = request.getParameter("decimals"); // 保留小数位数
		String mult = request.getParameter("mult"); // mult表示是否需要乘数
		String expColumnName = request.getParameter("expColumnName"); // title表示excel中的列头名
		String isNotCompare = request.getParameter("isNotCompare"); // 判断是否是对比的图表
		String excelName = request.getParameter("excelName"); // 导出的excel名称

		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

		try {
			// 求对应的json数据
			resultMap = energyStatisticService.getOutSideChartData(type,
					from, id, name, ispd, att, decimals, mult);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			energyStatisticService.expOutSideChartDataToExcel(from,
					expColumnName, isNotCompare, type, resultMap, request,
					excelName);
			msg.setSuccess("true");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
}
