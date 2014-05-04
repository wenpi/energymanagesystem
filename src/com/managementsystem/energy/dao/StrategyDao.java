package com.managementsystem.energy.dao;

import java.util.Map;
import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Strategy;
import com.managementsystem.energy.domain.Strategydetail;
import com.managementsystem.energy.domain.Strategydetailparam;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;

public interface StrategyDao extends DaoSupport {
	
	/**
	 * 获取策略数据
	 * @param buildId 建筑ID
	 * @param startResult 开始行号 
	 * @param maxRows 显示行数	 -1为显示全部
	 * @return 策略数据
	 * */
	public Set<Strategy> getStrategies(String buildId,int startResult, int maxRows) throws DataAccessException;
	
	/**
	 * 获取父策略数据
	 * @param buildId 建筑ID
	 * @param startResult 开始行号 
	 * @param maxRows 显示行数	 -1为显示全部
	 * @return 策略数据
	 * */
	public Set<Strategy> getParentStrategies(String buildId,int startResult, int maxRows) throws DataAccessException;
	
	/**
	 * 获取策略分页数据
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * @param mapParams 查询条件
	 * */
	public Page getStrategies(String buildId,int pageIndex,int pageSize,Map<String,Object> mapParams) throws DataAccessException;
	
	/**
	 * 获取指定策略的所有明细条目
	 * @param strategyid 策略ID
	 * @return 指定策略的所有明细条目
	 * */
	public Set<Strategydetail> getStrategydetails(String strategyid)  throws DataAccessException;;
	
	/**
	 * 获取指定策略明细的参数信息
	 * @param detailid 明细ID
	 * */
	public Set<Strategydetailparam> getStrategydetailparamsBydetailid(String detailid)  throws DataAccessException;;
	
	/**
	 * 获取指定策略明细的参数信息
	 * @param detailid 明细ID
	 * @param paramtypeid 参数类型
	 * */
	public Set<Strategydetailparam> getStrategydetailparams(String detailid,Integer paramtypeid)  throws DataAccessException;;

	
}
