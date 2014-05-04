package com.managementsystem.energy.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.managementsystem.energy.domain.Meteruseattribute;
import com.managementsystem.energy.domain.Meteruseinfo;
import com.managementsystem.ui.easyui.Tree;
import com.managementsystem.util.dao.Page;

/**
 * 监测仪表使用信息服务接口
 * @author CHENPING 2012-06-15
 * */
public interface MeteruseinfoService {

	/**
	 * 新增仪表使用信息
	 * 
	 * @param meteruseinfo 仪表使用信息
	 * */
	public void addMeteruseinfo(Meteruseinfo meteruseinfo) throws Exception;
	
	/**
	 * 更新仪表使用信息
	 * 
	 * @param meteruseinfo 仪表使用信息
	 * */
	public void updateMeteruseinfo(Meteruseinfo meteruseinfo)  throws Exception;
	
	/**
	 * 新增或更新仪表使用信息
	 *  
	 *  @param meteruseinfo 仪表使用信息
	 * */
	public void saveOrUpdateMeteruseinfo(Meteruseinfo meteruseinfo)  throws Exception;
	
	
	/**
	 * 删除仪表使用信息
	 * 
	 * @param meterId 仪表使用信息
	 * */
	public void deleteMeteruseinfo(String meterId);
	
	/**
	 * 获取仪表使用信息
	 * 
	 * @param meteruseinfo 监测仪表代码
	 * 
	 * @return 仪表使用信息
	 * */
	public Meteruseinfo getMeteruseinfo(String meterId);
	
	/**
	 * 新增仪表使用信息属性
	 * 
	 * @param meteruseinfo 仪表使用信息属性
	 * */
	public void addMeteruseattribute(Meteruseattribute meteruseattribute);
	
	/**
	 * 更新仪表使用信息属性
	 * 
	 * @param meteruseattribute 仪表使用信息属性
	 * */
	public void updateMeteruseattribute(Meteruseattribute meteruseattribute);
	
	/**
	 * 更新仪表属性数据偏差值
	 *  @param meteruseattribute 仪表使用信息属性
	 * */
	public void updateMeteruseattributeDatarevise(Meteruseattribute meteruseattribute);
	
	/**
	 * 新增或更新仪表使用信息属性
	 * 
	 * @param meteruseattribute 仪表使用信息属性
	 * */
	public void saveOrUpdateMeteruseattribute(Meteruseattribute meteruseattribute);
	
	
	/**
	 * 删除仪表使用信息属性
	 * 
	 * @param meterattrName 仪表使用信息属性名称
	 * @param meterId  监测仪表代码
	 * */
	public void deleteMeteruseattribute(String meterattrName,String meterId);
	
	/**
	 * 获取仪表使用信息属性
	 * 
	 * @param meterattrName 仪表使用信息属性名称
	 * @param meterId  监测仪表代码
	 * 
	 * @return 仪表使用信息属性
	 * */
	public Meteruseattribute getMeteruseattribute(String meterattrName,String meterId);
	
	
	/**
	 * 获取所有监测仪表使用信息
	 * 
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 所有监测仪表使用信息
	 * */
	public Set<Meteruseinfo> getMeteruseinfos(int startResult, int maxRows);
	
	/**
	 * 获取所有监测仪表使用信息
	 * 
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 所有监测仪表使用信息
	 * */
	public Set<Meteruseinfo> getMeteruseinfos();
	
	/**;
	 * 获取所有监测仪表使用信息
	 * 
	 * @param pageIndex 当前页码
	 * @param pageSize	显示行数	 -1为显示全部
	 * @param mapParams	查询条件MAP
	 * 
	 * @return 所有监测仪表使用信息
	 * */
	public Page getMeteruseinfos(int pageIndex, int pageSize,Map<String,Object> mapParams);
	
	
	/**
	 * 获取指定支路的所有监测仪表使用信息
	 * 
	 * @param circuitId 支路ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定支路的所有监测仪表使用信息
	 * */
	public Set<Meteruseinfo> getMeteruseinfosByCircuitId(String circuitId,int startResult, int maxRows);
	
	/**
	 * 获取指定支路的所有监测仪表使用信息
	 * 
	 * @param circuitId 支路ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定支路的所有监测仪表使用信息
	 * */
	public Set<Meteruseinfo> getMeteruseinfosByCircuitId(String circuitId);
	
	/**
	 * 获取指定区域的所有监测仪表使用信息
	 * 
	 * @param regionId 区域ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定支路的所有监测仪表使用信息
	 * */
	public Set<Meteruseinfo> getMeteruseinfosByRegionId(String regionId,int startResult, int maxRows);
	
	/**
	 * 获取指定区域的所有监测仪表使用信息
	 * 
	 * @param regionId 区域ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定支路的所有监测仪表使用信息
	 * */
	public Set<Meteruseinfo> getMeteruseinfosByRegionId(String regionId);
			
	/**
	 * 获取指定仪表产品ID的所有监测仪表使用信息
	 * 
	 * @param meterProductid 仪表产品ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定仪表产品ID的所有监测仪表使用信息
	 * */
	public Set<Meteruseinfo> getMeteruseinfosByMeterProductid(String meterProductid,int startResult, int maxRows);
	
	
	/**
	 * 获取指定仪表产品ID的所有监测仪表使用信息
	 * 
	 * @param meterProductid 仪表产品ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定仪表产品ID的所有监测仪表使用信息
	 * */
	public Set<Meteruseinfo> getMeteruseinfosByMeterProductid(String meterProductid);
	
	/**
	 * 获取指定仪表ID的仪表属性
	 * 
	 * @param meterId 仪表ID
	 * 
	 * @return 指定仪表ID的仪表属性
	 * */
	public Set<Meteruseattribute> getMeteruseattributeByMeterId(String meterId);
	
	/**
	 * 获取指定仪表ID的所有仪表属性
	 * 
	 * @param meterId 仪表ID
	 * @param type 属性类型
	 * 
	 * @return 指定仪表ID的仪表属性
	 * */
	public List<Meteruseattribute> getMeteruseattributesByMeterId(String meterId,int type);
	
	
	/**
	 * 获取指定能耗分类分项代码的设备属性
	 * @param buildId 建筑ID
	 * @param energyitemCode 指定能耗分类分项代码的设备属性
	 * @return 指定能耗分类分项代码的设备属性
	 * */
	public List<Meteruseattribute> getMeteruseattributesByEnergyitemcode(String buildId,String energyitemCode);
	
	/**
	 * 获取指定装表支路的设备属性列表
	 * @param circuitId 装表支路ID
	 * @return 定装表支路的设备属性列表
	 * */
	public List<Meteruseattribute> getMeteruseattributeByCircuitId(String circuitId);
	

	/**
	 * 获取指定能耗分类分项代码的设备属性
	 * @param buildId 建筑ID
	 * @param energyitemCode 指定能耗分类分项代码的设备属性
	 * @return 指定设备属性值字符串，如 5832,5844,5845
	 * */
	public String getMeteruseattributesByEnergyitemcodeToString(String buildId,String energyitemCode);
	
	/**
	 * 获取指定能耗分类分项代码的设备属性
	 * @param listMeteruseattribute 设备属性列表
	 * @return 指定设备属性值字符串，如 5832,5844,5845
	 * */
	public String getMeteruseattributesByEnergyitemcodeToString(List<Meteruseattribute> listMeteruseattribute);
	
	/**
	 * 获取指定仪表ID的仪表属性值字符串
	 * <p>例如：51,52,53</p>
	 * 
	 * @param meterId 仪表ID
	 * @param type  属性类型
	 * 
	 * @return 指定仪表ID的仪表属性值字符串
	 * */
	public String getMeteruseattributeValueByMeterId(String meterId,int type);
	
	/**
	 * 获取指定仪表ID的仪表属性值字符串，默认属性type=0
	 * <p>例如：51,52,53</p>
	 * 
	 * @param meterId 仪表ID
	 * 
	 * @return 指定仪表ID的仪表属性值字符串
	 * */
	public String getMeteruseattributeValueByMeterId(String meterId);
	
	/**
	 * 获取指定仪表ID的仪表属性值字符串数组
	 * <p>例如：String[] arrVal = new String[] {51,52,53}</p>
	 * 
	 * @param meterId 仪表ID
	 * @param type  属性类型
	 * 
	 * @return 指定仪表ID的仪表属性值字符串
	 * */
	public String[] getMeteruseattributeValuesByMeterId(String meterId,int type);
	
	/**
	 * 获取指定建筑的装表信息和对应属性
	 * 
	 * @param buildId 建筑ID
	 * @param attrType 属性类型 
	 * */
	public  List<Tree> getMeteruseinfoAttributesToTree(String buildId,int attrType);
	
	
	
}
