package com.managementsystem.energy.dao;

import java.util.Map;
import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Datacenterinfo;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;

/**
 * 数据中心信息数据操作接口类
 * 
 * @author CHENPING 2012-6-14
 * */
public interface DatacenterDao extends DaoSupport {
	
	/**
	 * 获取所有数据中心
	 * 
	 * @param startResult 开始行索引
	 * @param maxRows  获取条数
	 * 
	 * @return 所有数据中心数据
	 * */
	public Set<Datacenterinfo> getDatacenters(int startResult, int maxRows)  throws DataAccessException;

	/**
	 * 获取所有数据中心
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * 
	 * @return 数据中心分页对象
	 * */
	public Page getPagedDatacenters(int pageIndex,int pageSize) throws DataAccessException;
	
	/**
	 * 获取指定类型的数据中心
	 * 
	 * @param type 数据中心类型
	 * @param startResult 开始行索引
	 * @param maxRows  获取条数
	 * 
	 * @return 数据中心数据
	 * */
	public Set<Datacenterinfo> getDatacentersByType(int type,int startResult, int maxRows)  throws DataAccessException;
	
	/**
	 * 获取指定类型的数据中心
	 * 
	 * @param type 数据中心类型
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * 
	 * @return 数据中心数据分页对象
	 * */
	public Page getPagedDatacentersByType(int type,int pageIndex,int pageSize) throws DataAccessException;
	
	public Page getPagedDatacentersBySearch(String hql,int pageIndex,int pageSize,Map<String,Object> mapCondition) throws DataAccessException;
}
