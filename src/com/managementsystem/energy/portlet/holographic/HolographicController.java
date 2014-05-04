package com.managementsystem.energy.portlet.holographic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletPreferences;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.QueryScheme;
import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.portlet.holographic.service.DetectGraphicService;
import com.managementsystem.energy.portlet.holographic.service.HoloMainPageService;
import com.managementsystem.energy.portlet.holographic.service.MirrowGraphicService;
import com.managementsystem.energy.portlet.holographic.service.RemoteServiceInvoker;
import com.managementsystem.energy.portlet.holographic.vo.DetectionData;
import com.managementsystem.energy.portlet.holographic.vo.MirrowData;
import com.managementsystem.energy.portlet.holographic.vo.ServiceReqParam;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.web.BaseController;

/**
 * 全息图 ，运行检测 控制器
 * 
 * @author allchin modified@2013年8月15日 下午2:49:07
 */
@Controller
@RequestMapping("VIEW")
public class HolographicController extends BaseController {

	@Autowired
	private DetectGraphicService detectGraphicService;
	@Autowired
	private MirrowGraphicService mirrowGraphicService;
	@Autowired
	private RemoteServiceInvoker remoteServiceInvoker;
	@Autowired
	private HoloMainPageService holoMainPageService;
	@Autowired
	private PreferenceInfoService preferenceInfoService;

	/**
	 * 主页
	 * 
	 * @author allchin modified@2013年8月21日 上午10:45:14
	 * @author zouzhixiang modify 2013-10-21 下午14：45
	 * @return
	 */
	@RenderMapping
	public ModelAndView setup(PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		try {
			// String json = prefs.getValue(HoloConfigController.key, "");

			// 获取首选项信息
			PreferenceInfo preferenceinfo = new PreferenceInfo();
			if (prefs.getMap().size() > 0)
				preferenceinfo = preferenceInfoService.getPreferenceInfo(prefs);

			mav = holoMainPageService.setupMainPageData(
					preferenceinfo.getBuildId(), preferenceinfo.getItemName());
			mav.addObject("holocfg", preferenceinfo);
			//
			// if (json == null || json == "") {
			// } else {
			// HoloConifg holoCfg = JacksonIgnoreNullWapper.jsonToBean(json,
			// HoloConifg.class);
			// mav.addObject(HoloConfigController.key, holoCfg);
			// }
			// //
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	@RenderMapping(params = "action=detail")
	public ModelAndView holoDeatail() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("portlet/holographic/holoDetail");

		return mav;
	}

	/**
	 * 淘宝城，切换建筑改变对应的区域及楼层
	 * 
	 * @author zouzhixiang 2013-10-24
	 * @return
	 */
	@ResourceMapping(value = "changeFloorInfo")
	public @ResponseBody
	Map changeFloorInfo(@RequestParam("buildId") String buildId,
			@RequestParam("itemName") String itemName,
			@RequestParam("regionId") String regionId) {
		Map<String, Object> model = new HashMap<String, Object>();
		model = holoMainPageService.getBuildAndRegionInfo(buildId, itemName,
				regionId);
		return model;
	}

	/**
	 * 全息图数据
	 * 
	 * @author allchin modified@2013年8月5日 上午10:42:51
	 * @return
	 */
	@ResourceMapping(value = "json")
	public Map wrapHoloData() {
		Map<String, Object> model = new HashMap<String, Object>();

		// 查询建筑耗电量，耗冷量
		model = mirrowGraphicService.getHoloViewData(null);

		return model;
	}

	@ResourceMapping(value = "holoOverViewData")
	public Map holoOverViewData() {
		Map<String, Object> model = new HashMap<String, Object>();

		// 查询建筑耗电量，耗冷量
		model = mirrowGraphicService.getHoloOverViewData();

		return model;
	}

	/**
	 * 设备监测数据 TDDO
	 * 
	 * @author allchin modified@2013年8月5日 上午10:53:13
	 * @return
	 */
	@ResourceMapping(value = "detectionJson")
	public Map wrapDetectionData() {
		Map<String, Object> model = new HashMap<String, Object>();
		//
		DetectionData a1Cooler = new DetectionData("冷站", 3, 4, 7, 12);
		model.put(MirrowConstants.A1 + "cooler", a1Cooler);

		model.put(MirrowConstants.A1 + "airCdt", new DetectionData("空调机组", 10,
				40, 20, 50));
		model.put(MirrowConstants.A1 + "airEnd", new DetectionData("空调末端", 10,
				40, 20, 50));
		model.put(MirrowConstants.A1 + "fan", new DetectionData("送排风机", 10, 40,
				20, null));
		//

		return model;
	}

	/**
	 * 运行监测>设备监测>冷战>冷机页面数据展示
	 * 
	 * @author allchin modified@2013年8月12日 下午3:43:56
	 * @return
	 */
	@ResourceMapping(value = "detectCoolMachine")
	public Map detectCoolMachine(ServiceReqParam md) {
		return detectGraphicService.getCoolingMachingData(md);
	}

	/**
	 * 运行监测>设备监测>冷战>水系统页面数据展示
	 * 
	 * @author allchin modified@2013年8月12日 下午3:43:56
	 * @return
	 */
	@ResourceMapping(value = "detectWaterSys")
	public Map detectWaterSys(ServiceReqParam md) {
		return detectGraphicService.getWaterSystemData(md);
	}

	/**
	 * 运行监测>设备监测>冷战>冷却泵 页面数据展示
	 * 
	 * @author allchin modified@2013年8月12日 下午3:47:47
	 * @author zouzhixiang modify 2013-10-22
	 * @param md
	 * @return
	 */
	@ResourceMapping(value = "detectCoolingPump")
	public Map detectCoolingPump(ServiceReqParam md,
			@RequestParam("defaultRegionId") String defaultRegionId) {
		return detectGraphicService.getDetectCoolingPumpData(md,
				holoMainPageService.getQs(defaultRegionId).get("cwp"));
	}

	/**
	 * 运行监测>设备监测>冷战>冷冻泵
	 * 
	 * @author allchin modified@2013年8月12日 下午4:05:30
	 * @author zouzhixiang modify 2013-10-22
	 * 
	 * @param md
	 * @return
	 */
	@ResourceMapping(value = "detectSealmPump")
	public Map detectSealmPump(ServiceReqParam md,
			@RequestParam("defaultRegionId") String defaultRegionId) {
		return detectGraphicService.getDetectSealmPumpData(md,
				holoMainPageService.getQs(defaultRegionId).get("chwp"));

	}

	/**
	 * 运行监测>设备监测>冷战>冷却塔
	 * 
	 * @author allchin modified@2013年8月12日 下午4:06:58
	 * @author zouzhixiang modify 2013-10-22
	 * 
	 * @return
	 */
	@ResourceMapping(value = "detectCoolingTower")
	public Map detectCoolingTower(ServiceReqParam md,
			@RequestParam("defaultRegionId") String defaultRegionId) {
		return detectGraphicService.getCoolingTowerData(md, defaultRegionId);
	}

	/**
	 * 恒温恒湿空调ACU
	 * 
	 * @author allchin modified@2013年8月20日 下午2:21:16
	 * @param md
	 * @return
	 */
	@ResourceMapping(value = "detectACUData")
	public Map detectACUData(ServiceReqParam md) {

		return detectGraphicService.getDetectACUData(md);
	}

	/**
	 * 空调机组 -AHU
	 * 
	 * @author allchin modified@2013年8月12日 下午5:11:29
	 * @return
	 */
	@ResourceMapping(value = "detectAHUData")
	public Map detectAHUData(ServiceReqParam md) {

		return detectGraphicService.getDetectAHUData(md);

	}

	/**
	 * 空调机组 -FAU
	 * 
	 * @author allchin modified@2013年8月12日 下午5:11:29
	 * @return
	 */
	@ResourceMapping(value = "detectFAUData")
	public Map detectFAUData(ServiceReqParam md) {
		return detectGraphicService.getDetectFAUData(md);
	}

	/**
	 * 空调机组 -FCU
	 * 
	 * @author allchin modified@2013年8月12日 下午5:18:21
	 * @param md
	 * @return
	 */
	@ResourceMapping(value = "detectFCUData")
	public Map detectFCUData(ServiceReqParam md) {

		return detectGraphicService.getDetectFCUData(md);

	}

	/**
	 * 空调机组 -VAV
	 * 
	 * @author allchin modified@2013年8月12日 下午5:19:42
	 * @param md
	 * @return
	 */
	@ResourceMapping(value = "detectVAVData")
	public Map detectVAVData(ServiceReqParam md) {

		return detectGraphicService.getDetectVAVData(md);

	}

	/**
	 * 全息图详细数据
	 * 
	 * @author allchin modified@2013年8月5日 下午12:51:14
	 * @return
	 * @throws Exception
	 */
	@ResourceMapping(value = "graphicsJson")
	public Map wrapGraphicsData(MirrowData md) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		mirrowGraphicService.fillHoloDetailData(md);
		// model.put("cate", detectGraphicService.requestForCate(md));
		// model.put("cate", remoteServiceInvoker.getValueList(md, "time"));

		model.put("md", md);
		return model;
	}

	/**
	 * TODO 风机开关状态
	 * 
	 * @author allchin modified@2013年8月8日 下午7:20:14
	 * @author zouzhixiang modify 2013-10-22
	 * @return
	 */
	@ResourceMapping(value = "detectFanData")
	public Map detectFanData(ServiceReqParam md,
			@RequestParam("defaultRegionId") String defaultRegionId) {
		// 当前使用的数据是冷却泵的数据，因目前淘宝城数据缺失，当前使用冷却泵数据测试
		return detectGraphicService.getDetectCoolingPumpData(md,
				holoMainPageService.getQs(defaultRegionId).get("cwp"));
	}

	/**
	 * 淘宝城项目，点击空调箱（或恒温恒湿）请求得到的设备数据
	 * 
	 * @author zouzhixiang 2013-11-01
	 * @param md
	 * @param buildId
	 * @param regionId
	 * @param devs
	 * @return
	 */
	@ResourceMapping(value = "getDevicesList")
	public Map<String, List<QueryScheme>> getDevicesList(
			@RequestParam("buildId") String buildId,
			@RequestParam("regionId") String regionId,
			@RequestParam("devs") String devs) {
		// 当前使用的数据是冷却泵的数据，因目前淘宝城数据缺失，当前使用冷却泵数据测试
		return holoMainPageService.getDevicesForTaoBao(buildId, regionId, devs);
	}
}