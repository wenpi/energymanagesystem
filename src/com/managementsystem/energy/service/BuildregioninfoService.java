package com.managementsystem.energy.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Buildregioninfo;
import com.managementsystem.ui.easyui.Tree;
import com.managementsystem.util.dao.Page;

/**
 * 建筑区域字典服务接口类
 * */
public interface BuildregioninfoService {
	
	/**
	 * 新增建筑区域字典信息
	 * 
	 * @param buildregioninfo 区域字典信息
	 * */
	public void addBuildregioninfo(Buildregioninfo buildregioninfo);
	
	/**
	 * 更新建筑区域字典信息
	 * 
	 * @param buildregioninfo 区域字典信息
	 * */
	public void updateBuildregioninfo(Buildregioninfo buildregioninfo);
	
	/**
	 * 保存或更新建筑区域字典信息
	 * 
	 * @param buildregioninfo 区域字典信息
	 * */
	public void saveOrUpdateBuildregioninfo(Buildregioninfo buildregioninfo);
	
	/**
	 * 更新建筑区域字典信息
	 * 
	 * @param regionId 区域ID
	 * */
	public void deleteBuildregioninfo(String regionId);
	
	/**
	 * 获取建筑区域字典信息
	 * 
	 * @param regionId 区域ID
	 * 
	 * @return 建筑区域字典信息
	 * */
	public Buildregioninfo getBuildregioninfo(String regionId);
	

	/**
	 * 获取指定建筑的区域定义信息
	 * 
	 * @param buildId 建筑ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 所有支路信息
	 * */
	public Set<Buildregioninfo> getBuildregioninfos(String buildId);
			
	/**
	 * 获取指定建筑的区域定义信息
	 * 
	 * @param buildId 建筑ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 所有支路信息
	 * */
	public Set<Buildregioninfo> getBuildregioninfos(String buildId,int startResult, int maxRows);
	
	
	/**
	 * 获取指定建筑的根区域信息
	 * 
	 * @param buildId 建筑ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定建筑的根区域信息
	 * */
	public Set<Buildregioninfo> getParentBuildregioninfos(String buildId);
	
	/**
	 * 获取指定区域ID的下级分区信息
	 * 
	 * @param parentId 区域ID
	 * 
	 * @return 指定区域ID的下级分区信息
	 * */
	public Set<Buildregioninfo> getBuildregioninfosByParentId(String parentId);
	
	
	/**
	 * 获取指定建筑的根区域信息
	 * 
	 * @param buildId 建筑ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定建筑的根区域信息
	 * */
	public Set<Buildregioninfo> getParentBuildregioninfos(String buildId,int startResult, int maxRows);
	
	/**
	 * 获取指定建筑的区域信息
	 * 
	 * @param buildId 建筑ID
	 * 
	 * @return 指定建筑的区域信息树
	 * */
	public List<Tree> getBuildregionComboTree(String buildId);
	
	
	/**
	 *  获取所有建筑的区域定义信息
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * @return 所有支路信息
	 * */
	public Page getBuildregioninfos(String buildId,int pageIndex,int pageSize,Map<String,Object> mapParams);
	
	public List<Tree> getBuildregionComboTree(List<Buildinfo>buildinfosList);
}
