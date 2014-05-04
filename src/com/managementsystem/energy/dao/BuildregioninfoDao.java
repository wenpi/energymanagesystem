package com.managementsystem.energy.dao;

import java.util.Map;
import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Buildregioninfo;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;

/**
 * 建筑区域字典数据接口类
 * */
public interface BuildregioninfoDao extends DaoSupport {
	
	/**
	 * 获取指定建筑的区域定义信息
	 * 
	 * @param buildId 建筑ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 所有支路信息
	 * */
	public Set<Buildregioninfo> getBuildregioninfos(String buildId,int startResult, int maxRows) throws DataAccessException;
	
	/**
	 * 获取指定建筑的根区域信息
	 * 
	 * @param buildId 建筑ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定建筑的根区域信息
	 * */
	public Set<Buildregioninfo> getParentBuildregioninfos(String buildId,int startResult, int maxRows) throws DataAccessException;
	
	/**
	 * 获取指定区域ID的下级分区信息
	 * 
	 * @param parentId 区域ID
	 * 
	 * @return 指定区域ID的下级分区信息
	 * */
	public  Set<Buildregioninfo> getBuildregioninfosByParentId(String parentId) throws DataAccessException;
	
	
	/**
	 *  获取所有建筑的区域定义信息
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * @return 所有支路信息
	 * */
	public Page getBuildregioninfos(String buildId,int pageIndex,int pageSize,Map<String,Object> mapParams) throws DataAccessException;

	/**
	 * 获取指定建筑的最大区域ID信息
	 * */
	public Buildregioninfo getMaxBuildregioninfoByBuildId(String buildId) throws DataAccessException;
}
