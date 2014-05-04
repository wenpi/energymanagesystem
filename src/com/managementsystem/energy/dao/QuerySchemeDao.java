package com.managementsystem.energy.dao;

import java.util.List;
import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.QueryScheme;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;

public interface QuerySchemeDao extends DaoSupport {

	/**
	 * 查找所有查询方案
	 * @param buildId 建筑ID
	 * @return 查询方案列表
	 * */
	public Set<QueryScheme> findAllQueryScheme(String buildId,int startResult, int maxRows) throws DataAccessException;
	
	/**
	 * 查找指定类别的查询项
	 * @param buildId 建筑ID
	 * @param categoryId 类别ID
	 * @return 查询方案列表
	 * */
	public Set<QueryScheme> findByCategoryId(String buildId,String categoryId) throws DataAccessException;
	
	/**
	 * 查找所有子查询方案
	 * @param schemeId 方案ID
	 * @return 查询方案参数列表
	 * */
	public Set<QueryScheme> findChildQuerySchemesByParentId(String schemeId) throws DataAccessException;
	
	
	/**
	 * 获取建筑信息
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * 
	 * @return 建筑信息分页对象
	 * */
	public Page getAllQueryScheme(int pageIndex, int pageSize) throws DataAccessException;

	/**
	 * 获取配置表中的信息
	 * 
	 * @param id
	 * @param name
	 * @param comments
	 * @param buildId
	 * @param regionId
	 * @return
	 */
	List<QueryScheme> getQuerySchemeListByCondition(String id, String name, String comments, String buildId, String regionId); 
}
