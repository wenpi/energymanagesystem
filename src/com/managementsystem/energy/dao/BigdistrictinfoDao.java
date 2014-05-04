package com.managementsystem.energy.dao;

import java.util.Map;
import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Bigdistrictinfo;
import com.managementsystem.energy.domain.Districtinfo;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;

/**
 * 地区大区分信息
 * */
public interface BigdistrictinfoDao extends DaoSupport {

	/**
	 * 获取所有大区信息
	 * */
	public Set<Bigdistrictinfo> getBigdistrictinfos(int startResult, int maxRows) throws DataAccessException;
	
	/**
	 * 获取所有大区分页列表
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * @return 大区分页对象
	 * */
	public Page getBigdistrictinfos(int pageIndex,int pageSize,Map<String,Object> mapParams) throws DataAccessException;
	
	/**
	 * 获取所有根大区信息
	 * 
	 * @param startResult 开始行
	 * @param maxRows	获取条数
	 * 
	 * @return 所有根大区信息
	 * */
	public Set<Bigdistrictinfo> getRootBigdistrictinfos(int startResult, int maxRows) throws DataAccessException;
	
	/**
	 * 获取指定所属大区的区域列表
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * @param bigdistrictId 大区ID
	 * @return 大区分页对象
	 * */
	public Page getDistrictinfosByBigdistrictId(int pageIndex,int pageSize,String bigdistrictId) throws DataAccessException;
	
	public Bigdistrictinfo getBigdistrictinfo(Districtinfo districtinfo) throws DataAccessException;
	
}
