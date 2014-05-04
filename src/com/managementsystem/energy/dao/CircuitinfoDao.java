package com.managementsystem.energy.dao;

import java.util.Map;
import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Circuitinfo;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;

/**
 * 装表支路拓扑结构数据操作接口类
 * */
public interface CircuitinfoDao extends DaoSupport {
	
	/**
	 * 返回指定建筑的所有支路信息
	 * 
	 * @param buildId 建筑ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定建筑的所有支路信息
	 * */
	public Set<Circuitinfo> getCircuitinfos(String buildId,int startResult, int maxRows) throws DataAccessException;
	
	/**
	 * 获取指定建筑的所有根支路信息
	 * 
	 * @param buildId 建筑ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定建筑的所有根支路信息
	 * */
	public Set<Circuitinfo> getParentCircuitinfos(String buildId,int startResult, int maxRows) throws DataAccessException;
	
	/**
	 * 获取所有支路信息
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * @return 所有支路信息
	 * */
	public Page getCircuitinfos(int pageIndex,int pageSize,Map<String,Object> mapParams) throws DataAccessException;

	/**
	 * 获取支路信息最大ID
	  * @param buildId 建筑ID
	  * @return 指定建筑的最大支路ID信息
	 * */
	public Circuitinfo getMaxCircuitinfoByBuildId(String buildId) throws DataAccessException; 
}
