package com.managementsystem.energy.service;

import java.util.Map;
import java.util.Set;

import com.managementsystem.energy.domain.Districtinfo;
import com.managementsystem.util.dao.Page;

/**
 * 行政区划信息操作服务接口
 * 
 * @author CHENPING 2012-06-04
 * */
public interface DistrictService {
	
	/**
	 * 新增行政区划信息
	 * 
	 * @param districtinfo 行政区划信息
	 * */
	public void addDistrictinfo(Districtinfo districtinfo);
	
	/**
	 * 更新行政区划信息
	 * 
	 * @param districtinfo 行政区划信息
	 * */
	public void updateDistrictinfo(Districtinfo districtinfo);
	
	/**
	 * 删除行政区划信息
	 * 
	 * @param districtId 行政区划信息ID
	 * */
	public void deleteDistrictinfo(String districtId);
	
	
	/**
	 * 获取行政区划信息
	 * 
	 * @param datecenterId 行政区划ID
	 * 
	 * @return 行政区划信息
	 * */
	public Districtinfo getDistrictinfo(String districtId);
	
	
	/**
	 * 获取行政区划信息
	 * @param startResult 开始行索引
	 * @param maxRows  获取条数
	 * 
	 * @return 行政区划数据列表
	 * */
	public Set<Districtinfo> getAllDistricts(int startResult, int maxRows);
	

	/**
	 * 返回所有根行政区信息
	 * 
	 * @return 根行政区
	 * */
	public Set<Districtinfo> getRootDistricts(int startResult, int maxRows);
	
	/**
	 * 返回子行政区划信息
	 * 
	 * @param districtId 上一级行政区划ID
	 * 
	 * @return 行政区划对应的所有子行政区划信息
	 * */
	public Set<Districtinfo> getDistrictsByParentId(String districtId,int startResult, int maxRows);
	
	/**
	 * 获取行政区号分页查询数据
	 * 
	 * @param pageIndex 当前页索引
	 * @param pageSize 每页显示数
	 * @param mapCondition 查询条件
	 * */
	public Page getPagedDictgrouies(int pageIndex,int pageSize,Map<String,Object> mapCondition);
}
