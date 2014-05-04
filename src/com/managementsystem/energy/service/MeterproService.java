package com.managementsystem.energy.service;

import java.util.Map;
import java.util.Set;

import com.managementsystem.energy.domain.Meterparaminfo;
import com.managementsystem.energy.domain.Meterproinfo;
import com.managementsystem.util.dao.Page;

/**
 * 仪表信息服务接口类
 * 
 * @author CHENPING 2012-06-14
 * */
public interface MeterproService {

	/**
	 * 新增仪表信息
	 * 
	 * @param meterproinfo 仪表产品信息
	 * */
	public void addMeterproinfo(Meterproinfo meterproinfo);
	
	/**
	 * 更新仪表信息
	 * 
	 * @param meterproinfo 仪表产品信息
	 * */
	public void updateMeterproinfo(Meterproinfo meterproinfo);
	
	/**
	 * 删除仪表信息
	 * 
	 * @param meterProductid 仪表产品ID
	 * */
	public void deleteMeterproinfo(String meterProductid);
	
	/**
	 * 获取仪表产品信息
	 * 
	 * @param meterProductid 仪表产品ID
	 * 
	 * @return 仪表产品信息
	 * */
	public Meterproinfo getMeterproinfo(String meterProductid);
	

	/**
	 * 保存或更新仪表产品参数信息
	 * 
	 * @param meterparaminfo 产品参数信息
	 * */
	public void saveOrUpdateMeterparaminfo(Meterparaminfo meterparaminfo);
	
	/**
	 * 更新仪表产品参数信息
	 * 
	 * @param meterParamid 产品参数ID
	 * */
	public void deleteMeterparaminfo(String meterParamid);
	
	/**
	 * 获取仪表产品参数信息
	 * 
	 * @param meterParamid 产品参数ID
	 * 
	 * @return 产品参数信息
	 * */
	public Meterparaminfo getMeterparaminfo(String meterParamid);
	
	/**
	 * 获取仪表设备数据
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * 
	 * @return 仪表设备数据分页对象
	 * */
	public Page getMeterproinfos(int pageIndex, int pageSize,Map<String, Object> mapParams);
	
	/**
	 * 获取指定类型的仪表设备数据
	 * 
	 * @param type 仪表类型
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * 
	 * @return 仪表设备数据分页对象
	 * */
	public Page getMeterproinfosByType(int type,int pageIndex, int pageSize);
	
	
	/**
	 * 获取相似名称的仪表设备数据
	 * 
	 * @param productname 仪表名称
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * 
	 * @return 仪表设备数据分页对象
	 * */
	public Page getMeterproinfosByName(String productname,int pageIndex, int pageSize);
	
	/**
	 * 获取相似厂商的仪表设备数据
	 * 
	 * @param producter 生产产商
	 * @param pageIndex 当前页
	 * @param pageSize 每页显示数
	 * 
	 * @return 仪表设备数据分页对象
	 * */
	public Page getMeterproinfosByProducter(String producter,int pageIndex, int pageSize);
	
	/**
	 * 获取指定仪表的所有参数信息
	 * 
	 * @param meterProductid 仪表ID
	 * 
	 * @return 仪表参数信息
	 * */
	public Set<Meterparaminfo> getMeterparaminfosByProductid(String meterProductid);
	
}
