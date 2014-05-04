package com.managementsystem.energy.portlet.chart.model;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class BaseEntity implements java.io.Serializable {

	private static final long serialVersionUID = -8215677041611662650L;

	/**
	 * 建筑ID
	 * */
	private String buildId;

	/**
	 * 标题
	 * */
	private String caption;

	/**
	 * 副标题
	 * */
	private String subcaption;


	/**
	 * 设备ID值
	 * <p>
	 * 保存去掉公式运算符后的变量ID,如:"1号冷机:5782|5784,2号冷机:5783|5781",一个序列中有多个变量用"|"分割
	 * </p>
	 * */
	private String tagids;
	
	/**
	 * 保存原始计算公式
	 * <p>
	 * 如："1号冷机:5782*1.23+5784*1.10,2号冷机:5783*1.23+5781*1.10"
	 * </p>
	 * */
	protected String formula;

	/**
	 * 查询默认开始时间类型,设值:
	 * 当前时间:currenttime,今天:today,昨天:yesterday,本周第一天:firstofweek,本月第一天
	 * :firstofmonth,自定义:custom
	 * */
	private String defStarttime;
	/**
	 * 查询默认开始时间
	 * */
	private String starttimeValue;

	/**
	 * 查询默认结束时间类型,设置：当前时间:currenttime,今天:today,昨天:yesterday,本周最后一天:endofweek,
	 * 本月最后天:endofmonth,自定义:custom
	 * */
	private String defEndtime;

	/**
	 * 查询默认结束时间
	 * */
	private String endtimeValue;
	/**
	 * 查询结果默认条数
	 * */
	private String defCount;

	/**
	 * 时间间隔
	 * 
	 * */
	private String tspan;

	private String datasourcetype;
	private String datasourceid;
	private String energyitemcode;
	

	/**
	 * 查询类型,如:>任意时间,用量日报,用量周报,用量月报,用量年报,原始抄表
	 * */
	private String queryType;

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getSubcaption() {
		return subcaption;
	}

	public void setSubcaption(String subcaption) {
		this.subcaption = subcaption;
	}

	public String getTagids() {
		if (tagids == null || "".equals(tagids)) {
			StringBuilder sb = new StringBuilder();
			for (int no = 1; no <= 30; no++) {
				if (sb.length() > 0)
					sb.append(",");
				sb.append(" : "); // 注意这里必须有空格
			}
			tagids = sb.toString();
		}
		return tagids;
	}

	public void setTagids(String tagids) {
		this.tagids = tagids;
	}
	
	public String getFormula() {
		if (this.formula == null || "".equals(this.formula)) {
			StringBuilder sb = new StringBuilder();
			for (int no = 1; no <= 30; no++) {
				if (sb.length() > 0)
					sb.append(",");
				sb.append(" : "); // 注意这里必须有空格
			}
			this.formula = sb.toString();
		}
		return formula;
	}

	public void setFormula(String formula) {
		this.formula = formula;
	}

	public String getDefStarttime() {
		return defStarttime;
	}

	public void setDefStarttime(String defStarttime) {
		this.defStarttime = defStarttime;
	}

	public String getStarttimeValue() {
		return starttimeValue;
	}

	public void setStarttimeValue(String starttimeValue) {
		this.starttimeValue = starttimeValue;
	}

	public String getDefEndtime() {
		return defEndtime;
	}

	public void setDefEndtime(String defEndtime) {
		this.defEndtime = defEndtime;
	}

	public String getEndtimeValue() {
		return endtimeValue;
	}

	public void setEndtimeValue(String endtimeValue) {
		this.endtimeValue = endtimeValue;
	}

	public String getDefCount() {
		return defCount;
	}

	public void setDefCount(String defCount) {
		this.defCount = defCount;
	}

	public String getTspan() {
		return tspan;
	}

	public void setTspan(String tspan) {
		this.tspan = tspan;
	}

	/**
	 * 返回设备TAGID列表
	 * <p>
	 * </p>
	 * */
	public List<String> getTagidlist() {
		if (this.tagids == null || "".equals(this.tagids))
			return null;
		List<String> result = new ArrayList<String>();
		if (this.tagids.indexOf(",") > 0) {
			// 分割序列
			String[] arrTagids = this.tagids.split(",");

			for (int i = 0; i < arrTagids.length; i++) {
				String serie = arrTagids[i];
				if (serie.indexOf(":") > 0) {
					String[] arrSerie = serie.split(":");
					if (arrSerie[0].trim().length() > 0
							&& arrSerie[1].trim().length() > 0) {
						if (arrSerie[1].trim().indexOf("|") > 0) {
							String[] tagids = arrSerie[1].trim().split("\\|");
							String arrtostring = "";
							for (String s : tagids) {
								if (arrtostring.length() > 0)
									arrtostring += ",";
								arrtostring += s;
							}
						} else {
							result.add(arrSerie[1].trim());
						}
					}
				}

			}
		} else {
			result.add(tagids);
		}
		return result;

	}

	public Map<String, String> getTagidSeries() {
		
		Map<String, String> mapSeries = new LinkedHashMap<String, String>();
		if (this.tagids == null || "".equals(tagids)) {
			return mapSeries;
		}
		if (this.tagids.indexOf(",") > 0) {
			String[] arrtagids = this.tagids.split(",");
			for (int i = 0; i < arrtagids.length; i++) {
				String serie = arrtagids[i];
				if (serie.indexOf(":") > 0) {
					String[] arrSerie = serie.split(":");
					if (arrSerie.length >= 2) {
						if (arrSerie[0].trim().length() > 0
								&& arrSerie[1].trim().length() > 0) {

							if (arrSerie[1].trim().indexOf("|") > 0) {
								String[] tagids = arrSerie[1].trim().split(
										"\\|");
								String arrtostring = "";
								for (String s : tagids) {
									if (arrtostring.length() > 0)
										arrtostring += ",";
									arrtostring += s;
								}
								mapSeries.put(arrSerie[0].trim(), arrtostring);
							} else {
								mapSeries.put(arrSerie[0].trim(),
										arrSerie[1].trim());
							}
						}
					}
				}
			}
		}
		return mapSeries;
	}

	/**
	 * 返回数据来源类型(0平台 1建筑群 2单体建筑)
	 * */
	public String getDatasourcetype() {
		if (this.buildId != null && !"".equals(this.buildId)) {
			return "buildinfo";
		}
		return datasourcetype;
	}

	/**
	 * 设置数据来源类型
	 * */
	public void setDatasourcetype(String datasourcetype) {
		this.datasourcetype = datasourcetype;
	}

	/**
	 * 返回数据来源ID
	 * */
	public String getDatasourceid() {
		if (this.buildId != null && !"".equals(this.buildId)) {
			return this.buildId;
		}
		return datasourceid;
	}

	/**
	 * 设置数据源ID
	 * 
	 * @param datasourceid
	 *            数据源ID
	 * */
	public void setDatasourceid(String datasourceid) {
		this.datasourceid = datasourceid;
	}

	/**
	 * 返回能耗分类分项代码
	 * */
	public String getEnergyitemcode() {
		return energyitemcode;
	}

	/**
	 * 设置能耗分类分项代码(多个代码用,号分隔)
	 * */
	public void setEnergyitemcode(String energyitemcode) {
		this.energyitemcode = energyitemcode;
	}

	public String getBuildId() {
		return buildId;
	}

	public void setBuildId(String buildId) {
		this.buildId = buildId;
	}

	public String getQueryType() {
		return queryType;
	}

	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}

}
