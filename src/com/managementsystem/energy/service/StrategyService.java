package com.managementsystem.energy.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.managementsystem.energy.domain.Strategy;
import com.managementsystem.energy.domain.Strategydetail;
import com.managementsystem.energy.domain.Strategydetailparam;
import com.managementsystem.ui.easyui.Tree;
import com.managementsystem.util.dao.Page;

public interface StrategyService {

	/**
	 * 新增策略
	 * 
	 * @param strategy
	 *            策略信息
	 * */
	public void addStrategy(Strategy strategy);

	/**
	 * 更新策略
	 * 
	 * @param strategy
	 *            策略信息
	 * */
	public void updateStrategy(Strategy strategy);
	
	
	/**
	 * 新增或更新策略.
	 * @param strategy
	 *            策略信息
	 * */
	public void saveOrUpdate(Strategy strategy);
	

	/**
	 * 删除策略
	 * 
	 * @param strategyid
	 *            策略ID
	 * 
	 * */
	public void deleteStrategy(String strategyid);

	/**
	 * 获取策略信息
	 * 
	 * @param strategyid
	 *            策略ID
	 * @return 策略信息
	 * */
	public Strategy getStrategy(String strategyid);
	
	/**
	 * 获取策略信息列表
	 * @param buildId 建筑ID
	 * @param pageIndex 当前索引页
	 * @param pageSize 每页显示条数
	 * @param mapParams 查询条件
	 * @return 策略分页对象
	 * */
	public Page getStrategies(String buildId,int pageIndex, int pageSize,Map<String,Object> mapParams);
	
	/**
	 * 获取策略信息列表
	 * @param buildId 建筑ID
	 * @return 策略列表对象
	 * */
	public Set<Strategy> getStrategies(String buildId);
	
	/**
	 * 返回所有父策略信息列表
	 * @param buildId 建筑ID
	 * */
	public List<Strategy> getParentStrategies(String buildId);
	
	/**
	 * 获取指定建筑的所有策略树状结构信息
	 * 
	 * @param buildId 建筑ID
	 *  
	 * @return 指定建筑的所有支路树状结构信息
	 * */
	public List<Tree> getStrategiesComboTree(String buildId);
	
	
	/**
	 * 新增策略明细对象
	 * @param strategydetail 策略明细对象
	 * */
	public void addStrategydetail(Strategydetail strategydetail);
	
	/**
	 * 更新策略明细对象
	 * @param strategydetail 策略明细对象
	 * */
	public void updateStrategydetail(Strategydetail strategydetail);
	
	/**
	 * 新增或更新策略明细对象
	 *  @param strategydetail 策略明细对象
	 * */
	public void saveOrUpdate(Strategydetail strategydetail);
	
	/**
	 * 删除策略明细对象
	 * @param detailid 策略明细对象ID
	 * */
	public void deleteStrategydetail(String detailid);
	
	/**
	 * 获取策略明细对象
	 * @param detailid 明细ID
	 * @return 策略明细对象
	 * */
	public Strategydetail getStrategydetail(String detailid);
	
	/**
	 * 获取指定策略的策略明细列表
	 * @param strategyid 策略ID
	 * @return 策略明细列表
	 * */
	public List<Strategydetail> getStrategydetails(String strategyid);
	
	/**
	 * 新增策略明细参数信息
	 * 
	 * @param strategydetailparam 参数对象
	 * */
	public void addStrategydetailparam(Strategydetailparam strategydetailparam);
	
	/**
	 * 更新策略明细参数信息
	 * 
	 * @param strategydetailparam 参数对象
	 * */
	public void updateStrategydetailparam(Strategydetailparam strategydetailparam);
	
	/**
	 * 新增或更新策略明细参数信息
	 * @param strategydetailparam 策略明细参数对象
	 * */
	public void saveOrUpdate(Strategydetailparam strategydetailparam);
	
	/**
	 * 删除策略明细参数信息
	 * 
	 * @param paramid 参数ID
	 * */
	public void deleteStrategydetailparam(String paramid);
	
	/**
	 * 获取策略明细参数信息
	 * 
	 * @param paramid 参数ID
	 * @return 明细参数信息
	 * */
	public Strategydetailparam getStrategydetailparam(String paramid);
	
	/**
	 *  获取指定策略明细的参数信息
	 *  
	 * @param detailid 明细ID
	 * @param paramtypeid 参数类型
	 * */
	public List<Strategydetailparam> getStrategydetailparamsBydetailid(String detailid);
	
	/**
	 *  获取指定策略明细的参数信息
	 *  
	 * @param detailid 明细ID
	 * @param paramtypeid 参数类型
	 * */
	public List<Strategydetailparam> getStrategydetailparams(String detailid,Integer paramtypeid);
	
	public void clearBlank(List<Strategydetailparam> detialparamslist);
}
