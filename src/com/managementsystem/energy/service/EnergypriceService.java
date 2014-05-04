package com.managementsystem.energy.service;

import java.util.Map;

import com.managementsystem.energy.domain.Districtinfo;
import com.managementsystem.energy.domain.Energydict;
import com.managementsystem.energy.domain.Energyprice;
import com.managementsystem.util.dao.Page;

/**
 * */
public interface EnergypriceService {
	
	/**
	 * @param pageIndex 当前索引页
	 * @param pageSize  每页显示条目数
	 * 
	 * @return 基本列表
	 * */
	public Page getListEnergyprice(int pageIndex,int pageSize,Map<String,Object> mapCondition);
	
	/**
	 * 新增
	 * @param energyprice 
	 * */
	public void addEnergyprice(Energyprice energyprice);
	
	/**
	 * 更新
	 * 
	 * @param energyprice 
	 * */
	public void updateEnergyprice(Energyprice energyprice);
	
	/**
	 * 获取
	 * 
	 * */
	public Energyprice getEnergyprice(String priceid);
	/**
	 * 删除
	 * 
	 * */
	public void deleteEnergyprice(String priceid);
	
	public Energyprice getEnergypriceByenergydictId(String energydictId);
}

