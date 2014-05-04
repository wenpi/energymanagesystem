package com.managementsystem.energy.dao;

import java.util.Map;
import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Districtinfo;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;

/**
 * 行政区数据操作操作
 * 
 * @author CHENPING 2012-6-14
 * */
public interface DistrictDao extends DaoSupport {

	/**
	 * 获取行政区划信息
	 * @param startResult 开始行索引
	 * @param maxRows  获取条数
	 * 
	 * @return 行政区划数据列表
	 * */
	public Set<Districtinfo> getAllDistricts(int startResult, int maxRows) throws DataAccessException;
	
	
	/**
	 * 获取行政区划分页对象
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * @return 行政区划分页对象
	 * */
	public Page getDistricts(int pageIndex,int pageSize,Map<String,Object> mapParams) throws DataAccessException;
	
	/**
	 * 获取行政区划分页对象
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * @return 行政区划分页对象
	 * */
	public Page getDistrictsByCriterion(int pageIndex,int pageSize,Map<String,Object> mapParams) throws DataAccessException;
	

	
	
	/**
	 * 返回所有根行政区信息
	 * 
	 * @return 根行政区
	 * */
	public Set<Districtinfo> getRootDistricts(int startResult, int maxRows) throws DataAccessException;
	
	/**
	 * 返回子行政区划信息
	 * 
	 * @param districtId 上一级行政区划ID
	 * 
	 * @return 行政区划对应的所有子行政区划信息
	 * */
	public Set<Districtinfo> getDistrictsByParentId(String districtId,int startResult, int maxRows) throws DataAccessException;


	
	
}
