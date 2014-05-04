package com.managementsystem.energy.portlet.holographic.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 服务请求参数处理类，返回给对应的url参数
 * 
 * @author allchin 2013-08-07 9:46:57
 * @modify zouzhixiang 2014-03-10 17:11
 */
public class ServiceReqParam {
	/**
	 * 起始时间：tfrom =如果为空表示当前
	 */
	private String tfrom;
	/**
	 * 终止时间：tto =如果为空表示当前
	 */
	private String tto;

	/**
	 * 设备号
	 */
	private String equip;

	private String name;
	private String id;
	private String ispd;
	/**
	 * 时间间隔：tspan =300:etc 单位为s 如果为空表示3600
	 */
	private String tspan;
	/**
	 * 数据时间：type =day,week,month,year
	 */
	private String type;
	/**
	 * 取值方式avg ,max
	 */
	private String attribute;

	private String buildId;
	private String regionId;

	/**
	 * 能源产品V2，建筑id，如A1/P1/T1
	 */
	private String build_id;
	/**
	 * 能源产品V2，新版配置表中的楼层，如1F/2F/3F
	 */
	private String region_id;

	private String floor;

	/**
	 * 重新设置查询参数
	 * 
	 * @author allchin modified@2013年8月19日 上午11:27:44
	 * @param name
	 * @param id
	 */
	public void reset(String name, String id) {
		this.name = name;
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIspd() {
		return ispd;
	}

	public void setIspd(String ispd) {
		this.ispd = ispd;
	}

	public String getEquip() {
		return equip;
	}

	public void setEquip(String equip) {
		this.equip = equip;
	}

	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}

	public void changeDateRange(String type) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (tfrom == null) {

			tfrom = sdf.format(new Date());
		}

		try {
			Date date = sdf.parse(tfrom);
			Calendar cd = Calendar.getInstance();
			if ("span".equals(type)) {
				tfrom = null;
			} else if ("week".equals(type)) {

				cd.setFirstDayOfWeek(Calendar.MONDAY);
				cd.setTime(date);
				cd.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
				tfrom = sdf.format(cd.getTime());

				cd.add(Calendar.DATE, 7);

				tto = sdf.format(cd.getTime());

			} else if ("month".equals(type)) {

				cd.setTime(date);
				cd.set(Calendar.DATE, 1);
				tfrom = sdf.format(cd.getTime());
				cd.add(Calendar.MONTH, 1);

				tto = sdf.format(cd.getTime());
			} else if ("day".equals(type)) {
				cd.setTime(date);
				//
				cd.add(Calendar.DATE, 1);
				tto = sdf.format(cd.getTime());

			} else if ("year".equals(type)) {

				cd.setTime(date);
				cd.set(Calendar.DATE, 1);
				cd.set(Calendar.MONTH, 0);
				tfrom = sdf.format(cd.getTime());

				//
				cd.add(Calendar.YEAR, 1);
				tto = sdf.format(cd.getTime());
			}

		} catch (ParseException e) {
			e.printStackTrace();
		}

	}

	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		changeDateRange(type);
		// 第一个参数!!
		if (this.name != null) {
			sb.append("name=" + name);
		}
		if (this.id != null) {
			sb.append("&id=" + id);
		}
		if (this.ispd != null) {
			sb.append("&ispd=" + ispd);
		}
		if (this.type != null) {
			sb.append("&type=" + type);
		}
		if (this.tfrom != null) {
			sb.append("&tfrom=" + tfrom.replace(" ", "T"));
		}
		if (this.tto != null) {
			sb.append("&tto=" + tto.replace(" ", "T"));
		}
		if (this.attribute != null) {
			sb.append("&attribute=" + attribute);
		}
		if (this.region_id != null) {
			sb.append("&region=" + region_id);
		}
		if (this.build_id != null) {
			sb.append("&build=" + build_id);
		}
		return sb.toString();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTfrom() {
		return tfrom;
	}

	public void setTfrom(String tfrom) {
		this.tfrom = tfrom;
	}

	public String getTto() {
		return tto;
	}

	public void setTto(String tto) {
		this.tto = tto;
	}

	public String getTspan() {
		return tspan;
	}

	public void setTspan(String tspan) {
		this.tspan = tspan;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getBuildId() {
		return buildId;
	}

	public void setBuildId(String buildId) {
		this.buildId = buildId;
	}

	public String getRegionId() {
		return regionId;
	}

	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}

	public String getBuild_id() {
		return build_id;
	}

	public void setBuild_id(String build_id) {
		this.build_id = build_id;
	}

	public String getRegion_id() {
		return region_id;
	}

	public void setRegion_id(String region_id) {
		this.region_id = region_id;
	}

}
