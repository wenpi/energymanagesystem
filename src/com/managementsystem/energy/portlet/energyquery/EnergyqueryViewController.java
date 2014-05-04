package com.managementsystem.energy.portlet.energyquery;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Bigdistrictinfo;
import com.managementsystem.energy.portlet.chart.model.Chartsetting;
import com.managementsystem.energy.portlet.chart.service.ChartService;
import com.managementsystem.energy.portlet.energyquery.domain.BuildEnergyItem;
import com.managementsystem.energy.service.BigdistrictinfoService;
import com.managementsystem.energy.web.PortletBaseController;
import com.managementsystem.fusionchart.ui.Fusionchart;
import com.managementsystem.ui.easyui.Datagrid;

/**
 * 能耗查询模块
 * 
 * @author CHENPING 2012-09-04
 * */
@Controller
@RequestMapping("VIEW")
public class EnergyqueryViewController extends PortletBaseController {

	private final Log logger = LogFactory
			.getLog(EnergyqueryViewController.class);

	@Autowired
	private BigdistrictinfoService bigdistrictinfoService;

	@Autowired
	private ChartService chartService;

	private Map<String, Object> reportDetailData;

	/**
	 * 获取报表明细数据
	 * */
	public Map<String, Object> getReportDetailData() {
		return reportDetailData;
	}

	/**
	 * 设置报表明细数据
	 * */
	public void setReportDetailData(Map<String, Object> reportDetailData) {
		this.reportDetailData = reportDetailData;
	}

	/**
	 * 显示能耗查询
	 * */
	@RenderMapping
	public ModelAndView showEnergyquery(PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		// 气候区根列表
		Set<Bigdistrictinfo> bigdistrictinfos = bigdistrictinfoService
				.getRootBigdistrictinfos();
		mav.addObject("bigdistrictinfos", bigdistrictinfos);
		mav.setView(PORTLETFOLDER + "energyquery/energyqueryView");
		return mav;
	}

	/**
	 * 获取图表
	 * */
	@ResourceMapping(value = "getChartData")
	public Fusionchart getChartData(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {

		Chartsetting chartsetting = new Chartsetting();
		// 获取所有传入参数
		Enumeration<String> keys = request.getParameterNames();
		String key = null;
		while (keys.hasMoreElements()) {
			// 参数健名称
			key = keys.nextElement().toString();
			// 设置对象值
			if (!"cform".equals(key)) {
				try {
					BeanUtils.setProperty(chartsetting, key,
							request.getParameter(key));
				} catch (IllegalAccessException e) {
					logger.error(e);
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					logger.error(e);
					e.printStackTrace();
				}
			}
		}
		Fusionchart fusionchart = new Fusionchart();
		Map<String, Object> reportDetailData = new HashMap<String, Object>();
		Map<String, Object> resultMap = chartService
				.getMultiSeriesChartForEnergyitemdict(chartsetting,
						reportDetailData);
		fusionchart.setChart(resultMap);
		setReportDetailData(reportDetailData);
		return fusionchart;
	};

	/**
	 * 获取指定分类名称的能耗数据
	 * 
	 * @param energyItemname
	 *            能耗分类名称
	 * @return 指定分类名称的能耗数据
	 * */
	@ResourceMapping(value = "getEnergyDetailData")
	public Datagrid getEnergyDetailData(ResourceRequest request, ResourceResponse response) {
		String energyItemname = "";
		if(request.getParameter("energyItemname")!=null)
			energyItemname = request.getParameter("energyItemname").toString();
		Datagrid dg = new Datagrid();
		List<BuildEnergyItem> result = new ArrayList<BuildEnergyItem>();
		if(reportDetailData!=null) {
			Iterator it = reportDetailData.entrySet().iterator();
			while(it.hasNext()) {
				 Map.Entry pairs = (Map.Entry)it.next();
				 String key = pairs.getKey().toString();
				 if(energyItemname.equals(key)) {
					 Map<String,Object> buildEnergy = (Map<String,Object>)pairs.getValue();
					 for(Iterator itrator=buildEnergy.entrySet().iterator();itrator.hasNext();) {
						 Map.Entry buildpairs = (Map.Entry)itrator.next();
						 BuildEnergyItem item = new BuildEnergyItem();
						 item.setBuildName(buildpairs.getKey().toString());
						 item.setEnergyVal(buildpairs.getValue().toString());
						 result.add(item);
					 }
					break; 
				 }
			}
		}
		dg.setRows(result);
		dg.setTotal(new Long(result.size()));
		return dg;
	}

}
