package com.managementsystem.energy.service;

import java.util.Map;
import java.util.Set;

import com.managementsystem.energy.domain.Energydict;
import com.managementsystem.util.dao.Page;

/**
 * 能耗字典数据操作服务接口
 * 
 * @author CHENPING 2012-06-14
 * */
public interface EnergydictService {

	/**
	 * 新增能耗字典数据
	 * 
	 * @param energydict 能耗字典
	 * */
	public void addEnergydict(Energydict energydict);
	
	
	/**
	 * 更新能耗字典数据
	 * 
	 * @param energydict 能耗字典
	 * */
	public void updateEnergydict(Energydict energydict);
	
	/**
	 * 删除能耗字典数据
	 * 
	 * @param energydict 能耗字典
	 * */
	public void deleteEnergydict(String energydictId);
	
	/**
	 * 获取能耗字典项信息
	 * 
	 * @param energydictId 字典ID
	 * 
	 * @return 能耗字典项信息
	 * */
	public Energydict getEnergydict(String energydictId);
	
	/**
	 * 获取能耗基本设置
	 * 
	 * @param pageIndex 当前索引页
	 * @param pageSize  每页显示条目数
	 * 
	 * @return 能耗基本列表
	 * */
	public Page getEnergydicts(int pageIndex,int pageSize,Map<String,Object> mapCondition);
	
	/**
	 *  获取能耗基本设置
	 * */
	public Set<Energydict> getEnergydicts();
}
