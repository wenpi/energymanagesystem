package com.managementsystem.energy.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.managementsystem.energy.domain.Circuitinfo;
import com.managementsystem.energy.domain.CircuitinfoTree;
import com.managementsystem.ui.easyui.Tree;
import com.managementsystem.util.dao.Page;

/**
 * 装表支路拓扑结构服务接口类
 * 
 * @author CHENPING
 * */
public interface CircuitinfoService {
	
	/**
	 * 新增支路信息，针对能源平台
	 * 
	 * @param circuitinfo 支路信息
	 * */
	public void addCircuitinfoForEnergy(Circuitinfo circuitinfo);

	/**
	 * 针对水表和气表的手动导入作的删除操作
	 * 
	 * @param text
	 * @param year
	 * @param month
	 */
	public void delCircuitinfoForWaterAndGas(String text, int year, int month);
	
	/**
	 * 新增支路信息
	 * 
	 * @param circuitinfo 支路信息
	 * */
	public void addCircuitinfo(Circuitinfo circuitinfo);
	
	/**
	 * 更新支路信息
	 * 
	 * @param circuitinfo 支路信息
	 * */
	public void updateCircuitinfo(Circuitinfo circuitinfo);
	
	/**
	 * 删除支路信息
	 * 
	 * @param circuitId 支路ID
	 * */
	public void deleteCircuitinfo(String circuitId);
	
	/**
	 * 返回支路信息
	 * 
	 * @param circuitId 支路ID
	 * */
	public Circuitinfo getCircuitinfo(String circuitId);
	
	/**
	 * 返回指定建筑的所有支路信息
	 * 
	 *  @param buildId 建筑ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定建筑的所有支路信息
	 * */
	public Set<Circuitinfo> getCircuitinfos(String buildId,int startResult, int maxRows);
	
	/**
	 * 返回指定建筑的所有支路信息
	 * 
	 * @param buildId 建筑ID
	 *  
	 * @return 指定建筑的所有支路信息
	 * */
	public Set<Circuitinfo> getCircuitinfos(String buildId);
	
	/**
	 * 获取指定建筑的所有根支路信息
	 * 
	 * @param buildId 建筑ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定建筑的所有根支路信息
	 * */
	public Set<Circuitinfo> getParentCircuitinfos(String buildId,int startResult, int maxRows);
	
	/**
	 * 获取指定建筑的所有根支路信息
	 * 
	 * @param buildId 建筑ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定建筑的所有根支路信息
	 * */
	public Set<Circuitinfo> getParentCircuitinfos(String buildId);
	
	/**
	 * 获取指定建筑的所有支路树状结构信息
	 * 
	 * @param buildId 建筑ID
	 *  
	 * @return 指定建筑的所有支路树状结构信息
	 * */
	public List<Tree> getCircuitComboTree(String buildId);
	
	/**
	 * 获取指定建筑的所有支路树状结构信息
	 * @author zouzhixiang create 2013-12-05
	 * @param buildId
	 * @param text
	 * @return
	 */
	public List<CircuitinfoTree> getCircuitTreeByBuildId(String buildId, String text);
	
	/**
	 * 获取指定建筑的所有支路仪表使用树状结构信息
	 * */
	public List<Tree> getCircuitMeteruseinfosToComboTree(String buildId);
	
	/**
	 * 获取所有支路信息
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize	每页显示条数
	 * @param mapParams	查询条件参数
	 * 
	 * @return 所有支路信息
	 * */
	public Page getCircuitinfos(int pageIndex,int pageSize,Map<String,Object> mapParams);
}
