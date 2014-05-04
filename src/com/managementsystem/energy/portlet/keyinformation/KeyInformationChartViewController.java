package com.managementsystem.energy.portlet.keyinformation;

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
 * 首页关键信息
 * 
 * @author liuchao
 * 
 */
@Controller
@RequestMapping("VIEW")
public class KeyInformationChartViewController extends BaseController {

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
		NavigationPreferenceInfo navigationPreferenceInfo = new NavigationPreferenceInfo();

		if (prefs.getMap().size() != 0) {
			try {
				navigationPreferenceInfo = (NavigationPreferenceInfo) preferenceInfoService
						.getPreferenceInfo(prefs, navigationPreferenceInfo);
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		model.addAttribute("tbinfo", navigationPreferenceInfo);

		// 求 建筑基本信息 相关的数值
		Buildinfo buildinfo = null;
		String addfilePath = "";
		String buildDistrictName = "";
		String buildStrutype = "";
		String buildFunction = ""; // 建筑类型
		String buildAirtype = "";
		if (prefs.getMap().size() == 0) {
			buildinfo = new Buildinfo();
		} else {
			String buildId = prefs.getValue("buildId", "");

			if (StringUtils.hasLength(buildId)) {
				buildinfo = buildService.getBuildcover(buildId);
				if (buildinfo != null
						&& buildinfo.getBuildaddfiles().size() > 0) {
					Set<Buildaddfile> addfiles = buildinfo.getBuildaddfiles();
					for (Iterator<Buildaddfile> it = addfiles.iterator(); it
							.hasNext();) {
						Buildaddfile addfile = it.next();
						if (addfile.getAddfileFunctype() == 0) {
							addfilePath = addfile.getAddfilePath();
							break;
						}
					}
				}
			}
		}

		model.addAttribute("addfilePath", addfilePath);
		model.addAttribute("buildinfo", buildinfo);
		if (buildinfo.getBuildDistrictid() != null) {
			Districtinfo districtinfo = new Districtinfo();
			districtinfo = districtService.getDistrictinfo(buildinfo
					.getBuildDistrictid());
			buildDistrictName = districtinfo.getDistrictName();
			model.addAttribute("buildDistrictName", buildDistrictName);
		}
		if (buildinfo.getBuildStrutype() != null) {
			Dictitem dictitem = null;
			dictitem = dictionaryService.getDictitemByItemcode(
					"build_strutype", buildinfo.getBuildStrutype().toString());
			buildStrutype = dictitem.getItemName();
			model.addAttribute("buildStrutype", buildStrutype);
		}
		// 建筑类型
		if (buildinfo.getBuildFunction() != null) {
			Dictitem dictitem = null;
			dictitem = dictionaryService.getDictitemByItemcode(
					"build_function", buildinfo.getBuildFunction().toString());
			buildFunction = dictitem.getItemName();
			model.addAttribute("buildFunction", buildFunction);
		}
		if (buildinfo.getBuildAirtype() != null) {
			Dictitem dictitem = new Dictitem();
			dictitem = dictionaryService.getDictitemByItemcode("build_airtype",
					buildinfo.getBuildAirtype().toString());
			buildAirtype = dictitem.getItemName();
			model.addAttribute("buildAirtype", buildAirtype);
		}

		return PORTLETFOLDER + "keyinformation/keyInformationInfoView";
	}

	/**
	 * 输出报表数据到EXCEL中
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResourceMapping(value = "expOutSideChartDataToExcel")
	public Resultmsg expOutSideChartDataToExcel(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {
		Resultmsg msg = new Resultmsg();

		// 获取首选项
		NavigationPreferenceInfo navigationPreferenceInfo = new NavigationPreferenceInfo();
		if (prefs.getMap().size() != 0) {
			try {
				navigationPreferenceInfo = (NavigationPreferenceInfo) preferenceInfoService
						.getPreferenceInfo(prefs, navigationPreferenceInfo);
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// 设置查询条件
		String from = request.getParameter("from");// 选择的时间
		String type = request.getParameter("type");// 视图类型
		String name = request.getParameter("name"); // 选择的图表name对应的urlname
		String id = request.getParameter("id"); // 选择的图表id对应的urlid
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
			resultMap = energyStatisticService.getOutSideChartData(type, from, id, name,
					ispd, att, decimals, mult);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			// 根据所求出的数据，导出到excel中
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
