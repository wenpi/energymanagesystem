package com.managementsystem.energy.portlet.chart.service;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.PortletPreferences;

import com.managementsystem.energy.portlet.chart.model.BaseEntity;
import com.managementsystem.energy.portlet.chart.model.Chartsetting;
import com.managementsystem.energy.portlet.chart.model.Queryresult;
import com.managementsystem.energy.portlet.chart.model.ReportSetting;

/**
 * 图表数据处理接口
 * 
 * @author CHENPING 2012-7-4
 * */
public interface ChartService {
	
	/**
	 * 返回图表设置对象
	 * 
	 * @param prefs 图表首选项
	 * */
	public Chartsetting getChartsetting(PortletPreferences prefs);
	
	/**
	 * 获取报表设置
	 * */
	public ReportSetting getReportSetting(PortletPreferences prefs);
	
	public Map<String,List<Queryresult>> getEnergyReportPartly( ReportSetting reportSetting, 
			 String from, 
			 String to ,
			 int partId,
			 int base
			 )  ;

	/**
	 * 获取变量ID
	 * @param request 请求对象
	 * @return 结果字符数组 String[0] 原始计算公司字符 String[1] 转换后的TagID值集合
	 * */
	public String[] getTagids(ActionRequest request,BaseEntity entity);
	
	
	/**
	 * 获取FunsionChart设置
	 * 
	 * @param chartsetting 图表设置项
	 * 
	 * @return FunsionChart ChartJSON元素设置项
	 * */
	public Map<String,Object> getFusionChartSetting(Chartsetting chartsetting);
	
	/**
	 * 获取FunsionChart趋势线设置
	 * 
	 * @param chartsetting 图表设置项
	 * 
	 * @return FunsionChart Trendlines JSON
	 * */
	public Map<String,Object> getFusionChartTrendlines(Chartsetting chartsetting);
	
	/**
	 * 获取比较时间
	 * @param cfrom 比较来源
	 * @return  比较时间
	 * */
	public String getCompareDate(Chartsetting chartsetting,String from,String to,String cfrom);
	
	/**
	 * 返回图表查询开始时间
	 * */
	public String getQueryStartdatetime(BaseEntity chartsetting,String from,String to);
	
	/**
	 * 返回图表查询结束时间
	 * */
	public String getQueryEnddatetime(BaseEntity chartsetting,String from,String to);
	
	/**
	 * 获取查询结果
	 * 
	 * @param chartsetting 图表设置对象
	 * @param tagids 查询tagids
	 * @param from 开始时间
	 * @param to 结束时间
	 * @param count 查询条数
	 * */
	public List<Queryresult> getQueryresult(Chartsetting chartsetting,String tagids,String from,String to,String count);
	
	/**
	 * 获取单系列图表数据
	 * @param chartsetting 图表设置对象
	 * @param queryResults 查询结果数据
	 * @return 
	 * */
	public List<Object> getSingleSeriesChartData(Chartsetting chartsetting,List<Queryresult> queryResults);
	
	/**
	 * 获取占比图数据列表
	 * @param chartsetting 图表设置
	 * @param queryResults 查询结果数据
	 * 
	 * @return 占比图数据列表
	 * */
	public List<Object> getPieChartData(Chartsetting chartsetting,List<Queryresult> queryResults);
	
	/**
	 * 获取多系列图表数据类别Label
	 * <br />以查询结果的日期作为lable
	 * 
	 * @param resultlist 查询结果
	 * 
	 * @return 返回类别MAP
	 * */
	public List<Object> getMultiSeriesCategories(List<Queryresult> resultlist,Chartsetting chartsetting);
	
	/**
	 * 获取多系列图表数据
	 * 
	 * @param resultlist 查询结果
	 * 
	 * @return 返回数据结果MAP
	 * */
	public List<Object> getMultiSeriesDataset(Chartsetting chartsetting,List<Queryresult> list,String additionkey);
	
	/**
	 * 获取对比图表类别数据
	 * @param chartsetting 图表设置
	 * @param mapQueryresluts 查询结果数据
	 * @return 对比图表类别数据
	 * */
	public List<Object> getCompareSeriesCategories(Chartsetting chartsetting,List<Queryresult> queryResults);
	
	/**
	 *	获取对比图表数据
	 * @param chartsetting 图表设置
	 * @param mapQueryresluts 查询结果数据
	 * @return 对比图表类别数据
	 * */
	public List<Object> getCompareSeriesDataset(Chartsetting chartsetting,Map<String,List<Queryresult>> mapQueryresluts);
	
	
	/**
	 * 获取能耗查询结果
	 * 
	 * @param wsurl
	 *            能耗数据服务地址<p>example: http://192.168.1.50:8080/tag/history/dayreport/list?tagid=5783,5784,5785&tfrom=2011-3-1T8:0:0</p>
	 * 
	 * @return 能耗数据列表
	 * */
	public List<Queryresult> getQueryresult(String wsurl) throws NullPointerException,MalformedURLException,IOException,Exception;
	
	/**
	 * 获取能耗分类分项数据图表
	 * @param chartsetting 图表设置参数
	 * @param reportDetailData 查询结果明细数据
	 * */
	public Map<String,Object> getMultiSeriesChartForEnergyitemdict(Chartsetting chartsetting,Map<String,Object> reportDetailData);
	
	/**
	 * 获取能耗分类分项数据图表
	 * @param chartsetting 图表设置参数
	 * @param reportDetailData 查询结果明细数据
	 * */
	public Map<String,Object> getMultiSeriesChartForContrastEnergyitemdict(Chartsetting chartsetting,Map<String,Object> reportDetailData);
	
	/**
	 * 获取支路装表能耗比较数据图表
	 * @param chartsetting 图表设置参数
	 * @param reportDetailData 查询结果明细数据
	 * */
	public Map<String,Object> getMultiSeriesChartForContrastCircuit(Chartsetting chartsetting,Map<String,Object> reportDetailData);
	
	
	/**
	 * 获取读表数据图表序列
	 * 
	 * @param chartsetting 图表设置
	 * 
	 * @param from 开始日期
	 * 
	 * @param to 结束日期
	 * 
	 * @param count 显示条数
	 * 
	 * @param 读表数据图表序列
	 * */
	public List<Object> getSingleSeriesChartDataByReadmeter(Chartsetting chartsetting,String from,String to,String count);
	
	
	/**
	 * 获取报表数据
	 * @param reportSetting 报表设置
	 * 
	 * @param from 开始日期
	 * 
	 * @param to 结束日期
	 * 
	 * @return 报表数据
	 * */
	public Map<String,List<Queryresult>> getEnergyReport(ReportSetting reportSetting,String from,String to);
	
	
}
