package com.managementsystem.energy.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Asset;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;


/**
 * 设备数据操作操作
 * 
 * @author CHENPING
 * */
public interface AssetDao extends DaoSupport {

	/**
	 * 获取所有设备台账信息
	 * 
	 * @param pageIndex 当前页次
	 * @param pageSize 每页显示条数
	 * @param mapParams 查询参数
	 * @return {@link Page}分页数据对象
	 * */
	public Page findAll(int pageIndex, int pageSize,Map<String,Object> mapParams) throws DataAccessException;
	
	/**
	 * 查找指定的设备信息
	 * @param assetuid 设备ID
	 * @return {@link Asset} 信息
	 * */
	public Asset findOne(long assetuid) throws DataAccessException;
	
	
	/**
	 * 查找设备信息
	 * @param assetnum 设备编码
	 * @return 设备{@link Asset}列表
	 * */
	public List<Asset> findByAssetnum(String assetnum) throws DataAccessException;
	
}
