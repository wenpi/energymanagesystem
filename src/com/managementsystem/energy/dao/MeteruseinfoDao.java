package com.managementsystem.energy.dao;

import java.util.Map;
import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Meteruseattribute;
import com.managementsystem.energy.domain.Meteruseinfo;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;

/**
 * 监测仪表使用信息数据操作接口
 * 
 * @author CHENPING 2012-6-15
 * */
public interface MeteruseinfoDao extends DaoSupport {
	
	/**
	 * 获取所有监测仪表使用信息
	 * 
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 所有监测仪表使用信息
	 * */
	public Set<Meteruseinfo> getMeteruseinfos(int startResult, int maxRows) throws DataAccessException;
	
	/**
	 * 获取所有监测仪表使用信息
	 * 
	 * @param pageIndex 当前页码
	 * @param pageSize	显示行数	 -1为显示全部
	 * @param mapParams	查询条件MAP
	 * 
	 * @return 所有监测仪表使用信息
	 * */
	public Page getMeteruseinfos(int pageIndex, int pageSize,Map<String,Object> mapParams) throws DataAccessException;
	
	/**
	 * 获取指定支路的所有监测仪表使用信息
	 * 
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定支路的所有监测仪表使用信息
	 * */
	public Set<Meteruseinfo> getMeteruseinfosByCircuitId(String circuitId,int startResult, int maxRows) throws DataAccessException;
	
	
	/**
	 * 获取指定区域的所有监测仪表使用信息
	 * 
	 * @param regionId 区域ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定支路的所有监测仪表使用信息
	 * */
	public Set<Meteruseinfo> getMeteruseinfosByRegionId(String regionId,int startResult, int maxRows) throws DataAccessException;
	
	
	/**
	 * 获取指定仪表产品ID的所有监测仪表使用信息
	 * 
	 * @param meterProductid 仪表产品ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定仪表产品ID的所有监测仪表使用信息
	 * */
	public Set<Meteruseinfo> getMeteruseinfosByMeterProductid(String meterProductid,int startResult, int maxRows) throws DataAccessException;
	
	
	
	/**
	 * 获取指定建筑的所有监测仪表使用信息
	 * 
	 * @param buildId 建筑ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定建筑的所有监测仪表使用信息
	 * */
	public Set<Meteruseinfo> getMeteruseinfosByMeterBuildid(String buildId,int startResult, int maxRows) throws DataAccessException;

	
	/**
	 * 获取指定仪表ID的仪表属性
	 * 
	 * @param meterId 仪表ID
	 * 
	 * @return 指定仪表ID的仪表属性
	 * */
	public Set<Meteruseattribute> getMeteruseattributeByMeterId(String meterId) throws DataAccessException;
	
	/**
	 * 获取ID最大的仪表
	 * */
	public Meteruseinfo getMaxMeteruseinfoForMeterId(Meteruseinfo meteruseinfo) throws DataAccessException;
	
	/**
	 * 获取指定建筑的设备属性
	 * @param buildId 建筑ID
	 * @return 指定建筑的设备属性
	 * */
	public Set<Meteruseattribute> getMeteruseattributesByBuildId(String buildId) throws DataAccessException;
	
}
