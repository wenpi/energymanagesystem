package com.managementsystem.energy.service;

import java.util.Map;
import java.util.Set;

import com.managementsystem.energy.domain.Buildgroupinfo;
import com.managementsystem.energy.domain.Buildgrouprelainfo;
import com.managementsystem.energy.domain.BuildgrouprelainfoId;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.util.dao.Page;

/**
 * 建筑群操作服务操作
 * */
public interface BuildgroupService {

	/**
	 * 新增建筑群信息
	 * 
	 * @param buildgroupinfo 建筑群信息
	 * */
	public void addBuildgroupinfo(Buildgroupinfo buildgroupinfo);
	
	/**
	 * 更新建筑群信息
	 * 
	 * @param buildgroupinfo 建筑群信息
	 * */
	public void updateBuildgroupinfo(Buildgroupinfo buildgroupinfo);
	
	
	/**
	 * 更新建筑群信息
	 * 
	 * @param buildgroupId 建筑群信息ID
	 * */
	public void deleteBuildgroupinfo(String buildgroupId);
	
	/**
	 * 获取建筑群信息
	 * 
	 * @param buildgroupId 建筑群信息ID 
	 * */
	public Buildgroupinfo getBuildgroupinfo(String buildgroupId);
	
	
	/**
	 * 保存建筑群和建筑关联信息
	 * 
	 * @param buildgroupinfo 建筑群信息
	 * */
	public void addBuildgrouprelainfo(Buildgrouprelainfo buildgrouprelainfo);
	
	/**
	 * 删除建筑群和建筑关联信息
	 * 
	 * @param BuildgrouprelainfoId 关联ID
	 * */
	public void deleteBuildgrouprelainfo(BuildgrouprelainfoId id);
	
	
	/**
	 * 获取所有建筑群
	 * 
	 * @return 所有建筑群
	 * */
	public Set<Buildgroupinfo> getBuildgroups();
	
	/**
	 * 获取所有建筑群
	 * @param startResult 开始行索引
	 * @param maxRows  获取条数
	 * 
	 * @return 所有建筑群
	 * */
	public Set<Buildgroupinfo> getBuildgroups(int startResult, int maxRows);
	
	/**
	 * 获取数据中心建筑群
	 * 
	 * @param datacenterId 数据中心ID
	 * 
	 * @return 数据中心建筑群
	 * */
	public Set<Buildgroupinfo> getBuildgrouiesByDatacenterId(String datacenterId);
	/**
	 * 获取数据中心建筑群
	 * @param datacenterId 数据中心ID
	 * @param startResult 开始行索引
	 * @param maxRows  获取条数
	 * 
	 * @return 数据中心建筑群
	 * */
	public Set<Buildgroupinfo> getBuildgrouiesByDatacenterId(String datacenterId,int startResult, int maxRows);
	
	/**
	 * 获取建筑分组信息
	 * */
	public  Set<Buildinfo> getBuildinfosByBuildgroupId(int startResult, int maxRows,String buildgroupId);
	
	
	public Page getBuildgroups(int pageIndex, int pageSize,Map<String, Object> mapParams);
	
}
