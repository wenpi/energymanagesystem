package com.managementsystem.energy.portlet.holographic.vo;

/**
 * 设备监测数据vo--单个设备状态
 * 
 * @author allchin modified
 * @2013年8月5日 上午10:50:27
 */
public class DetectionData {
	/**
	 * 检测数据名称
	 */
	public String name;
	/**
	 * 开机
	 */
	public Integer on;
	/**
	 * 总台数
	 */
	public Integer total;
	/**
	 * 供水，送风温度
	 */
	public Integer supplyTemp;
	/**
	 * 回水，回风温度
	 */
	public Integer returnTemp;

	public DetectionData() {

	}

	public DetectionData(String name, Integer on, Integer total,
			Integer supplyTemp, Integer returnTemp) {
		this.name = name;
		this.on = on;
		this.total = total;
		this.supplyTemp = supplyTemp;
		this.returnTemp = returnTemp;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getOn() {
		return on;
	}

	public void setOn(Integer on) {
		this.on = on;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getSupplyTemp() {
		return supplyTemp;
	}

	public void setSupplyTemp(Integer supplyTemp) {
		this.supplyTemp = supplyTemp;
	}

	public Integer getReturnTemp() {
		return returnTemp;
	}

	public void setReturnTemp(Integer returnTemp) {
		this.returnTemp = returnTemp;
	}

}
