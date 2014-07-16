package com.managementsystem.energy.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.managementsystem.energy.domain.QueryScheme;
import com.managementsystem.util.dao.Page;

/**
 * 查询方案业务逻辑服务接口
 * 
 * @author CHENPING 2013-08-07
 * */
public interface QuerySchemeService {

	/**
	 * 查找所有查询方案
	 * 
	 * @param buildId
	 *            建筑ID
	 * @return 查询方案列表
	 * */
	public Set<QueryScheme> findAllQueryScheme(String buildId);

	/**
	 * 查找所有子查询方案
	 * 
	 * @param schemeId
	 *            方案ID
	 * @return 查询方案参数列表
	 * */
	public Set<QueryScheme> findChildQuerySchemesByParentId(String schemeId);

	/**
	 * 返回分页的查询方案
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public Page getAllQueryScheme(int pageIndex, int pageSize);

	/**
	 * 获取配置表中的信息
	 * 
	 * @param id
	 * @param name
	 * @param comments
	 * @param buildId
	 * @param regionId
	 * @param order
	 * @return
	 */
	public List<QueryScheme> getQuerySchemeListByCondition(String id, String name, String comments, String buildId, String regionId, String order); 
	
	/**
	 * 
	 * @param id
	 * @param name
	 * @param comments
	 * @param category_id
	 * @param region_id
	 * @return
	 */
	public Map<String, Object> getDataListByCondition(String id, String name, String comments, String category_id, String region_id); 

}
