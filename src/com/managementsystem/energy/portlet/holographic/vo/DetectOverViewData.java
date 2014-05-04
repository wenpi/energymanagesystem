package com.managementsystem.energy.portlet.holographic.vo;

import java.util.HashMap;
import java.util.Map;

/**
 * 设备监测总览数据vo ,存储一个区域的统计数据
 * 
 * @author allchin modified@2013年8月20日 上午10:11:42
 */
public class DetectOverViewData {
	// 区域信息
	private String regionId;
	private String regionName;

	// 总量<设备类型，计数>
	private Map<String, Integer> count = new HashMap();
	private Map<String, Integer> open = new HashMap();

	public String getRegionId() {
		return regionId;
	}

	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public Map<String, Integer> getCount() {
		return count;
	}

	public void setCount(Map<String, Integer> count) {
		this.count = count;
	}

	public Map<String, Integer> getOpen() {
		return open;
	}

	public void setOpen(Map<String, Integer> open) {
		this.open = open;
	}

}
