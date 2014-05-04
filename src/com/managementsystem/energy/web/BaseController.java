package com.managementsystem.energy.web;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletContext;
import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.liferay.portal.util.PortalUtil;
import com.managementsystem.energy.domain.Buildaddfile;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Circuitinfo;
import com.managementsystem.energy.domain.Dictitem;
import com.managementsystem.energy.domain.Importinfo;
import com.managementsystem.energy.domain.QueryScheme;
import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.portlet.energystatistic.service.EnergyStatisticService;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.CircuitinfoService;
import com.managementsystem.energy.service.DictionaryService;
import com.managementsystem.energy.service.ImportService;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.service.QuerySchemeService;
import com.managementsystem.ui.easyui.Datagrid;
import com.managementsystem.ui.easyui.Resultmsg;
import com.managementsystem.util.dao.Page;

public abstract class BaseController {

	/**
	 * 系统存放portlet的文件夹
	 * */
	public static final String PORTLETFOLDER = "portlet/";

	@Autowired
	private CircuitinfoService circuitinfoService;
	
	@Autowired
	private BuildService buildService;

	@Autowired
	public DictionaryService dictionaryService;

	@Autowired
	private QuerySchemeService querySchemeService;

	@Autowired
	private PreferenceInfoService preferenceInfoService;

	@Autowired
	private EnergyStatisticService energyStatisticService;
	
	@Autowired
	private ImportService importService;

	/**
	 * 获取指定字典组代码的字典数据
	 * 
	 * @param groupCode
	 *            字典组代码
	 * 
	 * @return 字典数据
	 * */
	@ResourceMapping(value = "getDictitemByGroupcode")
	public Datagrid getDictitemByGroupcode(
			@RequestParam("groupCode") String groupCode) {
		Datagrid datagrid = new Datagrid();
		Set<Dictitem> dictitems = dictionaryService
				.getDictitemBygroupCode(groupCode);
		datagrid.setTotal(new Long(dictitems.size()));
		datagrid.setRows(new ArrayList<Dictitem>(dictitems));
		return datagrid;
	}

	/**
	 * 获取所有建筑信息
	 * 
	 * @param page
	 *            所有页
	 * @param rows
	 *            行对象
	 * @param request
	 *            资源请求对象
	 * @param response
	 *            资源响应对象
	 * 
	 * @return 返回所有建筑信息分页信息
	 * */
	@ResourceMapping(value = "getBuildinfos")
	public Page getBuildinfos(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Map<String, Object> mapCondition = new HashMap<String, Object>();

		if (request.getParameter("keyword") != null) {
			String keyword = request.getParameter("keyword");
			mapCondition.put("buildName", keyword);
		}
		Page buildinfos = buildService.getBuildinfos(page, rows);
		return buildinfos;
	}

	/**
	 * 获取queryscheme表数据列表
	 * 
	 * @param page
	 * @param rows
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@ResourceMapping(value = "getQuerySchemeList")
	public Page getQuerySchemeList(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) throws Exception {
		Page queryschemes = querySchemeService.getAllQueryScheme(page, rows);
		return queryschemes;
	}

	@ResourceMapping(value = "getQuerySchemeListByCondition")
	public Map<String, Object> getQuerySchemeListByCondition(ResourceRequest request,
			ResourceResponse response) throws Exception {
		List<QueryScheme> querySchemes = new ArrayList<QueryScheme>();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String comments = request.getParameter("comments");
		String buildId = request.getParameter("buildId");
		String regionId = request.getParameter("regionId");
		
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			querySchemes = querySchemeService.getQuerySchemeListByCondition(id, name, comments, buildId, regionId);
			resultMap.put("result", querySchemes);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultMap; 
	}

	/**
	 * 获取单个的图表（主要是柱状图和曲线）
	 * */
	@ResourceMapping(value = "getSingleChartData")
	public Map<String, Object> getSingleChartData(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {

		// 获取首选项
		PreferenceInfo preferenceinfo = null;
		if (prefs.getMap().size() == 0) {
			preferenceinfo = new PreferenceInfo();
		} else {
			preferenceinfo = preferenceInfoService.getPreferenceInfo(prefs);
		}

		// 设置查询条件
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String type = request.getParameter("type");
		String name = request.getParameter("name"); // 选择的name
		String id = request.getParameter("id"); // 选择的id
		String ispd = request.getParameter("ispd"); // ispd
		String decimals = request.getParameter("decimals"); // 保留小数位数

		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			// 求对应的json数据
			resultMap = energyStatisticService.getSingleChartList(
					preferenceinfo, type, from, to, id, name, ispd, decimals);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultMap;
	}

	/**
	 * 获取多个的图表（主要用于柱状图/曲线线加曲线图）
	 * */
	@ResourceMapping(value = "getMoreChartData")
	public Map<String, Object> getMoreChartData(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {

		// 获取首选项
		PreferenceInfo preferenceinfo = null;
		if (prefs.getMap().size() == 0) {
			preferenceinfo = new PreferenceInfo();
		} else {
			preferenceinfo = preferenceInfoService.getPreferenceInfo(prefs);
		}

		// 设置查询条件
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String type = request.getParameter("type");
		String name = request.getParameter("name"); // 选择的name
		String id = request.getParameter("id"); // 选择的id
		String ispd = request.getParameter("ispd"); // ispd
		String referencevalue = request.getParameter("referencevalue"); // 参考值
		String referenceList = request.getParameter("referenceList"); // 参考列表
		String decimals = request.getParameter("decimals"); // 保留小数位数

		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			// 求对应的json数据
			resultMap = energyStatisticService.getMoreChartList(preferenceinfo,
					type, from, to, id, name, ispd, referencevalue,
					referenceList, decimals);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultMap;
	}

	/**
	 * 获取多个的图表（主要用于柱状图/曲线线加曲线图）
	 * */
	@ResourceMapping(value = "getValueByNameAndId")
	public Map<String, Object> getValueByNameAndId(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {

		// 设置查询条件
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String type = request.getParameter("type"); // 计算用的类型
		String name = request.getParameter("name"); // 选择的name
		String id = request.getParameter("id"); // 选择的id
		String ispd = request.getParameter("ispd"); // ispd
		String att = request.getParameter("att"); // attribute属性
		String decimals = request.getParameter("decimals"); // 保留小数位数
		String mult = request.getParameter("mult"); // 是否需要乘数

		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			// 求对应的json数据
			resultMap = energyStatisticService.getValueByNameAndId(type, from,
					to, id, name, ispd, att, decimals, mult);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultMap;
	}
	
	/**
	 * 获取map格式的数据(针对第二版能源产品中类似最大值、最小值以及对应的时间)
	 * @author zouzhixiang 2014-03-07
	 */
	@ResourceMapping(value = "getDatasForAtts")
	public Map<String, Object> getDatasForAtts(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {
		
		// 设置查询条件
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String type = request.getParameter("type"); // 计算用的类型
		String name = request.getParameter("name"); // 选择的name
		String id = request.getParameter("id"); // 选择的id
		String ispd = request.getParameter("ispd"); // ispd
		String att = request.getParameter("att"); // attribute属性
		String decimals = request.getParameter("decimals"); // 保留小数位数
		String mult = request.getParameter("mult"); // 是否需要乘数
		String build_id = request.getParameter("build_id"); // build_id表示对应的建筑(如：A1、P1)
		String region_id = request.getParameter("region_id"); // region_id表示对应楼层(如：F1、B1)
		
		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			// 求对应的json数据
			resultMap = energyStatisticService.getDatasForAtts(type, from, to, id, name, ispd, att, decimals, mult, build_id, region_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

	/**
	 * 获取map格式的数据(针对第二版能源产品中取多栋建筑的开启台数)
	 * @author zouzhixiang 2014-03-11
	 */
	@ResourceMapping(value = "getDatasForBuilds")
	public Map<String, Object> getDatasForBuilds(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {
		
		// 设置查询条件
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String type = request.getParameter("type"); // 计算用的类型
		String name = request.getParameter("name"); // 选择的name
		String id = request.getParameter("id"); // 选择的id
		String ispd = request.getParameter("ispd"); // ispd
		String att = request.getParameter("att"); // attribute属性
		String decimals = request.getParameter("decimals"); // 保留小数位数
		String mult = request.getParameter("mult"); // 是否需要乘数
		String build_id = request.getParameter("build_id"); // build_id表示对应的建筑(如：A1、P1)
		String region_id = request.getParameter("region_id"); // region_id表示对应楼层(如：F1、B1)
		
		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			// 求对应的json数据
			resultMap = energyStatisticService.getDatasForBuilds(type, from, to, id, name, ispd, att, decimals, mult, build_id, region_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}
	
	/**
	 * 获取map格式的数据(针对第二版能源产品中多name和多attribute等情况做出处理)
	 * @author zouzhixiang 2014-03-07
	 */
	@ResourceMapping(value = "getDatasForNamesAndAtts")
	public Map<String, Object> getDatasForNamesAndAtts(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {
		
		// 设置查询条件
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String type = request.getParameter("type"); // 计算用的类型
		String name = request.getParameter("name"); // 选择的name
		String id = request.getParameter("id"); // 选择的id
		String ispd = request.getParameter("ispd"); // ispd
		String att = request.getParameter("att"); // attribute属性
		String decimals = request.getParameter("decimals"); // 保留小数位数
		String mult = request.getParameter("mult"); // 是否需要乘数
		String build_id = request.getParameter("build_id"); // build_id表示对应的建筑(如：A1、P1)
		String region_id = request.getParameter("region_id"); // region_id表示对应楼层(如：F1、B1)
		
		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			// 求对应的json数据
			resultMap = energyStatisticService.getDatasForNamesAndAtts(type, from, to, id, name, ispd, att, decimals, mult, build_id, region_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}
	
	/**
	 * 获取map格式的数据(针对第二版能源产品中运行监测模块的处理，多name情况做出处理)
	 * @author zouzhixiang 2014-03-12
	 */
	@ResourceMapping(value = "getDatasByNamesForMonitor")
	public Map<String, Object> getDatasByNamesForMonitor(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {
		
		// 设置查询条件
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String type = request.getParameter("type"); // 计算用的类型
		String name = request.getParameter("name"); // 选择的name
		String id = request.getParameter("id"); // 选择的id
		String ispd = request.getParameter("ispd"); // ispd
		String att = request.getParameter("att"); // attribute属性
		String decimals = request.getParameter("decimals"); // 保留小数位数
		String mult = request.getParameter("mult"); // 是否需要乘数
		String build_id = request.getParameter("build_id"); // build_id表示对应的建筑(如：A1、P1)
		String region_id = request.getParameter("region_id"); // region_id表示对应楼层(如：F1、B1)
		
		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			// 求对应的json数据
			resultMap = energyStatisticService.getDatasByNamesForMonitor(type, from, to, id, name, ispd, att, decimals, mult, build_id, region_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

	/**
	 * 返回多个charts对应的数据列表，数据格式如：[[1],[2],[3]]
	 * */
	@ResourceMapping(value = "getMoreChartsByNames")
	public Map<String, Object> getMoreChartsByNames(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {

		// 获取首选项
		PreferenceInfo preferenceinfo = null;
		if (prefs.getMap().size() == 0) {
			preferenceinfo = new PreferenceInfo();
		} else {
			preferenceinfo = preferenceInfoService.getPreferenceInfo(prefs);
		}

		// 设置查询条件
		String from = request.getParameter("from");
		String type = request.getParameter("type");
		String name = request.getParameter("name"); // 选择的name
		String id = request.getParameter("id"); // 选择的id
		String ispd = request.getParameter("ispd"); // ispd
		String decimals = request.getParameter("decimals"); // 保留小数位数
		String att = request.getParameter("att"); // attribute
		String mult = request.getParameter("mult"); // mult表示是否需要乘数

		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			// 求对应的json数据
			resultMap = energyStatisticService.getMoreChartsByNames(
					preferenceinfo, type, from, id, name, ispd, decimals, att,
					mult);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultMap;
	}

	/**
	 * 获取多个的图表（主要用于柱状图/曲线线加曲线图）
	 * */
	@ResourceMapping(value = "getValueListByNames")
	public Map<String, Object> getValueListByNames(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {

		// 获取首选项
		PreferenceInfo preferenceinfo = null;
		if (prefs.getMap().size() == 0) {
			preferenceinfo = new PreferenceInfo();
		} else {
			preferenceinfo = preferenceInfoService.getPreferenceInfo(prefs);
		}

		// 设置查询条件
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String type = request.getParameter("type");
		String name = request.getParameter("name"); // 选择的name
		String id = request.getParameter("id"); // 选择的id
		String ispd = request.getParameter("ispd"); // ispd
		String decimals = request.getParameter("decimals"); // 保留小数位数

		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			// 求对应的json数据
			resultMap = energyStatisticService.getValueListByNames(
					preferenceinfo, type, from, to, id, name, ispd, decimals);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultMap;
	}

	/**
	 * 返回单个页面需要的效果数据，此方法name支持传递多个参数，attribute支持传多个参数
	 * */
	@ResourceMapping(value = "getValueListByNamesAndAtts")
	public Map<String, Object> getValueListByNamesAndAtts(
			PortletPreferences prefs, ResourceRequest request,
			ResourceResponse response) {

		// 设置查询条件
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String type = request.getParameter("type"); // 计算用的类型
		String name = request.getParameter("name"); // 选择的name
		String id = request.getParameter("id"); // 选择的id
		String ispd = request.getParameter("ispd"); // ispd
		String att = request.getParameter("att"); // attribute属性
		String decimals = request.getParameter("decimals"); // 保留小数位数
		String multiplier = request.getParameter("multiplier"); // 是否乘数

		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			// 求对应的json数据
			resultMap = energyStatisticService.getValueListByNamesAndAtts(type,
					from, to, id, name, ispd, att, decimals, multiplier);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultMap;
	}

	/**
	 * 单个图表和多个图表是否可以同用一个方法
	 * */
	@ResourceMapping(value = "getCommonChartData")
	public Map<String, Object> getCommonChartData(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {

		// 获取首选项
		PreferenceInfo preferenceinfo = null;
		if (prefs.getMap().size() == 0) {
			preferenceinfo = new PreferenceInfo();
		} else {
			preferenceinfo = preferenceInfoService.getPreferenceInfo(prefs);
		}

		// 设置查询条件
		String from = request.getParameter("from");
		String type = request.getParameter("type");
		String name = request.getParameter("name"); // 选择的name
		String id = request.getParameter("id"); // 选择的id
		String ispd = request.getParameter("ispd"); // ispd
		String att = request.getParameter("att"); // attribute属性
		String decimals = request.getParameter("decimals"); // 保留小数位数
		String mult = request.getParameter("mult"); // mult表示是否需要乘数
		String build_id = request.getParameter("build_id"); // build_id表示对应的建筑(如：A1、P1)
		String region_id = request.getParameter("region_id"); // region_id表示对应楼层(如：F1、B1)
		String source = request.getParameter("source"); // source表示对应来源，为了区分是否是运行监测进来的

		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

		try {
			// 求对应的json数据
			resultMap = energyStatisticService.getCommonChartData(
					preferenceinfo, type, from, id, name, ispd, att, decimals,
					mult, build_id, region_id, source);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultMap;
	}

	/**
	 * 输出报表数据到EXCEL中
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResourceMapping(value = "expCommonChartDataToExcel")
	public Resultmsg expCommonChartDataToExcel(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {
		Resultmsg msg = new Resultmsg();

		// 获取首选项
		PreferenceInfo preferenceinfo = null;
		if (prefs.getMap().size() == 0) {
			preferenceinfo = new PreferenceInfo();
		} else {
			preferenceinfo = preferenceInfoService.getPreferenceInfo(prefs);
		}

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
		String build_id = request.getParameter("build_id"); // build_id表示对应的建筑(如：A1、P1)
		String region_id = request.getParameter("region_id"); // region_id表示对应楼层(如：F1、B1)

		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

		try {
			// 求对应的json数据
			resultMap = energyStatisticService.getCommonChartData(
					preferenceinfo, type, from, id, name, ispd, att, decimals,
					mult, build_id, region_id, "");
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			energyStatisticService.expChartDataToExcel(from, expColumnName,
					isNotCompare, type, preferenceinfo, resultMap, request,
					excelName);
			msg.setSuccess("true");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	// 删除excel临时缓存文件
	@ResourceMapping(value = "deleteExcelDataTempFile")
	public Resultmsg deleteExcelDataTempFile(ResourceRequest request,
			ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		try {
			String fileName = request.getParameter("fileName");
			PortletContext portletContext = request.getPortletSession()
					.getPortletContext();
			String realPath = portletContext.getRealPath("");
			String addfilePath = "\\uploadfiles\\";
			realPath += addfilePath;
			realPath += fileName + ".xls";
			File file = new File(realPath);
			if (file.exists())
				file.delete();
			msg.setSuccess("true");
		} catch (Exception e) {
			msg.setMsg(e.getMessage());
			e.printStackTrace();
		}

		return msg;
	}

	/**
	 * 输出报表数据到EXCEL中
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResourceMapping(value = "expPieChartsDataToExcel")
	public Resultmsg expPieChartsDataToExcel(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {
		Resultmsg msg = new Resultmsg();

		// 获取首选项
		PreferenceInfo preferenceinfo = null;
		if (prefs.getMap().size() == 0) {
			preferenceinfo = new PreferenceInfo();
		} else {
			preferenceinfo = preferenceInfoService.getPreferenceInfo(prefs);
		}

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
		String itemName = request.getParameter("itemName"); // 导出的饼图的项
		String comparetime = request.getParameter("comparetime"); // 导出的时间

		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

		try {
			// 求对应的json数据
			resultMap = energyStatisticService.getPieChartsDataInfo(
					preferenceinfo, type, from, id, name, ispd, decimals, att,
					mult, itemName, comparetime);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			energyStatisticService.expPieChartDataToExcel(from, expColumnName,
					isNotCompare, type, preferenceinfo, resultMap, request,
					excelName);
			msg.setSuccess("true");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
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
			resultMap = energyStatisticService.getOutSideChartData(type, from,
					id, name, ispd, att, decimals, mult);
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
	
	/**
	 * 从excel中导入电表数据
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResourceMapping(value = "commonImportExcelData")
	public void commonImportExcelData(PortletPreferences prefs,
			@ModelAttribute("importinfo") Importinfo importinfo,
			ResourceRequest request, ResourceResponse response, Model model) {
		String str = "true";
		
		try {
			// 转换request
			HttpServletRequest servletRequest = PortalUtil.getHttpServletRequest(request);
			MultipartResolver resolver = new CommonsMultipartResolver(servletRequest.getSession().getServletContext());
			MultipartHttpServletRequest multRequest = resolver.resolveMultipart(servletRequest);
			
			Map<String, MultipartFile> fileMap =  multRequest.getFileMap();
			for (Map.Entry<String, MultipartFile> entity :  fileMap.entrySet()) {   
				// 上传文件信息  
				MultipartFile mf = entity.getValue();    
				importService.importExcelToCircuitinfo(mf);
			}

			str = "true";
			
		} catch (Exception e) {
			str = "false";
			e.printStackTrace();
		}
		
		model.addAttribute("str", str);

//		return PORTLETFOLDER + "import/importView";
	}
}
