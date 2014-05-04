package com.managementsystem.energy.dao;

import java.util.Map;
import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Buildgroupinfo;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;

/**
 * 建筑群数据操作接口
 * 
 * @author CHENPING 2012-06-14
 * */
public interface BuildgroupDao extends DaoSupport {
	
	/**
	 * 获取所有建筑群
	 * 
	 * @param startResult 开始行索引
	 * @param maxRows  获取条数
	 * 
	 * @return 所有建筑群
	 * */
	public Set<Buildgroupinfo> getBuildgroups(int startResult, int maxRows) throws DataAccessException;
	
	
	/**
	 * 获取所有建筑群
	 * 
	 * @param pageIndex 当前页码
	 * @param pageSize  每页条数
	 * @param mapParams	查询条件
	 * 
	 * @return 所有建筑群
	 * */
	public Page getBuildgroups(int pageIndex, int pageSize,Map<String,Object> mapParams);
	
	/**
	 * 获取数据中心建筑群
	 * @param datacenterId 数据中心ID
	 * @param startResult 开始行索引
	 * @param maxRows  获取条数
	 * 
	 * @return 数据中心建筑群
	 * */
	public Set<Buildgroupinfo> getBuildgrouiesByDatacenterId(String datacenterId,int startResult, int maxRows) throws DataAccessException;
	
	/**
	 * 获取建筑组对应的建筑信息
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * 
	 * @return 建筑信息分页对象
	 * */
	public Set<Buildinfo> getBuildinfosByBuildgroupId(int startResult, int maxRows,String BuildgroupId) throws DataAccessException;

	
	public Buildgroupinfo maxBuildgroupinfoByBuildDistrictid(String buildDistrictid) throws DataAccessException;
}
