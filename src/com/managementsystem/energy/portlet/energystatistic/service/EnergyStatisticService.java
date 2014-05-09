package com.managementsystem.energy.portlet.energystatistic.service;

import java.util.Map;

import javax.portlet.ResourceRequest;

import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;

/**
 * 能耗统计接口类
 * 
 * @author zouzhixiang 2013-08-20
 * 
 */
public interface EnergyStatisticService {

	/**
	 * 返回单个图表需要的数据
	 * 
	 * @param preferenceinfo
	 * @param type
	 * @param tfrom
	 * @param tto
	 * @param id
	 * @param name
	 * @param ispd
	 * @param decimals
	 * @return
	 */
	public Map<String, Object> getSingleChartList(PreferenceInfo preferenceinfo, String type, String tfrom, String tto, String id, String name, String ispd, String decimals);

	/**
	 * 返回多个图表需要的数据(指同一个图表中存在两种类型的报表,例如：line、column)
	 * 
	 * @param preferenceinfo
	 * @param type
	 * @param tfrom
	 * @param tto
	 * @param id
	 * @param name
	 * @param ispd
	 * @param referencevalue
	 * @param referenceList
	 * @param decimals
	 * @return
	 */
	public Map<String, Object> getMoreChartList(PreferenceInfo preferenceinfo, String type, String tfrom, String tto, String id, String name, String ispd, String referencevalue, String referenceList, String decimals);

	/**
	 * 返回单个页面需要的效果数据
	 * 
	 * @param type
	 * @param tfrom
	 * @param to
	 * @param id
	 * @param name
	 * @param ispd
	 * @param att
	 * @param decimals
	 * @param mult
	 * @return
	 */
	public Map<String, Object> getValueByNameAndId(String type, String tfrom, String to, String id, String name, String ispd, String att, String decimals, String mult);
	
	/**
	 * 获取map格式的数据(针对第二版能源产品中类似最大值、最小值以及对应的时间)
	 * @author zouzhixiang 2014-03-07
	 * @param type
	 * @param tfrom
	 * @param to
	 * @param id
	 * @param name
	 * @param ispd
	 * @param att
	 * @param decimals
	 * @param mult
	 * @param build_id
	 * @param region_id
	 * @return
	 */
	public Map<String, Object> getDatasForAtts(String type, String tfrom, String to, String id, String name, String ispd, String att, String decimals, String mult, String build_id, String region_id);
	
	/**
	 * 获取map格式的数据(针对第二版能源产品中取多栋建筑的开启台数)
	 * @author zouzhixiang 2014-03-11
	 * @param type
	 * @param tfrom
	 * @param to
	 * @param id
	 * @param name
	 * @param ispd
	 * @param att
	 * @param decimals
	 * @param mult
	 * @param build_id
	 * @param region_id
	 * @return
	 */
	public Map<String, Object> getDatasForBuilds(String type, String tfrom, String to, String id, String name, String ispd, String att, String decimals, String mult, String build_id, String region_id);

	/**
	 * 获取map格式的数据(针对第二版能源产品中取某一栋建筑的不同层数的开启数)
	 * 
	 * @param type
	 * @param tfrom
	 * @param to
	 * @param id
	 * @param name
	 * @param ispd
	 * @param att
	 * @param decimals
	 * @param mult
	 * @param build_id
	 * @param region_id
	 * @return
	 */
	public Map<String, Object> getDatasForRegions(String type, String tfrom, String to, String id, String name, String ispd, String att, String decimals, String mult, String build_id, String region_id);

	/**
	 * 获取map格式的数据(针对第二版能源产品中运行监测模块的处理，多name情况做出处理)
	 * @author zouzhixiang 2014-03-12
	 * @param type
	 * @param tfrom
	 * @param to
	 * @param id
	 * @param name
	 * @param ispd
	 * @param att
	 * @param decimals
	 * @param mult
	 * @param build_id
	 * @param region_id
	 * @return
	 */
	public Map<String, Object> getDatasByNamesForMonitor(String type, String tfrom, String to, String id, String name, String ispd, String att, String decimals, String mult, String build_id, String region_id);

	/**
	 * 获取map格式的数据(针对第二版能源产品中多name和多attribute等情况做出处理)
	 * @author zouzhixiang 2014-03-07
	 * @param type
	 * @param tfrom
	 * @param to
	 * @param id
	 * @param name
	 * @param ispd
	 * @param att
	 * @param decimals
	 * @param mult
	 * @param build_id
	 * @param region_id
	 * @return
	 */
	public Map<String, Object> getDatasForNamesAndAtts(String type, String tfrom, String to, String id, String name, String ispd, String att, String decimals, String mult, String build_id, String region_id);

	/**
	 * 返回单个页面需要的效果数据，此方法name支持传递多个参数，attribute支持传多个参数
	 * 
	 * @param type
	 * @param tfrom
	 * @param to
	 * @param id
	 * @param name
	 * @param ispd
	 * @param att
	 * @param decimals
	 * @return
	 */
	public Map<String, Object> getValueListByNamesAndAtts(String type, String tfrom, String to, String id, String name, String ispd, String att, String decimals, String multiplier);

	/**
	 * 返回多个charts对应的数据列表，数据格式如：[[1],[2],[3]]
	 * 
	 * @param preferenceinfo
	 * @param type
	 * @param tfrom
	 * @param id
	 * @param name
	 * @param ispd
	 * @param decimals
	 * @return
	 */
	public Map<String, Object> getMoreChartsByNames(PreferenceInfo preferenceinfo, String type, String tfrom, String id, String name, String ispd, String decimals, String att, String mult);

	/**
	 * 返回报表数据
	 * 
	 * @param names
	 * @param ids
	 * @param ispds
	 * @param type
	 * @param tfrom
	 * @param tto
	 * @param decimals
	 * @param multiplier
	 * @return
	 */
	public Map<String, Object> printReportInfo(String names, String ids, String ispds, String type, String tfrom, String tto, String decimals, String multiplier);

	/**
	 * 返回多个页面需要的数据，此方法name支持传递多个参数，返回格式为[value1,value2,value3,......]
	 * 
	 * @param preferenceinfo
	 * @param type
	 * @param tfrom
	 * @param tto
	 * @param id
	 * @param name
	 * @param ispd
	 * @param decimals
	 * @return
	 */
	public Map<String, Object> getValueListByNames(PreferenceInfo preferenceinfo, String type, String tfrom, String tto, String id, String name, String ispd, String decimals);

	/**
	 * 返回共用图表所需要的数据，格式为Map
	 * 
	 * @param preferenceinfo
	 * @param type
	 * @param tfrom
	 * @param id
	 * @param name
	 * @param ispd
	 * @param att
	 * @param decimals
	 * @param mult
	 * @param build_id
	 * @param region_id
	 * @param source
	 * @return
	 */
	public Map<String, Object> getCommonChartData(PreferenceInfo preferenceinfo, String type, String tfrom, String id, String name, String ispd, String att, String decimals, String mult, String build_id, String region_id, String source);

	/**
	 * 输出图表数据到excel文件
	 * 
	 * @param from_date
	 * @param expColumnName
	 * @param decimals
	 * @param isNotCompare
	 * @param type
	 * @param preferenceinfo
	 * @param map
	 * @param request
	 * @return
	 */
	public String expChartDataToExcel(String from_date, String expColumnName, String isNotCompare, String type, PreferenceInfo preferenceinfo, Map<String, Object> map, ResourceRequest request, String excelName);

	/**
	 * 输出饼图图表数据到excel文件
	 * 
	 * @param from_date
	 * @param expColumnName
	 * @param decimals
	 * @param isNotCompare
	 * @param type
	 * @param preferenceinfo
	 * @param map
	 * @param request
	 * @return
	 */
	public String expPieChartDataToExcel(String from_date, String expColumnName, String isNotCompare, String type, PreferenceInfo preferenceinfo, Map<String, Object> map, ResourceRequest request, String excelName);

	public Map<String, Object> getPieChartsDataInfo(PreferenceInfo preferenceinfo, String type, String tfrom, String id, String name, String ispd, String decimals, String att, String mult, String itemName, String comparetime);

	/**
	 * 返回共用图表所需要的数据，格式为Map
	 * 
	 * @param preferenceinfo
	 * @param type
	 * @param tfrom
	 * @param id
	 * @param name
	 * @param ispd
	 * @param decimals
	 * @return
	 */
	public Map<String, Object> getOutSideChartData(String type, String tfrom, String id, String name, String ispd, String att, String decimals, String mult);

	/**
	 * 输出图表数据到excel文件
	 * 
	 * @param from_date
	 * @param expColumnName
	 * @param decimals
	 * @param isNotCompare
	 * @param type
	 * @param preferenceinfo
	 * @param map
	 * @param request
	 * @return
	 */
	public String expOutSideChartDataToExcel(String from_date, String expColumnName, String isNotCompare, String type, Map<String, Object> map, ResourceRequest request, String excelName);
}
