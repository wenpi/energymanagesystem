package com.managementsystem.energy.dao;

import java.util.Map;
import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Energyitemdict;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;

/**
 * 能耗分项计量数据操作接口
 * 
 * @author CHENPING 2012-06-14
 * */
public interface EnergyitemdictDao extends DaoSupport {
	
	/**
	 * 获取所有分项计量定义数据
	 * 
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 所有分项计量定义数据
	 * */
	public Set<Energyitemdict> getEnergyitemdicts(int startResult, int maxRows) throws DataAccessException;
	

	/**
	 * 获取所有分类定义数量
	 * 
	 * */
	public Set<Energyitemdict> getEnergyitemdictsByType() throws DataAccessException; 
	
	
	/**
	 * 获取所有分项计量定义数据
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * 
	 * @return 分项计量定义数据分页对象
	 * */
	public Page getPagedEnergyitemdicts(int pageIndex,int pageSize) throws DataAccessException;
	
	public Page getPagedEnergyitemdict(int pageIndex,int pageSize,Map<String,Object> mapParams) throws DataAccessException;
	
	public Page getPagedEnergyitemdictsByType(int pageIndex,int pageSize) throws DataAccessException;
	
}
