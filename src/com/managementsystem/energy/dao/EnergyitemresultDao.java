package com.managementsystem.energy.dao;

import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Energyitemresult;
import com.managementsystem.util.dao.DaoSupport;

/**
 * 能耗分类分项与装表关系数据操作接口类
 * */
public interface EnergyitemresultDao extends DaoSupport {

	/**
	 * 获取指定仪表ID对应的能耗分类分项
	 * 
	 * @param meterId
	 *            仪表ID
	 * @return 指定仪表ID对应的能耗分类分项列表
	 * */
	public Set<Energyitemresult> getEnergyitemresultByMeterId(String meterId) throws DataAccessException;
	
	
	
	
}
