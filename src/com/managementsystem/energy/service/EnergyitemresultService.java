package com.managementsystem.energy.service;

import java.util.Set;

import com.managementsystem.energy.domain.Energyitemresult;

/**
 * 能耗分类分项与装表关系服务类
 * */
public interface EnergyitemresultService {

	/**
	 * 获取指定ID的分类分项与装表关系对象
	 * */
	public Energyitemresult getEnergyitemresult(String resultId);

	/**
	 * 获取指定仪表ID对应的能耗分类分项列表
	 * 
	 * @param meterId
	 *            仪表ID
	 * @return 指定仪表ID对应的能耗分类分项列表
	 * */
	public Set<Energyitemresult> getEnergyitemresultsByMeterId(String meterId);
	
	/**
	 * 获取指定仪表ID对应的能耗分类分项对象
	 * 
	 * @param meterId
	 *            仪表ID
	 * @return 指定仪表ID对应的能耗分类分项对象
	 * */
	public Energyitemresult getEnergyitemresultByMeterId(String meterId);

	/**
	 * 保存或更新分类分项与装表关系对象
	 * 
	 * @param 分类分项与装表关系对象
	 * */
	public void saveOrUpdateEnergyitemresult(Energyitemresult energyitemresult);

}
