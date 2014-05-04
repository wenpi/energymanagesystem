package com.managementsystem.energy.portlet.chart;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


import com.managementsystem.energy.domain.Meteruseattribute;
import com.managementsystem.energy.portlet.chart.model.Chartsetting;
import com.managementsystem.energy.portlet.chart.model.Queryresult;
import com.managementsystem.energy.portlet.chart.service.ChartService;

public class FusionChartUtil {

	private static final FusionChartUtil instance = new FusionChartUtil();

	private FusionChartUtil() {
		
	}

	public synchronized static FusionChartUtil getInstance() {
		return instance;
	}

	private List<Queryresult> queryResult = new LinkedList<Queryresult>();

	public List<Queryresult> getQueryResult() {
		return queryResult;
	}

	public void setQueryResult(List<Queryresult> queryResult) {
		this.queryResult = queryResult;
	}
	
	public Map<String, Object> generateDatabaseFusionChart(ChartService chartService,
			Chartsetting chartsetting, String from, String to, String count,
			String cfrom, String cto) {
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		
		Map<String, Object> objChart =  new HashMap<String, Object>();
		List<Object> objData = new LinkedList<Object>();
		if(chartsetting!=null) {
			objChart = chartService.getFusionChartSetting(chartsetting);
			objData = chartService.getSingleSeriesChartDataByReadmeter(chartsetting, from, to, count);
		}
		resultMap.put("chart", objChart);
		resultMap.put("data", objData);
		return resultMap;
	} 
	

	/**
	 * 生成图表
	 * 
	 * @param chartsetting
	 *            图表设置
	 * @param queryParams
	 *            查询参数
	 * */
	public Map<String, Object> generateFusionChart(ChartService chartService,
			Chartsetting chartsetting, String from, String to, String count,
			String cfrom, String cto) {
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		Map<String, Object> chart =  new HashMap<String, Object>();
		
		if(chartsetting!=null) {
			// Charts Header
			chart = chartService.getFusionChartSetting(chartsetting);
			
			Map<String, String> tagidSeries = chartsetting.getTagidSeries();
			Object[] arr = tagidSeries.values().toArray();

			int comparisontype = chartsetting.getComparisontype();
			if (comparisontype > 0 && !"".equals(cfrom)) {
				generateCompareChart(chartService, chartsetting, resultMap, from,
						to, count, cfrom, cto);
			} else {
				if (chartsetting.getTagidSeries().size() > 1) {
					String tagids = arrayToString(arr);
					List<Queryresult> result = chartService.getQueryresult(
							chartsetting, tagids, from, to, count);
					generateMultiSeriesChart(chartService, chartsetting, result,
							resultMap);
				} else {
					if(arr!=null && arr.length>=1) {
						String tagids = arr[0].toString();
						List<Queryresult> result = chartService.getQueryresult(
								chartsetting, tagids, from, to, count);
						generateSingleSeriesChart(chartService, chartsetting, result,
								resultMap);
					}
				}
			}
			if(chartsetting.getIsTrendZone()==1) {
				Map<String,Object> trendlines = chartService.getFusionChartTrendlines(chartsetting);
				resultMap.put("trendlines", trendlines);
			}
		}
		
		resultMap.put("chart", chart);

		return resultMap;
	}

	public Map<String, Object> generateFusionChart(ChartService chartService,
			String from, String to, String count, String cfrom, String cto,
			List<Meteruseattribute> meteruseattributes) {
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

		return resultMap;
	}

	private String arrayToString(Object[] arr) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < arr.length; i++) {
			if (sb.length() > 0)
				sb.append(",");
			sb.append(arr[i].toString());
		}
		return sb.toString();
	}

	/**
	 * 
	 * */
	public void generateSingleSeriesChart(ChartService chartService,
			Chartsetting chartsetting, List<Queryresult> result,
			Map<String, Object> resultMap) {
		List<Object> data = chartService.getSingleSeriesChartData(chartsetting,
				result);
		resultMap.put("data", data);

		if(chartsetting.getIsTrendZone()==1) {
			Map<String,Object> line = chartService.getFusionChartTrendlines(chartsetting);
			resultMap.put("trendlines", line);
		}
	}

	public void generateMultiSeriesChart(ChartService chartService,
			Chartsetting chartsetting, List<Queryresult> result,
			Map<String, Object> rootMap) {
		rootMap.put("categories",
				chartService.getMultiSeriesCategories(result, chartsetting));
		rootMap.put("dataset",
				chartService.getMultiSeriesDataset(chartsetting, result, null));
		if(chartsetting.getIsTrendZone()==1) {
			Map<String,Object> line = chartService.getFusionChartTrendlines(chartsetting);
			rootMap.put("trendlines", line);
		}
	}

	/**
	 * 生成对比图表
	 * */
	public void generateCompareChart(ChartService chartService,
			Chartsetting chartsetting, Map<String, Object> rootMap,
			String from, String to, String count, String cfrom, String cto) {
		Map<String, String> tagidSeries = chartsetting.getTagidSeries();
		Object[] arr = tagidSeries.values().toArray();
		Map<String, List<Queryresult>> mapQueryresluts = new LinkedHashMap<String, List<Queryresult>>();
		String tagids = "";
		if (chartsetting.getTagidSeries().size() > 1) {
			tagids = arrayToString(arr);
		} else {
			tagids = arr[0].toString();
		}
		List<Queryresult> result = chartService.getQueryresult(chartsetting,
				tagids, from, to, count);
		if (!"".equals(cfrom)) {
			String cformval = chartService.getCompareDate(chartsetting, from,
					to, cfrom);
			List<Queryresult> cresult = chartService.getQueryresult(
					chartsetting, tagids, cformval, to, count);
			mapQueryresluts.put(
					chartService.getQueryStartdatetime(chartsetting, from, to),
					result);
			mapQueryresluts.put(
					chartService.getCompareDate(chartsetting, from, to, cfrom),
					cresult);
			rootMap.put("categories", chartService.getCompareSeriesCategories(
					chartsetting, result));
			rootMap.put("dataset", chartService.getCompareSeriesDataset(
					chartsetting, mapQueryresluts));
			if(chartsetting.getIsTrendZone()==1) {
				Map<String,Object> line = chartService.getFusionChartTrendlines(chartsetting);
				rootMap.put("trendlines", line);
			}
		} else {
			generateSingleSeriesChart(chartService, chartsetting, result,
					rootMap);

		}

	}

	public Map<String, Object> renderPieChart(ChartService chartService,
			Chartsetting chartsetting, String from, String to, String count,
			String cfrom, String cto) {
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		Map<String, String> tagidSeries = null;
		
		Map<String, Object> chart = new LinkedHashMap<String,Object>();
		List<Object> data = new LinkedList<Object>();
		if(chartsetting!=null) {
			tagidSeries = chartsetting.getTagidSeries();
			if(tagidSeries!=null) {
				String tagids = arrayToString(tagidSeries.values().toArray());
				List<Queryresult> queryResults = chartService.getQueryresult(
						chartsetting, tagids, from, to, count);
				chart = chartService.getFusionChartSetting(chartsetting);
				data = chartService.getPieChartData(chartsetting, queryResults);
				this.queryResult = queryResults;
			} 
		}
		
		resultMap.put("chart", chart);
		resultMap.put("data",data);
		return resultMap;
	}
	
	
	
	

}
