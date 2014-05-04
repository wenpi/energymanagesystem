package com.managementsystem.energy.dao;

import java.util.Map;
import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Meterparaminfo;
import com.managementsystem.energy.domain.Meterproinfo;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;

/**
 * 仪表设备数据操作接口类
 * 
 * @author CHENPING 2012-06-14
 * */
public interface MeterproDao extends DaoSupport {
	
	/**
	 * 获取仪表设备数据
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * 
	 * @return 仪表设备数据分页对象
	 * */
	public Page getMeterproinfos(int pageIndex, int pageSize,Map<String, Object> mapParams) throws DataAccessException;
	
	/**
	 * 获取指定类型的仪表设备数据
	 * 
	 * @param type 仪表类型
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * 
	 * @return 仪表设备数据分页对象
	 * */
	public Page getMeterproinfosByType(int type,int pageIndex, int pageSize) throws DataAccessException;
	
	
	/**
	 * 获取相似名称的仪表设备数据
	 * 
	 * @param productname 仪表名称
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * 
	 * @return 仪表设备数据分页对象
	 * */
	public Page getMeterproinfosByName(String productname,int pageIndex, int pageSize) throws DataAccessException;
	
	
	/**
	 * 获取相似厂商的仪表设备数据
	 * 
	 * @param producter 生产产商
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * 
	 * @return 仪表设备数据分页对象
	 * */
	public Page getMeterproinfosByProducter(String producter,int pageIndex, int pageSize) throws DataAccessException;
	
	/**
	 * 获取产品ID最大的产品信息
	 * */
	public Meterproinfo getMaxMeterproinfoByProductidId() throws DataAccessException; ;
	
	
	/**
	 * 获取指定仪表的所有参数信息
	 * 
	 * @param meterProductid 仪表ID
	 * 
	 * @return 仪表参数信息
	 * */
	public Set<Meterparaminfo> getMeterparaminfosByProductid(String meterProductid) throws DataAccessException;
	
	/**
	 * 获取指定仪表的参数数量
	 * 
	 * @param meterProductid 仪表ID
	 * 
	 * @return 仪表参数数量
	 * */
	public Integer countMeterparaminfosByProductid(String meterProductid) throws DataAccessException;
	
	/**
	 * 获取指定仪表的最大参数ID的记录
	 * 
	 * @param meterProductid 仪表ID
	 * 
	 * @return 仪表参数对象
	 * */
	public Meterparaminfo maxMeterParamidByProductid(String meterProductid) throws DataAccessException;
}
