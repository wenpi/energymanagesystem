package com.managementsystem.energy.portlet.coreinfo.service;

import com.managementsystem.energy.portlet.coreinfo.model.OutSideStatusInfo;

/**
 * 室外状态、建筑客流量 服务接口类
 * 
 * @author zouzhixiang
 * 
 */
public interface CoreInfoService {

	/**
	 * 返回室外状态相关的数值
	 * 
	 * @param buildId
	 *            建筑ID
	 * 
	 * @return 返回建筑信息
	 * */
	public OutSideStatusInfo getOutSideInfo(String name, String id);

}
