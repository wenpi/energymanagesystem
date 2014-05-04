package com.managementsystem.energy.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Articlecategory;
import com.managementsystem.energy.domain.Buildaddfile;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;

/**
 * 建筑信息数据操作接口类,包含建筑基本信息、扩展信息、附加文件的数据操作
 * 
 * */
public interface BuildDao extends DaoSupport {
	
	/**
	 * 设置建筑封面
	 * @param buildaddfile 建筑附件
	 * */
	public void setBuildcover(Buildaddfile buildaddfile)  throws DataAccessException;
	
	/**
	 * 获取建筑封面
	 * @param buildId 
	 * 
	 * @return 建筑信息
	 * */
	public Buildaddfile getBuildcover(String buildId) throws DataAccessException;
	
	/**
	 * 获取所有建筑信息
	 * 
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 所有建筑信息
	 * */
	public Set<Buildinfo> getAllBuilds(int startResult, int maxRows) throws DataAccessException;
	
	/**
	 * 获取指定气候区拥有的建筑
	 * 
	 * @param bigdistrictId 气候区ID
	 * 
	 * @return 指定气候区拥有的建筑
	 * */
	public Set<Buildinfo> getBuildinfosByBigdistrictId(String bigdistrictId) throws DataAccessException;
	
	
	/**
	 * 获取指定数据中心的建筑信息
	 * 
	 * @param datecenterId 数据中心
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * 
	 * @return 数据中心的建筑信息列表
	 * */
	public Page getBuildinfosByDatacenterId(String datecenterId,int pageIndex, int pageSize) throws DataAccessException;
	
	/**
	 * 获取建筑信息
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * 
	 * @return 建筑信息分页对象
	 * */
	public Page getBuildinfos(int pageIndex, int pageSize) throws DataAccessException;
	
	
	/**
	 * 获取指定建筑的附加信息
	 * 
	 * @param buildId 建筑ID
	 * @param startResult 当前页
	 * @param maxRows 每页显示数
	 * 
	  * @return 建筑附加信息
	 * */
	public Set<Buildaddfile> getBuildaddfilesByBuildid(int startResult, int maxRows,String buildId) throws DataAccessException;
	
	/**
	 * 获取建筑附加信息
	 * 
	 * @param buildId 建筑ID
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * 
	  * @return 建筑附加信息
	 * */
	public Page getBuildaddfiles(String buildId,int pageIndex, int pageSize)  throws DataAccessException;
	
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
	public Page getBuildaddfilesByFunctype(String buildId,int functype,int pageIndex, int pageSize) throws DataAccessException;
	
	/**
	 * 获取指定群组的所有建筑
	 * @param buildgroupId 建筑群组ID
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * 
	 * @return 指定群组的所有建筑
	 * */
	public Page getBuildinfosByBuildgroupId(String buildgroupId,int pageIndex,int pageSize) throws DataAccessException;
	
	public Page getBuildinfos(int pageIndex,int pageSize,Map<String,Object> mapParams) throws DataAccessException;
	
	/**
	 * 获取指定数据中心BuildId最大的BuildInfo
	 * @param datacenterId 数据中心ID
	 * @return 建筑信息
	 * */
	public Buildinfo getMaxBuildIdByDatecenterId(String datacenterId) throws DataAccessException;
	
	public Set<Buildinfo> findBuildinfosByBuildfunc(int buildfunc,int topnum) throws DataAccessException;
	
	public List<Buildinfo>  getBuildinfo () throws DataAccessException;        
	
}
