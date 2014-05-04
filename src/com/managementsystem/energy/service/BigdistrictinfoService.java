package com.managementsystem.energy.service;

import java.util.Map;
import java.util.Set;

import com.managementsystem.energy.domain.Bigdistrictinfo;
import com.managementsystem.energy.domain.Bigdistrictrelainfo;
import com.managementsystem.energy.domain.Districtinfo;
import com.managementsystem.util.dao.Page;

/**
 * 大区信息服务操作类
 * */
public interface BigdistrictinfoService {
	
	/**
	 * 保存或更新大区信息
	 * @param bigdistrictinfo 
	 * */
	public void saveOrUpdateBigdistrictinfo(Bigdistrictinfo bigdistrictinfo);
	
	/**
	 * 删除指定的大区信息
	 * 
	 * @param bigdistrictId 大区ID
	 * 
	 * */
	public void deleteBigdistrictinfo(String bigdistrictId) throws NullPointerException;
	
	/**
	 * 获取指定的大区信息
	 * 
	 * @param bigdistrictId	大区ID
	 * 
	 * @return 指定的大区信息
	 * */
	public Bigdistrictinfo getBigdistrictinfo(String bigdistrictId);
	
	/**
	 * 获取所有大区信息
	 * */
	public Set<Bigdistrictinfo> getBigdistrictinfos();
	
	/**
	 * 获取所有大区信息
	 * */
	public Set<Bigdistrictinfo> getBigdistrictinfos(int startResult, int maxRows);
	
	
	/**
	 * 获取所有大区分页列表
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * @return 大区分页对象
	 * */
	public Page getBigdistrictinfos(int pageIndex,int pageSize,Map<String,Object> mapParams);
	
	
	/**
	 * 获取所有根大区信息
	 * 
	 * @param startResult 开始行
	 * @param maxRows	获取条数
	 * 
	 * @return 所有根大区信息
	 * */
	public Set<Bigdistrictinfo> getRootBigdistrictinfos();
	/**
	 * 获取所有根大区信息
	 * 
	 * @param startResult 开始行
	 * @param maxRows	获取条数
	 * 
	 * @return 所有根大区信息
	 * */
	public Set<Bigdistrictinfo> getRootBigdistrictinfos(int startResult, int maxRows);
	
	/**
	 * 获取指定所属大区的区域列表
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * @param bigdistrictId 大区ID
	 * @return 大区分页对象
	 * */
	public Page getDistrictinfosByBigdistrictId(int pageIndex,int pageSize,String bigdistrictId);
	
	/**
	 * 保存或更新气候区辖行政区范围 
	 * @param bigdistrictrelainfo 气候区辖行政区对象
	 * */
	public void saveOrUpdateBigdistrictrelainfo(Bigdistrictrelainfo bigdistrictrelainfo);
	
	/**
	 * 删除指定的气候区辖行政区对象
	 * 
	 * @param relationId 关系ID
	 * 
	 * */
	public void deleteBigdistrictrelainfo(String relationId) throws NullPointerException;
	
	/**
	 * 获取指定关系ID的气候区辖行政区对象
	 * @param relationId 关系ID
	 * */
	public Bigdistrictrelainfo getBigdistrictrelainfo(String relationId);
	
	public Bigdistrictinfo  getBigdistrictinfo (Districtinfo districtinfo);
	
}
