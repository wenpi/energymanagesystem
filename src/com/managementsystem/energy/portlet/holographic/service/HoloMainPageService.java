package com.managementsystem.energy.portlet.holographic.service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.portlet.ModelAndView;
import com.managementsystem.energy.domain.Buildregioninfo;
import com.managementsystem.energy.domain.QueryScheme;
import com.managementsystem.energy.portlet.highcharts.jackson.JacksonIgnoreNullWapper;
import com.managementsystem.energy.portlet.holographic.constants.Constants;
import com.managementsystem.energy.portlet.holographic.vo.DetectOverViewData;
import com.managementsystem.energy.portlet.holographic.vo.ServcieSettingHolder;
import com.managementsystem.energy.portlet.holographic.vo.ServiceReqParam;

@Service
@Transactional
public class HoloMainPageService {
	@Autowired
	private ServcieSettingHolder servcieSettingHolder;
	@Autowired
	private RemoteServiceInvoker remoteServiceInvoker;

	@Autowired
	private EquipService equipService;

	private Logger logger = Logger.getLogger(HoloMainPageService.class);
	/**
	 * 设备统计数据map,按照建筑层次划分
	 */
	private LinkedHashMap<String, DetectOverViewData> ovm;
	// 楼层对象
	private LinkedHashMap<String, DetectOverViewData> floorOvm;

	/**
	 * 区域 -设备列表 映射
	 */
	private HashMap<String, Map<String, List<QueryScheme>>> equipRegionMap;
	/**
	 * 设备map
	 */
	private HashMap<String, List<QueryScheme>> qs;

	private Set<Buildregioninfo> region;
	private String[] cates = { "vav", "fau", "ahu", "fcu", "acu", "chiller",
			"cwp", "chwp", "ct", "ef", "sf" };

	@Autowired
	private DetectGraphicService detectGraphicService;

	/**
	 * 开启设备
	 * 
	 * @return
	 */
	public Map<String, Integer> getOpendDevice() {
		Map<String, Integer> regionMap = new HashMap();

		// opens
		ServiceReqParam md = new ServiceReqParam();
		md.setType("span");
		md.setTto(servcieSettingHolder.getCurrentDate());
		md.setName("number_on");
		md.setTfrom(null);

		Double[] ons = null;
		int opend = 0;
		//
		try {
			md.setId("fau_0");
			ons = remoteServiceInvoker.invokeValueToArray(md);
			opend = ons[ons.length - 1].intValue();
			regionMap.put("fau_0", opend);
		} catch (Exception e) {
			e.printStackTrace();
		}

		//
		try {
			md.setId("fau_5");
			ons = remoteServiceInvoker.invokeValueToArray(md);
			opend = ons[ons.length - 1].intValue();
			regionMap.put("fau_5", opend);
		} catch (Exception e) {
			e.printStackTrace();
		}

		//
		try {
			md.setId("fau_49");
			ons = remoteServiceInvoker.invokeValueToArray(md);
			opend = ons[ons.length - 1].intValue();
			regionMap.put("fau_49", opend);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// ahu open
		try {
			md.setId("ahu_0");
			ons = remoteServiceInvoker.invokeValueToArray(md);
			opend = ons[ons.length - 1].intValue();
			regionMap.put("ahu_0", opend);
		} catch (Exception e) {
			e.printStackTrace();
		}

		//
		try {
			md.setId("ahu_5");
			ons = remoteServiceInvoker.invokeValueToArray(md);
			opend = ons[ons.length - 1].intValue();
			regionMap.put("ahu_5", opend);
		} catch (Exception e) {
			e.printStackTrace();
		}

		//
		try {
			md.setId("ahu_33");
			ons = remoteServiceInvoker.invokeValueToArray(md);
			opend = ons[ons.length - 1].intValue();
			regionMap.put("ahu_33", opend);
		} catch (Exception e) {
			e.printStackTrace();
		}

		//
		try {
			md.setId("ahu_41");
			ons = remoteServiceInvoker.invokeValueToArray(md);
			opend = ons[ons.length - 1].intValue();
			regionMap.put("ahu_41", opend);
		} catch (Exception e) {
			e.printStackTrace();
		}

		//
		try {
			md.setId("ahu_49");
			ons = remoteServiceInvoker.invokeValueToArray(md);
			opend = ons[ons.length - 1].intValue();
			regionMap.put("ahu_49", opend);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// acu_0
		try {
			md.setId("acu_0");
			ons = remoteServiceInvoker.invokeValueToArray(md);
			opend = ons[ons.length - 1].intValue();
			regionMap.put("acu_0", opend);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// acu_33
		try {
			md.setId("acu_33");
			ons = remoteServiceInvoker.invokeValueToArray(md);
			opend = ons[ons.length - 1].intValue();
			regionMap.put("acu_33", opend);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// acu_41
		try {
			md.setId("acu_41");
			ons = remoteServiceInvoker.invokeValueToArray(md);
			opend = ons[ons.length - 1].intValue();
			regionMap.put("acu_41", opend);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// acu_49
		try {
			md.setId("acu_49");
			ons = remoteServiceInvoker.invokeValueToArray(md);
			opend = ons[ons.length - 1].intValue();
			regionMap.put("acu_49", opend);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// chiller
		try {
			md.setId("chiller");
			ons = remoteServiceInvoker.invokeValueToArray(md);
			opend = ons[ons.length - 1].intValue();
			regionMap.put("chiller", opend);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return regionMap;
	}

	// 运行监测页面初始化时，调用的方法
	public ModelAndView setupMainPageData(String buildId, String itemName) {
		ModelAndView mav = new ModelAndView();
		// Test

		String defaultRegionId = null; // 设置默认显示的区域
		Set<Buildregioninfo> bf = new HashSet<Buildregioninfo>();
		String build_Id = ""; // 计算建筑id
		Map<String, List<QueryScheme>> qs;

		if (itemName != null && "taobao".equalsIgnoreCase(itemName)) { // 判断当前查看的项目是否是淘宝
			build_Id = buildId;
			bf = getRegionByBuildIdAndRegionType(build_Id,
					Constants.BUILDREGION_BUILD); // 淘宝默认类型为建筑群
			defaultRegionId = "0000010700010001"; // 淘宝默认显示为A1号楼
			qs = getQsForTaoBao(build_Id, defaultRegionId);// 楼层、高度、区域
		} else { // 中国馆项目的相关设置
			bf = getRegion();
			defaultRegionId = null; // 默认为null，查询所有区域
			qs = getQs(defaultRegionId);// 楼层、高度、区域
			
		}

		Map<String, DetectOverViewData> ovmMap = new HashMap<String, DetectOverViewData>();
		ovmMap = getOvm(ovm, bf, defaultRegionId); // 获取区域的设备信息
		// 保持排序特性，空调机组，acu计数
		mav.addObject("ovm", ovmMap);
		
		if (itemName != null && "taobao".equalsIgnoreCase(itemName)) { // 判断当前查看的项目是否是淘宝
			// 保持排序特性，空调机组，acu计数
			Map<String, DetectOverViewData> floorMap = new HashMap<String, DetectOverViewData>();
			floorMap = getOvm(floorOvm,
					getRegionFloorInfoByBuildIdAndRegionId(defaultRegionId),
					defaultRegionId); // 获取区域的设备信息
			mav.addObject("floorMap", floorMap);
		} else { // 中国馆项目的相关设置
			mav.addObject("floorMap", ovmMap);
		}

		// 区域展示列表
		HashMap<String, Map<String, List<QueryScheme>>> regEqpMapObj = equipService
				.getEquipRegionMapFix(defaultRegionId);
		try {
			String jsoned = JacksonIgnoreNullWapper
					.writeValueAsString(regEqpMapObj);
			mav.addObject("regEqpMap", jsoned);
		} catch (Exception e) {
			logger.error("区域-设备映射map,序列化json失败：" + e);
			e.printStackTrace();
		}
		// 设备计数
		Map<String, List<QueryScheme>> acuRegion = regEqpMapObj.get("acu");
		for (String key : acuRegion.keySet()) {
			int count = acuRegion.get(key).size();
			for (String ovmRegionId : ovmMap.keySet()) {
				DetectOverViewData dvd = ovmMap.get(ovmRegionId);
				if (dvd.getRegionId().equals(key)) {
					dvd.getCount().put("acu", count);
				}
			}
		}

		// ahu设备
		Map<String, List<QueryScheme>> ahuRegion = regEqpMapObj.get("ahu");
		for (String key : ahuRegion.keySet()) {
			int count = ahuRegion.get(key).size();
			//
			for (String ovmRegionId : ovmMap.keySet()) {
				DetectOverViewData dvd = ovmMap.get(ovmRegionId);
				if (dvd.getRegionId().equals(key)) {
					dvd.getCount().put("ahu", count);
				}
			}
		}

		// fau设备
		Map<String, List<QueryScheme>> fauRegion = regEqpMapObj.get("fau");
		for (String key : fauRegion.keySet()) {
			int count = fauRegion.get(key).size();
			for (String ovmRegionId : ovmMap.keySet()) {
				DetectOverViewData dvd = ovmMap.get(ovmRegionId);
				if (dvd.getRegionId().equals(key)) {
					dvd.getCount().put("fau", count);
				}
			}
		}

		mav.addObject("opened", getOpendDevice());// 设备开启count
		mav.addObject("acus", qs.get("acu"));
		mav.addObject("vavs", qs.get("vav"));
		mav.addObject("faus", qs.get("fau"));
		mav.addObject("ahus", qs.get("ahu"));
		mav.addObject("fcus", qs.get("fcu"));
		mav.addObject("chillers", qs.get("chiller"));
		mav.addObject("cwps", qs.get("cwp"));
		mav.addObject("chwps", qs.get("chwp"));
		mav.addObject("cts", qs.get("ct"));
		mav.addObject("region", bf);

		ServiceReqParam md = new ServiceReqParam();
		mav.addObject("coolStaFans",
				getCurrentDetectOverViewData(md, defaultRegionId));

		mav.setViewName("portlet/holographic/mirrow");

		return mav;
	}

	// 淘宝，切换建筑，调用的方法
	public Map<String, Object> getBuildAndRegionInfo(String buildId,
			String itemName, String defaultRegionId) {
		Map<String, Object> map = new HashMap<String, Object>();

		// Set<Buildregioninfo> bf = new HashSet<Buildregioninfo>();
		// String build_Id = ""; // 计算建筑id
		if (itemName != null && "taobao".equalsIgnoreCase(itemName)) { // 判断当前查看的项目是否是淘宝
			// build_Id = buildId;
			// bf = getRegionByBuildIdAndRegionType(build_Id,
			// Constants.BUILDREGION_BUILD); // 淘宝默认类型为建筑群
		} else { // 中国馆项目的相关设置
			// bf = getRegion();
			defaultRegionId = null; // 默认为null，查询所有区域
		}
		// 楼层、高度、区域
		// getQsForTaoBao(defaultRegionId);

		// Map<String, DetectOverViewData> ovmMap = new HashMap<String,
		// DetectOverViewData>();
		// ovmMap = getOvm(ovm, bf, defaultRegionId); // 获取区域的设备信息
		// 保持排序特性，空调机组，acu计数
		// map.put("ovm", ovmMap);

		// 保持排序特性，空调机组，acu计数
		Map<String, DetectOverViewData> floorMap = new HashMap<String, DetectOverViewData>();
		// 楼层对象
		floorMap = getOvm(null,
				getRegionFloorInfoByBuildIdAndRegionId(defaultRegionId),
				defaultRegionId); // 获取区域的设备信息
		map.put("floorMap", floorMap);
		// 区域展示列表
		// HashMap<String, Map<String, List<QueryScheme>>> regEqpMapObj =
		// equipService
		// .getEquipRegionMapFixForTaoBao(buildId,defaultRegionId);
		// try {
		// String jsoned = JacksonIgnoreNullWapper
		// .writeValueAsString(regEqpMapObj);
		// map.put("regEqpMap", jsoned);
		// map.put("regEqpMapNew", regEqpMapObj);
		// } catch (Exception e) {
		// logger.error("区域-设备映射map,序列化json失败：" + e);
		// e.printStackTrace();
		// }
		// 设备计数
		// Map<String, List<QueryScheme>> acuRegion = regEqpMapObj.get("acu");
		// for (String key : acuRegion.keySet()) {
		// int count = acuRegion.get(key).size();
		// for (String ovmRegionId : ovmMap.keySet()) {
		// DetectOverViewData dvd = ovmMap.get(ovmRegionId);
		// if (dvd.getRegionId().equals(key)) {
		// dvd.getCount().put("acu", count);
		// }
		// }
		// }

		// ahu设备
		// Map<String, List<QueryScheme>> ahuRegion = regEqpMapObj.get("ahu");
		// for (String key : ahuRegion.keySet()) {
		// int count = ahuRegion.get(key).size();
		// //
		// for (String ovmRegionId : ovmMap.keySet()) {
		// DetectOverViewData dvd = ovmMap.get(ovmRegionId);
		// if (dvd.getRegionId().equals(key)) {
		// dvd.getCount().put("ahu", count);
		// }
		// }
		// }

		// fau设备
		// Map<String, List<QueryScheme>> fauRegion = regEqpMapObj.get("fau");
		// for (String key : fauRegion.keySet()) {
		// int count = fauRegion.get(key).size();
		// for (String ovmRegionId : ovmMap.keySet()) {
		// DetectOverViewData dvd = ovmMap.get(ovmRegionId);
		// if (dvd.getRegionId().equals(key)) {
		// dvd.getCount().put("fau", count);
		// }
		// }
		// }

		// map.put("opened", getOpendDevice());// 设备开启count
		// map.put("acus", getQsForTaoBao(defaultRegionId).get("acu"));
		// map.put("vavs", getQsForTaoBao(defaultRegionId).get("vav"));
		// map.put("faus", getQsForTaoBao(defaultRegionId).get("fau"));
		// map.put("ahus", getQsForTaoBao(defaultRegionId).get("ahu"));
		// map.put("fcus", getQsForTaoBao(defaultRegionId).get("fcu"));
		// map.put("chillers", getQsForTaoBao(defaultRegionId).get("chiller"));
		// map.put("cwps", getQsForTaoBao(defaultRegionId).get("cwp"));
		// map.put("chwps", getQsForTaoBao(defaultRegionId).get("chwp"));
		// map.put("cts", getQsForTaoBao(defaultRegionId).get("ct"));
		// map.put("region", bf);
		//
		// ServiceReqParam md = new ServiceReqParam();
		// map.put("coolStaFans",
		// getCurrentDetectOverViewData(md, defaultRegionId));

		return map;
	}

	/**
	 * 区域-设备映射
	 * 
	 * @author allchin modified@2013年8月23日 下午12:32:38
	 * @author zouzhixiang modify 2013-10-22
	 * 
	 * @return
	 * @deprecated
	 */
	public HashMap<String, Map<String, List<QueryScheme>>> getEquipRegionMap(
			String defaultRegionId) {
		if (equipRegionMap == null) {
			equipRegionMap = new HashMap<String, Map<String, List<QueryScheme>>>();
			for (String c : cates) { // 每种设备
				List<QueryScheme> all = getQs(defaultRegionId).get(c); // 获取对应的设备列表
				// 获取区域的设备
				Map<String, List<QueryScheme>> region = new HashMap<String, List<QueryScheme>>();
				for (QueryScheme qs : all) {
					List<QueryScheme> part = region.get(qs.getRegionId());
					if (part == null) {
						part = new LinkedList();
						region.put(qs.getRegionId(), part);
					}
					part.add(qs);
				}
				equipRegionMap.put(c, region);
			}
		}

		return equipRegionMap;
	}

	/**
	 * 淘宝城区域-设备映射
	 * 
	 * @author allchin modified@2013年8月23日 下午12:32:38
	 * @author zouzhixiang modify 2013-10-22
	 * 
	 * @return
	 * @deprecated
	 */
	public HashMap<String, Map<String, List<QueryScheme>>> getEquipRegionMapForTaoBao(
			String buildId, String defaultRegionId) {
		// 区域 -设备列表 映射
		HashMap<String, Map<String, List<QueryScheme>>> map = new HashMap<String, Map<String, List<QueryScheme>>>();
		for (String c : cates) { // 每种设备
			List<QueryScheme> all = getQsForTaoBao(buildId, defaultRegionId)
					.get(c); // 获取对应的设备列表
			// 获取区域的设备
			Map<String, List<QueryScheme>> region = new HashMap<String, List<QueryScheme>>();
			for (QueryScheme qs : all) {
				List<QueryScheme> part = region.get(qs.getRegionId());
				if (part == null) {
					part = new LinkedList();
					region.put(qs.getRegionId(), part);
				}
				part.add(qs);
			}
			map.put(c, region);
		}
		return map;
	}

	public String getBuildId() {
		return servcieSettingHolder.getBuildId();
	}

	public Set<Buildregioninfo> getRegion() {
		if (region == null) {
			region = detectGraphicService.getBuildingRegion(null);
		}
		return region;
	}

	// 获取指定建筑的区域定义信息
	public Set<Buildregioninfo> getRegionByBuildId(String buildId) {
		Set<Buildregioninfo> region = new LinkedHashSet<Buildregioninfo>();
		if (buildId != null && buildId.trim().length() > 0) { // 获取指定建筑的区域信息
			region = detectGraphicService.getBuildingRegion(buildId);
		} else { // 得到建筑物的区域信息，比如楼层数目，
			region = detectGraphicService.getBuildingRegion(null);
		}
		return region;
	}

	// 获取指定建筑的区域定义信息
	public Set<Buildregioninfo> getRegionByBuildIdAndRegionType(String buildId,
			String regionType) {
		Set<Buildregioninfo> region = new LinkedHashSet<Buildregioninfo>();
		if (buildId != null && buildId.trim().length() > 0) { // 获取指定建筑的区域信息
			region = detectGraphicService.getBuildregioninfosByRegionType(
					buildId, regionType);
		} else { // 得到建筑物的区域信息，比如楼层数目，
			region = detectGraphicService.getBuildingRegion(null);
		}
		return region;
	}

	// 根据区域id获取指定区域的楼层信息
	public Set<Buildregioninfo> getRegionFloorInfoByBuildIdAndRegionId(
			String regionId) {
		Set<Buildregioninfo> region = new LinkedHashSet<Buildregioninfo>();
		if (regionId != null && regionId.trim().length() > 0) { // 获取指定建筑的区域信息
			region = detectGraphicService
					.getRegionFloorInfoByBuildIdAndRegionId(regionId);
		} else { // 得到建筑物的区域信息，比如楼层数目，
			region = detectGraphicService.getBuildingRegion(null);
		}
		return region;
	}

	/**
	 * 得到设备列表
	 * 
	 * @author allchin modified@2013年8月21日 上午10:17:56
	 * @return
	 */
	public HashMap<String, List<QueryScheme>> getQs(String defaultRegionId) {
		if (qs == null) {

			qs = new HashMap();
			for (String c : cates) {
				List<QueryScheme> vavs = equipService.getEquipments(
						getBuildId(), defaultRegionId, c);
				qs.put(c, vavs);
			}

		}
		return qs;
	}

	/**
	 * 得到设备列表
	 * 
	 * @author zouzhixiang 2013-10-24
	 * @return
	 */
	public Map<String, List<QueryScheme>> getQsForTaoBao(String buildId,
			String regionId) {
		// 设备map
		Map<String, List<QueryScheme>> devices = new HashMap<String, List<QueryScheme>>();
		for (String c : cates) {
			List<QueryScheme> vavs = equipService.getEquipments(buildId,
					regionId, c);
			devices.put(c, vavs);
		}
		return devices;
	}

	/**
	 * 得到设备列表
	 * 
	 * @author zouzhixiang 2013-11-01
	 * @return
	 */
	public Map<String, List<QueryScheme>> getDevicesForTaoBao(String buildId,
			String regionId, String devs) {
		// 设备map
		Map<String, List<QueryScheme>> devices = new HashMap<String, List<QueryScheme>>();
		String[] ds = devs.split(",");
		for (String c : ds) {
			List<QueryScheme> vavs = equipService.getEquipments(buildId,
					regionId, c);
			devices.put(c, vavs);
		}
		return devices;
	}

	/**
	 * 设备监测首页冷战，与排送风机
	 * 
	 * @author allchin modified
	 * @2013年8月21日 下午3:44:07
	 * @return
	 */
	public HashMap<String, Integer> getCurrentDetectOverViewData(
			ServiceReqParam md, String defaultRegionId) {
		md.setType("span");
		md.setTto(servcieSettingHolder.getCurrentDate());

		HashMap<String, Integer> t = new HashMap<String, Integer>();

		// 送风机开启台数
		try {
			// 获取sf的设备信息
			t.put("sfC", getQs(defaultRegionId).get("sf").size());
			// 设置 对应的 name和id
			md.setName("number_on");
			md.setId("sf");
			Double[] sf = remoteServiceInvoker.invokeValueToArray(md);
			// 送风机开启信息
			t.put("sfOpen", sf[0].intValue());
		} catch (Exception e) {
			logger.error("获取送风机开启台数失败：" + e);
		}

		// 排风机
		try {
			t.put("efC", getQs(defaultRegionId).get("ef").size());
			// 设置配风机的相关信息
			md.setId("ef");
			Double[] ef = remoteServiceInvoker.invokeValueToArray(md);
			t.put("efOpen", ef[0].intValue());
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 冷却泵
		try {
			t.put("cwpC", getQs(defaultRegionId).get("cwp").size());
			// 设置冷却泵的相关信息
			md.setId("cwp");
			Double[] cwp = remoteServiceInvoker.invokeValueToArray(md);
			t.put("cwpOpen", cwp[0].intValue());
		} catch (Exception e) {
			e.printStackTrace();
		}

		//
		try {
			t.put("chwpC", getQs(defaultRegionId).get("chwp").size());
			//
			md.setId("chwp");
			Double[] chwp = remoteServiceInvoker.invokeValueToArray(md);
			t.put("chwpOpen", chwp[0].intValue());

		} catch (Exception e) {
			e.printStackTrace();
		}

		// 冷机
		try {
			t.put("chillerC", getQs(defaultRegionId).get("chiller").size());
			// 设置冷机的相关信息
			md.setId("chiller");
			Double[] chiller = remoteServiceInvoker.invokeValueToArray(md);
			t.put("chillerOpen", chiller[0].intValue());
			//

		} catch (Exception e) {
			e.printStackTrace();
		}

		// 冷机供水温度
		try {
			md.setName("LJYK_DDC_2_CHWP_CCHWS_T");
			md.setId("chiller");
			Double[] cst = remoteServiceInvoker.invokeValueToArray(md);
			t.put("chillerSplWatTemp", cst[0].intValue());
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 冷机回水温度
		try {
			md.setName("LJYK_DDC_2_CHWP_CCHWR_T");
			Double[] crt = remoteServiceInvoker.invokeValueToArray(md);
			t.put("chillerRtnWatTemp", crt[0].intValue());
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 水系统-国家馆
		try {
			md.setId("chiller"); 
			md.setName("S7_temp_display_Ti7");
			Double[] wsSt = remoteServiceInvoker.invokeValueToArray(md);
			t.put("wsSplWatTemp", wsSt[0].intValue());
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 国家馆水系统冷冻水回水温度
		try {
			md.setName("S7_temp_display_Ti11");
			Double[] wsRt = remoteServiceInvoker.invokeValueToArray(md);
			t.put("wsRtnWatTemp", wsRt[0].intValue());
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 水系统流量
		try {
			md.setName("flow");
			md.setId("chws");
			md.setType("span");
			Double[] wsVolumn = remoteServiceInvoker.invokeValueToArray(md);
			t.put("wsVolumn", wsVolumn[wsVolumn.length - 1].intValue());
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 冷却塔
		try {
			t.put("ctC", getQs(defaultRegionId).get("ct").size());
			md.setId("ct");
			md.setName("number_on");
			Double[] ct = remoteServiceInvoker.invokeValueToArray(md);
			t.put("ctOpen", ct[0].intValue());
		} catch (Exception e) {
			e.printStackTrace();
		}
		t.put("ctSplWatTemp", 0);
		t.put("ctRtnWatTemp", 0);
		return t;
	}

	/**
	 * 设备总量，总数统计，分区域统计
	 * 
	 * @author allchin modified@2013年8月21日 上午10:17:51
	 * @author zouzhixiang modify 2013-10-22
	 * 
	 * @param buildregioninfos
	 * @param defaultRegionId
	 * @return
	 */
	public LinkedHashMap<String, DetectOverViewData> getOvm(
			LinkedHashMap<String, DetectOverViewData> ovm,
			Set<Buildregioninfo> buildregioninfos, String defaultRegionId) {
		if (ovm == null) {
			ovm = new LinkedHashMap();
			// 设备总量，总数统计ovm.regionId.count.vav
			for (String c : cates) {
				// List<QueryScheme> list = getQs(defaultRegionId).get(c);
				// 从设备列表中分类统计设备，形成统计结果，按照区域id存放到map结构中
				// if (list == null) {
				// break;
				// }
				// using regions to init the map order
				for (Buildregioninfo bi : buildregioninfos) {
					String regionId = bi.getRegionId();
					DetectOverViewData dvd = ovm.get(regionId);
					if (dvd == null) {
						dvd = new DetectOverViewData();
						dvd.setRegionId(regionId);
						ovm.put(regionId, dvd);
					}
				}
				// 所有同类型设备,设备列表是乱序的
				// for (QueryScheme s : list) {
				// String regionId = s.getRegionId();
				// String type = s.getCategoryId();
				// //
				// DetectOverViewData dvd = ovm.get(regionId);
				// if (dvd == null) {
				// dvd = new DetectOverViewData();
				// dvd.setRegionId(regionId);
				// ovm.put(regionId, dvd);
				// }
				// // counts
				// Integer count = dvd.getCount().get(type);
				// count = count == null ? 1 : (count + 1);
				// dvd.getCount().put(type, count);
				// }
			}
			// 更新建筑名称
			for (Buildregioninfo bf : buildregioninfos) {// zzx修改已2013-10-22
				for (String regionId : ovm.keySet()) {
					String bfRegionId = bf.getRegionId();
					if (regionId.equals(bfRegionId)) {
						ovm.get(regionId).setRegionName(bf.getRegionName());
					}
				}
			}
			ovm.remove("");
		}
		return ovm;
	}

}
