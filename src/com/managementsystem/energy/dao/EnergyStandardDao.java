package com.managementsystem.energy.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.EnergyItemStandardDetail;
import com.managementsystem.energy.domain.EnergyRegionalStandardDetail;
import com.managementsystem.energy.domain.EnergyStandard;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;

/**
 * 能耗标准服务数据接口
 * 
 * @author PING.CHEN
 * */
public interface EnergyStandardDao extends DaoSupport {

	/**
	 * 获取能耗标准数据
	 * @param pageIndex 当前页码
	 * @param pageSize 分页数
	 * @param mapCondition 查询条件map
	 * 
	 * @param 能耗标准数据
	 * */
	public Page findEnergyStandards(int pageIndex,int pageSize,Map<String,Object> mapCondition) throws DataAccessException;
	
	/**
	 * 获取指定的默认能耗标准数据
	 * 
	 * @param startResult 开始条目
	 * @param maxRows 结束条目
	 * 
	 * @return 默认能耗标准数据
	 * */
	public Set<EnergyStandard> findDefaultEnergyStandards(int startResult, int maxRows) throws DataAccessException;
	
	/**
	 * 获取所有默认能耗标准数据
	 * 
	 * @return 默认能耗标准数据
	 * */
	public Set<EnergyStandard> findDefaultEnergyStandards() throws DataAccessException;
	
	/**
	 * 获取指定类型的能耗标准数据
	 * 
	 * @param startResult 开始条目
	 * @param maxRows 结束条目
	 * 
	 * @param type 类型
	 * 
	 * @param isDefault 是否默认
	 * 
	 * @return能耗标准数据
	 * */
	public Set<EnergyStandard> findEnergyStandardsByType(int startResult, int maxRows,String type,int isDefault) throws DataAccessException;
	
	
	/**
	 * 获取指定类型的默认能耗标准数据
	 * 
	 * @param startResult 开始条目
	 * @param maxRows 结束条目
	 * 
	 * @param type 类型
	 * 
	 * 
	 * @return能耗标准数据
	 * */
	public Set<EnergyStandard> findDefaultEnergyStandardsByType(int startResult, int maxRows,String type) throws DataAccessException;
	
	
	/**
	 * 获取分项能耗标准
	 * 
	 * @param standardId 标准ID
	 * 
	 * @param 分项能耗标准
	 * */
	public Set<EnergyItemStandardDetail> findEnergyItemStandardDetails(String standardId) throws DataAccessException;

	/**
	 * 获取气候区能耗标准
	 * 
	 * @param standardId 标准ID
	 * 
	 * @param 气候区能耗标准
	 * 
	 * */
	public Set<EnergyRegionalStandardDetail> findEnergyRegionalStandardDetails(String standardId)  throws DataAccessException;
	
	public List<EnergyStandard> energyStandardList(String standardType)  throws DataAccessException;
	

	
	
}
