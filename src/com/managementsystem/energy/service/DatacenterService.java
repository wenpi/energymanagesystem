package com.managementsystem.energy.service;

import java.util.Map;
import java.util.Set;

import org.hibernate.criterion.Criterion;

import com.managementsystem.energy.domain.Datacenterinfo;
import com.managementsystem.util.dao.Page;

/**
 * 数据中心服务接口类
 * 
 * @author CHENPING 2012-06-14
 * 
 * */
public interface DatacenterService {

	/**
	 * 添加数据中心信息
	 * 
	 * @param datacenterinfo 数据中心信息
	 * 
	 * */
	public void addDatacenterinfo(Datacenterinfo datacenterinfo);	
	
	/**
	 * 更新数据中心信息
	 * 
	 * @param datacenterinfo 数据中心信息
	 * 
	 * */
	public void updateDatacenterinfo(Datacenterinfo datacenterinfo);	
	

	/**
	 * 删除数据中心信息
	 * 
	 * @param datacenterId 数据中心ID
	 * 
	 * */
	public void deleteDatacenterinfo(String datacenterId);	
	
	
	/**
	 * 获取指定的数据中心
	 * 
	 * @param datacenterId 数据中心ID
	 * 
	 * @return 数据中心数据
	 * */
	public Datacenterinfo getDatacenterinfo(String datacenterId);
	
	/**
	 * 获取所有数据中心
	 * 
	 * @return 所有数据中心数据
	 * */
	public Set<Datacenterinfo> getDatacenters();
	
	/**
	 * 获取所有数据中心
	 * 
	 * @return 所有数据中心数据
	 * */
	public Set<Datacenterinfo> getDatacenters(int startResult, int maxRows);
	
	/**
	 * 获取指定类型的数据中心
	 * 
	 * @param type 数据中心类型
	 * 
	 * @return 数据中心数据
	 * */
	public Set<Datacenterinfo> getDatacentersByType(int type);
	
	/**
	 * 获取指定类型的数据中心
	 * 
	 * @param type 数据中心类型
	 * 
	 * @return 数据中心数据
	 * */
	public Set<Datacenterinfo> getDatacentersByType(int type,int startResult, int maxRows);
	
	/**
	 * 获取所有数据中心
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * 
	 * @return 数据中心分页对象
	 * */
	public Page getPagedDatacenters(int pageIndex,int pageSize);
	
	/**
	 * 获取指定类型的数据中心
	 * 
	 * @param type 数据中心类型
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * 
	 * @return 数据中心数据分页对象
	 * */
	public Page getPagedDatacentersByType(int type,int pageIndex,int pageSize);
	
	public Page getPagedDatacentersBySearch(int pageIndex,int pageSize,String id,String name,String type);
	
}
