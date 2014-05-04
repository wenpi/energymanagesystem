package com.managementsystem.energy.service;

import java.util.Map;
import java.util.Set;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.EnergyItemStandardDetail;
import com.managementsystem.energy.domain.EnergyRegionalStandardDetail;
import com.managementsystem.energy.domain.EnergyStandard;
import com.managementsystem.util.dao.Page;

/**
 * 能耗标准服务接口
 * 
 * @author PING.CHEN 2012.04.02
 * */
public interface EnergyStandardService {
	
	/**
	 * 新增能耗标准数据
	 * 
	 * @param energyStandard 能耗标准数据对象
	 * */
	public void addEnergyStandard(EnergyStandard energyStandard) throws DataAccessException;
	
	/**
	 * 更新能耗标准数据
	 * */
	public void updateEnergyStandard(EnergyStandard energyStandard) throws DataAccessException;
	
	/**
	 * 删除能耗标准数据
	 * 
	 * @param standardId 数据ID
	 * */
	public void deleteEnergyStandard(String standardId) throws DataAccessException;
	
	/**
	 * 获取指定的能耗标准数据对象
	 * 
	 * @param standardId 数据ID
	 * 
	 * @return 能耗标准数据对象
	 * */
	public EnergyStandard getEnergyStandard(String standardId) throws DataAccessException;
	
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
	 * 新增分项能耗标准
	 * 
	 * @param energyItemStandardDetail 分项能耗标准数据对象
	 * */
	public void addEnergyItemStandardDetail(EnergyItemStandardDetail energyItemStandardDetail) throws DataAccessException;
	
	
	/**
	 * 更新分项能耗标准
	 * 
	 * @param energyItemStandardDetail 分项能耗标准数据对象
	 * */
	public void updateEnergyItemStandardDetail(EnergyItemStandardDetail energyItemStandardDetail) throws DataAccessException;
	
	/**
	 * 删除分项能耗标准
	 * 
	 * @param detailId 分项能耗数据ID
	 * */
	public void deleteEnergyItemStandardDetail(String detailId) throws DataAccessException;

	/**
	 * 获取分项能耗标准数据对象
	 * 
	 * @param detailId 分项能耗数据ID
	 * 
	 * @return 分项能耗标准数据对象
	 * */
	public EnergyItemStandardDetail getEnergyItemStandardDetail(String detailId) throws DataAccessException;
	
	/**
	 * 获取分项能耗标准
	 * 
	 * @param standardId 标准ID
	 * 
	 * @param 分项能耗标准
	 * */
	public Set<EnergyItemStandardDetail> findEnergyItemStandardDetails(String standardId) throws DataAccessException;
	
	
	/**
	 * 新增气候区能耗标准数据
	 * 
	 * @param energyRegionalStandardDetail 气候区能耗标准数据对象
	 * */
	public void addEnergyRegionalStandardDetail(EnergyRegionalStandardDetail energyRegionalStandardDetail) throws DataAccessException;
	
	
	/**
	 * 更新气候区能耗标准数据
	 * 
	 * @param energyRegionalStandardDetail 气候区能耗标准数据对象
	 * */
	public void updateEnergyRegionalStandardDetail(EnergyRegionalStandardDetail energyRegionalStandardDetail) throws DataAccessException;
	
	/**
	 * 删除指定的气候区能耗标准数据
	 * 
	 * @param detailId 气候区能耗数据ID
	 * */
	public void deleteEnergyRegionalStandardDetail(String detailId) throws DataAccessException;
	
	/**
	 * 获取指定气候区的能耗标准数据
	 * 
	 * @param detailId 气候区能耗数据ID
	 * 
	 * @return 气候区的能耗标准数据对象
	 * */
	public EnergyRegionalStandardDetail getEnergyRegionalStandardDetail(String detailId) throws DataAccessException;
	
	/**
	 * 获取气候区能耗标准
	 * 
	 * @param standardId 标准ID
	 * 
	 * @param 气候区能耗标准
	 * 
	 * */
	public Set<EnergyRegionalStandardDetail> findEnergyRegionalStandardDetails(String standardId) throws DataAccessException;
	/**
	 * 获取指定标准类型的建筑能耗标准
	 * 
	 * author by chenhonglie
	 * 
	 * */
	public List<EnergyStandard> energyStandardList(String standardType) throws DataAccessException;
}
