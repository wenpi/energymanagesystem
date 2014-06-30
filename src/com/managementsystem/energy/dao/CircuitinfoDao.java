package com.managementsystem.energy.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Circuitinfo;
import com.managementsystem.energy.domain.Reportinfo;
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
	 * 返回指定建筑指定text的所有支路信息
	 * 
	 * @param buildId
	 * @param text
	 * @param startResult
	 * @param maxRows
	 * @return
	 * @throws DataAccessException
	 */
	public Set<Circuitinfo> getCircuitinfosByText(String buildId, String text, int startResult, int maxRows) throws DataAccessException;
	
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
	
	/**
	 * 针对水表和气表的手动导入作的删除操作
	 * 
	 * @param text
	 * @param year
	 * @param month
	 */
	public void delCircuitinfoForWaterAndGas(String text, int year, int month) throws DataAccessException; 

	/**
	 * 获取有数据的支路信息时间列表
	 * 
	 * @param year
	 * @param text
	 * @throws Exception
	 */
	public List<Circuitinfo> getCircuitTimeList(String year, String text) throws Exception; 

	/**
	 * 根据年份和月份来获取对应的水表/气表数据
	 * 
	 * @param time
	 * @param text
	 * @param treeIds
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getCircuitDataList(String time, String text, String treeIds) throws Exception;

	/**
	 * 根据code和source判断是否存在记录
	 * 
	 * @param code
	 * @param source
	 * @return
	 * @throws DataAccessException
	 */
	public Circuitinfo getMaxCircuitinfoByCode(String code, String source) throws DataAccessException;

	/**
	 * 根据code和source判断是否存在记录
	 * 
	 * @param reportinfo
	 * @return
	 * @throws DataAccessException
	 */
	public Reportinfo getMaxReportinfo(Reportinfo reportinfo) throws DataAccessException;

	/**
	 * 更新水表、气表数据
	 * 
	 * @param reportinfo
	 * @throws DataAccessException
	 */
	public void updateReportinfo(Reportinfo reportinfo) throws DataAccessException;

	/**
	 * 更新circuitinfo表中的记录
	 * 
	 * @param circuitinfo
	 * @throws DataAccessException
	 */
	public void updateCircuitinfo(Circuitinfo circuitinfo) throws DataAccessException; 
}
