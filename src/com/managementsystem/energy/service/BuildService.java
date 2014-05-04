package com.managementsystem.energy.service;

import java.util.Map;
import java.util.Set;

import com.managementsystem.energy.domain.Buildaddfile;
import com.managementsystem.energy.domain.Buildexinfo;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Buildsettinginfo;
import com.managementsystem.util.dao.Page;

/**
 * 建筑信息服务接口类
 * 
 * @author CHENPING 2012-06-14
 * */
public interface BuildService {

	/**
	 * 新增建筑信息
	 * 
	 * @param buildinfo 建筑信息
	 * */
	public void addBuildinfo(Buildinfo buildinfo);
	
	/**
	 * 修改建筑信息
	 * 
	 * @param buildinfo 建筑信息
	 * */
	public void updateBuildinfo(Buildinfo buildinfo);
	
	/**
	 * 删除建筑信息
	 * 
	 * @param buildId 建筑ID
	 * */
	public void deleteBuildinfo(String buildId);

	
	/**
	 * 返回建筑基本信息
	 * @param buildId 建筑ID
	 * 
	 * @return 返回建筑信息
	 * */
	public Buildinfo getBuildinfo(String buildId);
	
	
	/**
	 * 新增或更新建筑扩展信息
	 * 
	 * @param buildexinfo 建筑扩展信息
	 * */
	public void saveOrUpdateBuildexinfo(Buildexinfo buildexinfo);
	
	
	/**
	 * 删除建筑扩展信息
	 * 
	 * @param buildId 建筑ID
	 * */
	public void deleteBuildexinfo(String buildId);
	
	
	/**
	 * 返回建筑扩展信息
	 *  @param buildId 建筑ID
	 *  
	 *  @return 返回建筑扩展信息
	 * */
	public Buildexinfo getBuildexinfo(String buildId);
	
	/**
	 * 新增建筑附加信息
	 * 
	 * @param buildaddfile 建筑附加信息
	 * */
	public void addBuildaddfile(Buildaddfile buildaddfile);
	
	/**
	 * 更新建筑附加信息
	 * 
	 * @param buildaddfile 建筑附加信息
	 * */
	public void updateBuildaddfile(Buildaddfile buildaddfile);
	
	/**
	 * 设置建筑封面
	 * @param buildaddfile 建筑附加信息
	 * */
	public void setBuildcover(Buildaddfile buildaddfile);
	

	/**
	 * 获取建筑封面
	 * @param buildId 
	 * 
	 * @return 建筑信息
	 * */
	public Buildinfo getBuildcover(String buildId);
	
	/**
	 * 删除建筑附加信息
	 * 
	 * @param addfileId 附加信息ID
	 * */
	public void deleteBuildaddfile(String addfileId);
	
	/**
	 * 获取建筑附加信息
	 * 
	 * @param addfileId 附加信息ID
	 * */
	public Buildaddfile getBuildaddfile(String addfileId);
	

	/**
	 * 新增或更新建筑设置信息
	 * 
	 * @param buildsettinginfo 建筑设置信息
	 * */
	public void saveOrUpdateBuildsettinginfo(Buildsettinginfo buildsettinginfo);
	
	
	/**
	 * 删除建筑设置信息
	 * 
	 * @param buildId 建筑设置ID
	 * */
	public void deleteBuildsettinginfo(String buildId);
	
	/**
	 * 获取建筑设置信息
	 * 
	 * @param buildId 建筑设置ID
	 * */
	public Buildsettinginfo getBuildsettinginfo(String buildId);
	
	/**
	 * 获取所有建筑信息
	 * 
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 所有建筑信息
	 * */
	public Set<Buildinfo> getAllBuilds(int startResult, int maxRows);
	
	/**
	 * 获取指定气候区拥有的建筑
	 * 
	 * @param bigdistrictId 气候区ID
	 * 
	 * @return 指定气候区拥有的建筑
	 * */
	public Set<Buildinfo> getBuildinfosByBigdistrictId(String bigdistrictId);
	
	/**
	 * 查询建筑
	 * */
	public Set<Buildinfo> findBuildinfosByBuildfunc(int buildfunc,int topnum);
	
	
	/**
	 * 获取所有建筑全部信息(包括封面和能耗信息)
	 * @return 所有建筑全部信息(包括封面和能耗信息)
	 * */
	public Set<Buildinfo> getBuildFullinfos();
	
	/**
	 * 获取指定数据中心的建筑信息
	 * 
	 * @param datecenterId 数据中心
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * 
	 * @return 数据中心的建筑信息列表
	 * */
	public Page getBuildsByDatacenterId(String datecenterId,int pageIndex, int pageSize);
	
	/**
	 * 获取建筑信息
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * 
	 * @return 建筑信息分页对象
	 * */
	public Page getBuildinfos(int pageIndex, int pageSize);
	
	
	/**
	 * 获取建筑附加信息
	 * 
	 * @param buildId 建筑ID
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * 
	  * @return 建筑附加信息
	 * */
	public Page getBuildaddfiles(String buildId,int pageIndex, int pageSize);
	
	/**
	 * 获取指定建筑的附件信息
	 * @param buildId 建筑ID
	 * */
	public Set<Buildaddfile> getBuildaddfilesByBuildid(String buildId);
	
	
	/**
	 * 获取指定功能类型的建筑附加信息
	 * 
	 * @param buildId 建筑ID
	 * @param functype 功能类型ID
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * 
	  * @return 建筑附加信息
	 * */
	public Page getBuildaddfilesByFunctype(String buildId,int functype,int pageIndex, int pageSize);
	
	public Page getBuildinfos(int pageIndex,int pageSize,Map<String,Object> mapCondition);
}
