package com.managementsystem.energy.portlet.holographic.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.managementsystem.energy.domain.Buildregioninfo;
import com.managementsystem.energy.portlet.highcharts.ConfigFormat;
import com.managementsystem.energy.portlet.highcharts.constants.CategoriesConstants;
import com.managementsystem.energy.portlet.holographic.MirrowConstants;
import com.managementsystem.energy.portlet.holographic.constants.ServiceNames;
import com.managementsystem.energy.portlet.holographic.vo.HoloData;
import com.managementsystem.energy.portlet.holographic.vo.MirrowData;
import com.managementsystem.energy.portlet.holographic.vo.ServiceReqParam;
import com.managementsystem.energy.portlet.holographic.vo.ServiceRtn;

/**
 * 全息图细节业务逻辑类
 * 
 * @author allchin modified@2013年8月7日 上午10:41:49
 */
@Service
@Transactional
public class MirrowGraphicServiceImpl implements MirrowGraphicService {

	private Logger logger = Logger.getLogger(RemoteServiceInvoker.class);
	@Autowired
	private RemoteServiceInvoker remoteServiceInvoker;

	@Autowired
	private DetectGraphicService detectGraphicService;

	/**
	 * TODO 填充数据
	 * 
	 * @author allchin modified@2013年8月5日 下午2:32:52
	 * @param md
	 * @return
	 */
	public static void fillCatagories(String type, ConfigFormat cf) {
		if ("month".equals(type)) {
			cf.xAxis.categories = CategoriesConstants.getMonthCategories();
		}

	}

	/**
	 * 初始化默认值
	 * 
	 * @author allchin modified@2013年8月5日 下午3:33:39
	 * @param md
	 */
	private void initMirrowDataDefaultValues(MirrowData md) {
		ConfigFormat innerTemp = md.getTemp() == null ? new ConfigFormat() : md
				.getTemp();
		md.setTemp(innerTemp);

		ConfigFormat outdoorTemp = md.getCost() == null ? new ConfigFormat()
				: md.getCost();
		md.setCost(outdoorTemp);

	}

	/**
	 * TODO 空调设备计数
	 * 
	 * @author allchin modified@2013年8月8日 下午5:01:58
	 * @param md
	 */
	public void fillAirEquipmentData(MirrowData md) {
		// //空调设备列表
		String name = "number_total_fcu," // FCU台数
				+ "number_total_vav,"// vav台数
				+ "number_total_ahu,"// ahu台数
				+ "number_total_fahu" // fau台数
		;
		md.setName(name);
		md.setType(null);
		Double[] equips = remoteServiceInvoker.invokeValueToArray(md);

		Map<String, String> map = md.getAirConditions();
		map.put("AHU-1", equips[2].intValue() + "");
		map.put("FCU-1", equips[0].intValue() + "");
		map.put("FAU-1", equips[3].intValue() + "");
		map.put("VAV-1", equips[1].intValue() + "");

	}

	/**
	 * 填充数据
	 * 
	 * @author allchin modified@2013年8月5日 下午3:40:02
	 * @param md
	 * @return
	 * @throws IOException
	 * @throws JsonMappingException
	 * @throws JsonParseException
	 */
	@Transactional(readOnly = true)
	public MirrowData fillHoloDetailData(MirrowData md)
			throws JsonParseException, JsonMappingException, IOException {
		//
		initMirrowDataDefaultValues(md);

		// fillCatagories(md.getType(), md.getTemp());
		// fillCatagories(md.getType(), md.getCost());

		// 当月耗电量
		md.setName("electricity");
		md.setAttribute("sum");
		md.setIspd("0");
		md.setId(md.getFloor().toLowerCase());
		Double[] outT = remoteServiceInvoker.invokeValueToArray(md);
		md.setAvgOutdoorTemp(outT[0] + "");
		// model.put("cate", remoteServiceInvoker.getValueList(md, "time"));

		//

		// 耗冷量，耗电量
		// 一段时间内室内外温度

		// 耗电量图
		md.setAttribute(null);
		md.setName("electricity");
		md.setIspd("0");
		md.setId(md.getFloor().toLowerCase());
		Double[] eleCost = remoteServiceInvoker.invokeValueToArray(md);
		md.getCost().getSeries()[1].setData(eleCost);

		md.setCataList(remoteServiceInvoker.getValueList(md, "time")); // 设置X轴的信息 
		// 室内温度图

		md.setName("t");
		md.setId(md.getFloor().toLowerCase());
		md.setIspd("3");
		Double[] innerTemp = remoteServiceInvoker.invokeValueToArray(md);
		md.getTemp().series[1].setData(innerTemp);

		// // 当 米平均温度
		// calc the avg temp
		double avg = 0;
		for (Double d : innerTemp) {
			avg += d;
		}
		avg = avg / innerTemp.length;

		// // 当 米平均温度
		md.setAttribute("average");
		md.setName("t");
		md.setIspd("3");
		md.changeDateRange(md.getType());
		md.setId(md.getFloor().toLowerCase());
		Double[] inT = remoteServiceInvoker.invokeValueToArray(md);
		md.setAvgInnerTemp(inT[0] + "");
		//
		md.setAvgInnerTemp(avg + "");

		return md;
	}

	public Map getHoloViewData(String buildId) {
		// 返回当日耗电量
		Map result = new HashMap();
		Set<Buildregioninfo> buildings = detectGraphicService
				.getBuildingRegion(buildId);
		//
		for (Buildregioninfo region : buildings) {
			try {
				// 查询建筑耗电量
				String regionId = region.getRegionId();
				ServiceReqParam param = new ServiceReqParam();
				param.reset(ServiceNames.elecCapacity, "total");
				Double cool[] = remoteServiceInvoker.invokeValueToArray(param);

				//
				HoloData hd = new HoloData();
				hd.setCoolerCost(cool[0].intValue());
				result.put(region.getRegionName(), hd);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return result;
	}

	@Override
	public Map<String, Object> getHoloOverViewData() {

		return null;
	}

}
