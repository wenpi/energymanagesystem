package com.managementsystem.energy.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.managementsystem.energy.domain.Energyitemdict;
import com.managementsystem.ui.easyui.Tree;
import com.managementsystem.util.dao.Page;

/**
 * 能耗分项计量服务接口类
 * */
public interface EnergyitemdictService {
	
	/**
	 * 新增能耗分项计量字典
	 * 
	 * @param energyitemdict 分项数据
	 * 
	 * */
	public void addEnergyitemdict(Energyitemdict energyitemdict);
	
	
	/**
	 * 更新能耗分项计量字典
	 * 
	 * @param energyitemdict 分项数据
	 * 
	 * */
	public void updateEnergyitemdict(Energyitemdict energyitemdict);
	
	/**
	 * 删除能耗分项计量字典
	 * 
	 * @param energyItemcode 分项代码
	 * 
	 * */
	public void deleteEnergyitemdict(String energyItemcode);
	
	
	/**
	 * 获取能耗分项计量字典
	 * 
	 * @param energyItemcode 分项代码
	 * 
	 * @return 能耗分项计量字典
	 * */
	public Energyitemdict getEnergyitemdict(String energyItemcode);
	
	/**
	 * 获取所有分项计量定义数据
	 * 
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 所有分项计量定义数据
	 * */
	public Set<Energyitemdict> getEnergyitemdicts();
	
	/**
	 * 获取所有分项计量定义数据
	 * 
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 所有分项计量定义数据
	 * */
	public Set<Energyitemdict> getEnergyitemdicts(int startResult, int maxRows);
	
	/**
	 * 获取所有分类能耗项
	 * */
	public Set<Energyitemdict> getEnergyitemdictsByType();
	
	/**
	 * 获取指定分类分项数据及所有子类
	 * */
	public Set<Energyitemdict> getEnergyitemdictsAndChilds(String energyItemcode);
	
	/**
	 * 获取能耗分项计量字典支路树状结构信息
	 * 
	 * @return 能耗分项计量字典支路树状结构信息
	 * 
	 * @see Tree
	 * */
	public List<Tree> getEnergyitemdictComboTree();
	
	/**
	 * 获取所有数据中心
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * 
	 * @return 数据中心分页对象
	 * */
	public Page getPagedEnergyitemdicts(int pageIndex,int pageSize);
	
	public Page getPagedEnergyitemdict(int pageIndex,int pageSize,Map<String,Object> mapCondition);
	
	public Page getPagedEnergyitemdictsByType(int pageIndex,int pageSize);
}
