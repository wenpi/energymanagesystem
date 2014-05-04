package com.managementsystem.energy.portlet.holographic.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.managementsystem.energy.dao.BuildregioninfoDao;
import com.managementsystem.energy.dao.QuerySchemeDao;
import com.managementsystem.energy.domain.Buildregioninfo;
import com.managementsystem.energy.domain.QueryScheme;
import com.managementsystem.energy.portlet.highcharts.supports.Series;
import com.managementsystem.energy.portlet.holographic.constants.ServiceNames;
import com.managementsystem.energy.portlet.holographic.vo.ServcieSettingHolder;
import com.managementsystem.energy.portlet.holographic.vo.ServiceReqParam;
import com.managementsystem.energy.portlet.holographic.vo.ServiceRtn;

/**
 * 设备监测数据服务
 * 
 * @author allchin modified
 * @2013年8月19日 上午10:49:01
 */
@Service
@Transactional
public class DetectGraphicService {
	private Logger logger = Logger.getLogger(DetectGraphicService.class);
	@Autowired
	private RemoteServiceInvoker remoteServiceInvoker;

	@Autowired
	private BuildregioninfoDao buildregioninfoDao;

	@Autowired
	private HoloMainPageService holoMainPageService;

	@Autowired
	private QuerySchemeDao querySchemeDao;
	@Autowired
	private ServcieSettingHolder servcieSettingHolder;

	/**
	 * TODO 空调机组 -VAV
	 * 
	 * @author allchin modified@2013年8月19日 上午10:44:48
	 * @param md
	 * @return
	 */
	public Map getDetectVAVData(ServiceReqParam md) {
		Map resultMap = new HashMap();
		//
		md.setIspd("2");
		md.setName(ServiceNames.vavState);
		resultMap
				.put("status_vav", remoteServiceInvoker.invokeValueToArray(md));

		//
		md.setIspd("1");
		md.setName(ServiceNames.vavSplWindTemp);
		resultMap.put("t_supply_vav",
				remoteServiceInvoker.invokeValueToArray(md));

		md.setName(ServiceNames.vavRtnWindTemp);
		resultMap.put("t_return_vav",
				remoteServiceInvoker.invokeValueToArray(md));
		//
		resultMap.put("cate", requestForCate(md));

		Double[] stopState = (Double[]) resultMap.get("status_vav");
		Integer[][] states = devertState(stopState);

		resultMap.put("stops", states[1]);
		resultMap.put("opens", states[0]);
		return resultMap;

	}

	/**
	 * 空调机组 -FCU
	 * 
	 * @author allchin modified@2013年8月19日 上午10:39:01
	 * @param md
	 * @return
	 */
	public Map getDetectFCUData(ServiceReqParam md) {
		Map resultMap = new HashMap();
		//
		md.setIspd("2");
		md.setName(ServiceNames.fcuState);
		resultMap
				.put("status_fcu", remoteServiceInvoker.invokeValueToArray(md));
		//
		md.setIspd("1");
		md.setName(ServiceNames.fcuSplWindTemp);
		resultMap.put("t_supply_fcu",
				remoteServiceInvoker.invokeValueToArray(md));

		md.setName(ServiceNames.fcuRtnWindTemp);
		resultMap.put("t_return_fcu",
				remoteServiceInvoker.invokeValueToArray(md));
		//
		resultMap.put("cate", requestForCate(md));
		Double[] stopState = (Double[]) resultMap.get("t_supply_fcu");

		Integer[][] states = devertState(stopState);

		resultMap.put("stops", states[1]);
		resultMap.put("opens", states[0]);
		return resultMap;

	}

	/**
	 * 空调机组 -FAU数据
	 * 
	 * @author allchin modified@2013年8月19日 上午10:35:11
	 * @param md
	 * @return
	 */
	public Map getDetectFAUData(ServiceReqParam md) {
		Map resultMap = new HashMap();

		md.setIspd("2");
		md.setName(ServiceNames.ahuState);
		Double[] sSupplyTemp = remoteServiceInvoker.invokeValueToArray(md);
		resultMap.put("status_sf", sSupplyTemp);

		md.setIspd("1");
		md.setName(ServiceNames.fauSplWindTemp);
		resultMap.put("t_supply_fahu",
				remoteServiceInvoker.invokeValueToArray(md));
		//
		// resultMap.put("cate", requestForCate(md));
		resultMap
				.put("cataList", remoteServiceInvoker.getValueList(md, "time")); // 求X轴数据
		//

		// md.setName(ServiceNames.fauSplWindHumidity);
		// resultMap.put("humidity_supply_fahu",
		// remoteServiceInvoker.invokeValueToArray( md));
		//

		Double[] stopState = (Double[]) resultMap.get("status_sf");

		Integer[] opens = statesToInts(stopState, null);

		resultMap.put("opens", opens);
		return resultMap;
	}

	/**
	 * 做一次查请求，然后获取cate信息
	 * 
	 * @author allchin modified@2013年8月13日 下午1:45:32
	 * @param md
	 * @return
	 */
	public String[] requestForCate(ServiceReqParam md) {
		ServiceRtn[] sr = remoteServiceInvoker.invokeToArray(md,
				ServiceRtn.class);
		String[] cate = new String[sr.length];
		for (int j = 0; j < sr.length; j++) {
			cate[j] = sr[j].getCate(md);
		}
		return cate;
	}

	/**
	 * TODO 风扇启停状态
	 * 
	 * @author allchin modified@2013年8月12日 下午5:33:17
	 * @param md
	 * @return
	 */
	public Map getFanStateDate(ServiceReqParam md) {
		Map result = new HashMap();

		// 首先获取所有送风机
		// for each
		md.setIspd("2");
		md.setName(ServiceNames.fanState);
		Double[] supplyFan = remoteServiceInvoker.invokeValueToArray(md);

		// 获取所有排风机
		// for each
		md.setName(ServiceNames.exhuastFan);
		Double[] exhauseFan = remoteServiceInvoker.invokeValueToArray(md);
		//
		result.put("cate", requestForCate(md));

		return result;
	}

	/**
	 * 所有的有开启频率的冷却塔设备
	 * 
	 * @author zouzhixiang modify 2013-10-22
	 * @param md
	 * @param defaultRegionId
	 * @return
	 */
	public List<QueryScheme> getTowers(ServiceReqParam md,
			String defaultRegionId) {
		List<QueryScheme> result = new ArrayList<QueryScheme>();
		List<QueryScheme> equipList = holoMainPageService
				.getQs(defaultRegionId).get("ct");
		for (int i = 0; i < equipList.size(); i++) {
			//
			String cms = equipList.get(i).getComments();
			if (cms != null && cms.indexOf("启停状态") != -1) { //
				result.add(equipList.get(i));
			}
		}
		return result;
	}

	/**
	 * TODO 获取冷却塔数据
	 * 
	 * @author allchin modified@2013年8月15日 下午8:08:17
	 * @author zouzhixiang modify 2013-10-22
	 * 
	 * @param md
	 * @return
	 */
	public Map getCoolingTowerData(ServiceReqParam md, String defaultRegionId) {
		Map result = new LinkedHashMap();
		// 开关状态
		Map stateMap = new LinkedHashMap();

		// 得到所有冷却塔id
		List<QueryScheme> equipList = getTowers(md, defaultRegionId);

		Series[] ss = new Series[equipList.size()];
		//
		for (int i = 0; i < equipList.size(); i++) {
			String Comments = equipList.get(i).getComments();
			String pump = equipList.get(i).getName();
			// 请求开关状态
			md.setId("chiller");
			md.setName(pump);
			md.setIspd("2");

			Double[] states = remoteServiceInvoker.invokeValueToArray(md);
			Integer[] opens = DetectGraphicService.statesToInts(states, null);
			stateMap.put(Comments, opens);

//			Double[][] data = new Double[2][];
			// cate
			if (result.get("cate") == null) {
				// result.put("cate", requestForCate(md));
				result.put("cate",
						remoteServiceInvoker.getValueList(md, "time"));
			}

			// TODO 是做成启停频率还是冷却水参数??
			// 请求供水温度
//			md.setName(ServiceNames.towerSupplyWaterTemp);
//			md.setEquip(pump);
//			md.setIspd("1");
//			Double[] supply = remoteServiceInvoker.invokeValueToArray(md);
//			data[0] = supply;
//			 //回水温度
//			md.setName(ServiceNames.towerRtnWaterTemp);
//			Double[] rtnTemp = remoteServiceInvoker.invokeValueToArray(md);
//			data[1] = rtnTemp;
//			//
//			ss[i] = new Series();
//			ss[i].setData(data);

		}
		//

		result.put("stateMap", stateMap);
//		result.put("series", ss);
		//

		return result;
	}

	/**
	 * 得到冷却泵页面数据
	 * 
	 * @author allchin modified@2013年8月15日 下午2:50:33
	 * @param md
	 * @return
	 */
	public Map getDetectCoolingPumpData(ServiceReqParam md,
			List<QueryScheme> equipList) {
		Map result = new LinkedHashMap();
		//

		Map stateMap = new LinkedHashMap();
		// 启停频率，中国馆没有
		Series[] ss = new Series[equipList.size()];

		// 开关状态
		for (int i = 0; i < equipList.size(); i++) {
			QueryScheme qs = equipList.get(i);
			// 过滤不是冷却泵的设备
			if (qs.getComments().indexOf("冷却泵") == -1) {
				logger.info(qs.getComments() + "不是冷却泵，已过滤");
				continue;
			}
			// 开关状态
			md.setName(qs.getName());
			md.setId(qs.getId());
			md.setIspd("2");

			Double[] states = remoteServiceInvoker.invokeValueToArray(md);
			Integer[] opens = DetectGraphicService.statesToInts(states, null);
			stateMap.put(qs.getComments(), opens);

			// cate
			if (result.get("cate") == null) {
				result.put("cate",
						remoteServiceInvoker.getValueList(md, "time"));
			}

		}
		result.put("stateMap", stateMap);
		result.put("series", ss);

		return result;

	}

	/**
	 * 得到冷冻泵页面数据
	 * 
	 * @author allchin modified@2013年8月15日 下午2:50:33
	 * @param md
	 * @return
	 */
	public Map getDetectSealmPumpData(ServiceReqParam md,
			List<QueryScheme> equipList) {
		Map result = new LinkedHashMap();
		//

		Map stateMap = new LinkedHashMap();
		// 启停频率，中国馆没有
		Series[] ss = new Series[equipList.size()];

		// 开关状态
		for (int i = 0; i < equipList.size(); i++) {
			QueryScheme qs = equipList.get(i);
			// 过滤不是冷冻泵的设备
			if (qs.getComments().indexOf("冷冻泵") == -1) {
				logger.info(qs.getComments() + "不是冷冻泵，已过滤");
				continue;
			}
			// 开关状态
			md.setName(qs.getName());
			md.setId(qs.getId());
			md.setIspd("2");

			Double[] states = remoteServiceInvoker.invokeValueToArray(md);
			Integer[] opens = DetectGraphicService.statesToInts(states, null);
			stateMap.put(qs.getComments(), opens);

			// cate
			if (result.get("cate") == null) {
				// result.put("cate", requestForCate(md));
				result.put("cate",
						remoteServiceInvoker.getValueList(md, "time"));
			}

		}
		result.put("stateMap", stateMap);
		result.put("series", ss);

		return result;

	}

	/**
	 * 水系统页面数据
	 * 
	 * @author allchin modified@2013年8月12日 下午3:22:59
	 * @param md
	 * @return
	 */
	public Map getWaterSystemData(ServiceReqParam md) {
		Map result = new HashMap();

		// 地区馆水系统冷冻水供水温度S7_temp_display_Ti7
		md.setName("S7_temp_display_Ti7");
		Double[] S7_temp_display_Ti7=remoteServiceInvoker.invokeValueToArray(md);
		result.put("S7_temp_display_Ti7", S7_temp_display_Ti7);

		// 地区馆水系统冷冻水回水温度 S7_temp_display_Ti12
		md.setName("S7_temp_display_Ti12");
		Double[] S7_temp_display_Ti12=remoteServiceInvoker.invokeValueToArray(md);
		result.put("S7_temp_display_Ti12", S7_temp_display_Ti12);

		// 地区馆水系统冷冻水流量 S7_flow_display_Fi3
		md.setName("S7_flow_display_Fi3");
		md.setIspd("2");
		Double[] S7_flow_display_Fi3=remoteServiceInvoker.invokeValueToArray(md);
		result.put("S7_flow_display_Fi3", S7_flow_display_Fi3);

		// 国家馆水系统冷冻水供水温度 S7_temp_display_Ti7

		// 国家馆水系统冷冻水回水温度 S7_temp_display_Ti11
		md.setIspd(null);
		md.setName("S7_temp_display_Ti11");
		Double[] S7_temp_display_Ti11=remoteServiceInvoker.invokeValueToArray(md);
		result.put("S7_temp_display_Ti11", S7_temp_display_Ti11);

		// 国家馆水系统冷冻水流量 S7_flow_display_Fi4
		md.setName("S7_flow_display_Fi4");
		md.setIspd("2");
		Double[] S7_flow_display_Fi4=remoteServiceInvoker.invokeValueToArray(md);
		result.put("S7_flow_display_Fi4", S7_flow_display_Fi4);

		// 国家馆水系统冷冻水流量 S7_temp_display_Ti7

		// 办公区水系统冷冻水回水温度S7_temp_display_Ti10
		md.setName("S7_temp_display_Ti10");
		md.setIspd(null);
		Double[] S7_temp_display_Ti10=remoteServiceInvoker.invokeValueToArray(md);
		result.put("S7_temp_display_Ti10", S7_temp_display_Ti10);
		// 办公区水系统冷冻水流量S7_flow_display_Fi5
		md.setName("S7_flow_display_Fi5");
		md.setIspd("2");
		Double[] S7_flow_display_Fi5=remoteServiceInvoker.invokeValueToArray(md);
		result.put("S7_flow_display_Fi5", S7_flow_display_Fi5);

		result.put("cataList", remoteServiceInvoker.getValueList(md, "time")); // 求X轴数据

		return result;
	}

	/**
	 * 直接以name为结果map主键值，数据数组为值，插入到resultmap中, 其它查询参数使用ServiceReqParam <br>
	 * 当你需要Double[]数组结果的时候，你可以使用这方法。
	 * 
	 * <br>
	 * 还会插入cate的值，即页面x轴的标刻
	 * 
	 * @author allchin modified@2013年8月12日 下午3:28:11
	 * @param md
	 * @param name
	 * @param resultMap
	 * @deprecated
	 */
	public void invokeValueArrayToMap(ServiceReqParam md, Map resultMap,
			String... nameAndKeys) {
		int maxCount = 0;
		for (String name : nameAndKeys) {
			try {
				md.setName(name);
				Double[] values = remoteServiceInvoker.invokeValueToArray(md);
				resultMap.put(name, values);
				//

				// 每次都以返回结果最多的请求头，作为cate查询来源
				if (maxCount < values.length) {
					maxCount = values.length;
					resultMap.put("cate", requestForCate(md));
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

	/**
	 * 反转状态，同时生成原状态的整形集合， 反转后的整形集合, 无值的部分用null代替，便于highchart输出
	 * 
	 * @author allchin modified@2013年8月14日 下午3:42:08
	 * @param stopState
	 * @param opens
	 * @return
	 * @deprecated 复杂性+1
	 */
	public static Integer[][] devertState(final Double[] stopState) {
		if (stopState != null) {
			Integer[][] result = new Integer[2][stopState.length];
			result[0] = statesToInts(stopState, null);
			result[1] = devertState(result[0]);
			return result;
		}
		return null;
	}

	/**
	 * 将状态转变为整形值, 测试数据的状态可能是随机数
	 * 
	 * @author allchin modified@2013年8月15日 下午3:27:52
	 * @param stopState
	 * @param stopMark
	 *            关闭状态是0 还是null
	 * @return
	 */
	public static Integer[] statesToInts(final Double[] stopState,
			Integer stopMark) {
		Integer[] result = new Integer[stopState.length];
		// 转换成为页面需要的格式
		for (int i = 0; i < stopState.length; i++) {
			if (stopState[i] == null) {
				result[i] = stopMark;
			} else {
				int val = 0;
				if (stopState[i] > 0) {
					val = 1;
				}

				if (val == 1) {
					result[i] = 1;
				} else {
					result[i] = stopMark;
				}
			}

		}
		return result;
	}

	/**
	 * 反转状态，用以hichart图标输出
	 * 
	 * @author allchin modified@2013年8月13日 下午5:21:04
	 * @param opens
	 * @return
	 */
	public static Integer[] devertState(final Integer[] opens) {
		Integer[] stops = new Integer[opens.length];
		// 赋值
		for (int i = 0; i < stops.length; i++) {
			Integer val = opens[i];
			if (val != null && val == 1) {
				stops[i] = null;
			} else {
				stops[i] = 1;
			}
		}
		// 左扩展
		for (int j = 1; j < stops.length; j++) {
			if (stops[j] != null && stops[j] == 1) {
				if (stops[j] != stops[j - 1]) {
					stops[j - 1] = stops[j];
				}
			}
		}
		// 右扩展
		for (int k = 0; k < stops.length - 1; k++) {
			if (stops[k] != null && stops[k] == 1) {
				if (stops[k] != stops[k + 1]) {
					stops[k + 1] = stops[k];
					k++;
				}
			}
		}
		return stops;
	}

	/**
	 * 冷机启停状态页面
	 * 
	 * @author allchin modified@2013年8月12日 下午2:57:51
	 * @param md
	 * @return
	 */
	public Map getCoolingMachingData(ServiceReqParam md) {
		Map result = new HashMap();
		// 启停状态
		md.setIspd("2");
		// 冷机>冷机启停状态的数值数据
		Double[] stopState=remoteServiceInvoker.invokeValueToArray( md);
		
		Integer[] opens= statesToInts(stopState, null);
		  
		result.put("opens", opens); 

		// 冷机>冷却水供水温度
		md.setIspd("1");
		md.setName(ServiceNames.coolMachineCoolSplWaterTemp);
		Double[] cSupplyTemp=remoteServiceInvoker.invokeValueToArray( md);
		result.put("cSupplyTemp", cSupplyTemp); 

		// 冷机>冷却水回水温度
		md.setName(ServiceNames.coolMachineCoolRtnWaterTemp);
		Double[] cRtnTemp=remoteServiceInvoker.invokeValueToArray( md);
		result.put("cRtnTemp", cRtnTemp); 
		
		// 冷机>冷冻水供水温度
		md.setName(ServiceNames.coolMachineSealmSplWaterTemp);
		Double[] sSupplyTemp=remoteServiceInvoker.invokeValueToArray( md);
		result.put("sSupplyTemp", sSupplyTemp); 

		// 冷机>冻水回水温度
		md.setName(ServiceNames.coolMachineSealmRtnWaterTemp);
		Double[] sRtnTemp=remoteServiceInvoker.invokeValueToArray( md);
		result.put("sRtnTemp", sRtnTemp); 
		
		result.put("cataList", remoteServiceInvoker.getValueList(md, "time")); // 求X轴数据
		return result;
	}

	/**
	 * 得到建筑物的区域信息，比如楼层数目，
	 * 
	 * @author allchin modified@2013年8月16日 上午9:07:42
	 * @param string
	 *            buildId
	 * @return <层名，层值>
	 */
	public Set<Buildregioninfo> getBuildingRegion(String buildId) {
		return buildregioninfoDao.getBuildregioninfos(buildId, 0,
				Integer.MAX_VALUE);
	}

	/**
	 * 得到建筑物的区域信息，比如楼层数目，
	 * 
	 * @author allchin modified@2013年8月16日 上午9:07:42
	 * @author zouzhixiang modify 2013-10-24
	 * 
	 * @param buildId
	 * @param regionType
	 * @return
	 */
	public Set<Buildregioninfo> getBuildregioninfosByRegionType(String buildId,
			String regionType) {
		Set<Buildregioninfo> returnSet = new LinkedHashSet<Buildregioninfo>();

		// 使用hibernate的Criteria查询出满足条件的建筑信息
		Criteria ct = querySchemeDao.createCriteria(Buildregioninfo.class);
		ct.add(Restrictions.eq("buildinfo.buildId", buildId)); // 建筑id限制
		ct.add(Restrictions.eq("regionType", regionType)); // 区域类型
		ct.addOrder(Order.asc("regionId"));// 根据区域id升序排列
		// 循环查询出来的list，重新放置在Set集合中，这样可以防止出现排序问题
		// new LinkedHashSet<Buildregioninfo>(ct.list())这样写，会出现顺序不对问题
		returnSet.addAll(ct.list());
		return returnSet;
		// return buildregioninfoDao.getBuildregioninfosByRegionType(buildId,
		// regionType, 0, Integer.MAX_VALUE);
	}

	/**
	 * 得到建筑物的区域信息，比如楼层数目，
	 * 
	 * @author zouzhixiang create to 2013-10-24
	 * 
	 * @param regionid
	 * @return
	 */
	public Set<Buildregioninfo> getRegionFloorInfoByBuildIdAndRegionId(
			String regionid) {
		return buildregioninfoDao.getBuildregioninfosByParentId(regionid);
	}

	/**
	 * 得到建筑所有type类型设备
	 * 
	 * @author allchin modified@2013年8月19日 下午8:50:58
	 * @param buildId
	 * @return
	 */
	public List<QueryScheme> getEquipments(String buildId, String type) {
		//
		StringBuffer sb = new StringBuffer();
		Set<Buildregioninfo> set = getBuildingRegion(buildId);

		for (Buildregioninfo qs : set) {
			if (sb.toString().length() == 0) {
				sb.append("(" + qs.getRegionId());
			} else {
				sb.append("," + qs.getRegionId());
			}

		}
		sb.append(")");

		//
		String typeSql = type == null ? "" : " category_id='" + type + "' and";
		//
		String sql = "select * from queryscheme where" + typeSql
				+ " region_id in" + sb.toString();

		return querySchemeDao.createSQLQuery(sql).addEntity(QueryScheme.class)
				.list();

	}

	/**
	 * 空调机组 -AHU
	 * 
	 * @author allchin modified@2013年8月16日 下午5:21:05
	 * @param md
	 * @return
	 */
	public Map getDetectAHUData(ServiceReqParam md) {
		Map resultMap = new HashMap();

		md.setIspd("2");
		md.setName(ServiceNames.ahuState);
		Double[] sSupplyTemp = remoteServiceInvoker.invokeValueToArray(md);
		resultMap.put("status_sf", sSupplyTemp);
		//
		md.setIspd("1");
		md.setName(ServiceNames.ahuSplWindTemp);
		Double[] t_sa = remoteServiceInvoker.invokeValueToArray(md);
		resultMap.put("t_sa", t_sa);
		//
		md.setName(ServiceNames.ahuRtnWindTemp);
		Double[] t_ra = remoteServiceInvoker.invokeValueToArray(md);
		resultMap.put("t_ra", t_ra);
		//
		md.setName(ServiceNames.ahuRtnHumility);
		Double[] rh_ra = remoteServiceInvoker.invokeValueToArray(md);
		resultMap.put("rh_ra", rh_ra);

		//
		// resultMap.put("cate", requestForCate(md));
		resultMap
				.put("cataList", remoteServiceInvoker.getValueList(md, "time")); // 求X轴数据

		// /zzzzzzzzzzzzzzzzzz

		try {
			Double[] stopState = (Double[]) resultMap.get("status_sf");
			Integer[][] states = devertState(stopState);

			resultMap.put("stops", states[1]);
			resultMap.put("opens", states[0]);
		} catch (Exception e) {
			logger.error("解析AHU开关状态异常：" + e);

		}
		return resultMap;
	}

	/**
	 * ACU数据
	 * 
	 * @author allchin modified@2013年8月20日 下午2:21:54
	 * @param md
	 * @return
	 */
	public Map getDetectACUData(ServiceReqParam md) {
		Map resultMap = new HashMap();

		md.setIspd("2");
		md.setName(ServiceNames.acuState);
		Double[] sSupplyTemp = remoteServiceInvoker.invokeValueToArray(md);
		resultMap.put("status_sf", sSupplyTemp);
		//
		md.setIspd("1");
		md.setName(ServiceNames.acuSupplyWindTemp);
		Double[] t_sa = remoteServiceInvoker.invokeValueToArray(md);
		resultMap.put("t_supply_acu", t_sa);
		//
		md.setName(ServiceNames.acuSupplyHumidity);
		Double[] t_ra = remoteServiceInvoker.invokeValueToArray(md);
		resultMap.put("acuSupplyHumidity", t_ra);

		//
		// resultMap.put("cate", requestForCate(md));
		resultMap
				.put("cataList", remoteServiceInvoker.getValueList(md, "time")); // 求X轴数据

		try {
			Double[] stopState = (Double[]) resultMap.get("status_sf");
			Integer[][] states = devertState(stopState);

			resultMap.put("stops", states[1]);
			resultMap.put("opens", states[0]);
		} catch (Exception e) {
			logger.error("解析ACU开关状态异常：" + e);

		}
		return resultMap;
	}

}
