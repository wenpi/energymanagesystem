package com.managementsystem.energy.service;

import java.util.Set;

import com.managementsystem.energy.domain.Calcformula;

/**
 * 计算公式服务类
 * 
 * @author CHENPING 2012-06-15
 * */
public interface CalcformulaService {

	/**
	 * 新增计算公式
	 * 
	 * @param calcformula 计算公式
	 * */
	public void addCalcformula(Calcformula calcformula);
	
	/**
	 * 更新计算公式
	 * 
	 * @param calcformula 计算公式
	 * */
	public void updateCalcformula(Calcformula calcformula);
	
	/**
	 * 删除计算公式
	 * 
	 * @param formulaId 计算公式ID
	 * */
	public void deleteCalcformula(String formulaId);
	
	/**
	 * 获取计算公式
	 * 
	 * @param formulaId 计算公式ID
	 * 
	 * @return 计算公式
	 * */
	public Calcformula getCalcformula(String formulaId);
	
	/**
	 * 获取所有计算公式
	 * 
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 所有计算公式
	 * */
	public Set<Calcformula> getCalcformulas(int startResult, int maxRows);
	
	/**
	 * 获取所有计算公式
	 * 
	 * @return 所有计算公式
	 * */
	public Set<Calcformula> getCalcformulas();
	
	
	/**
	 * 获取指定建筑的所有计算公式
	 * 
	 * @param buildId 建筑ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定建筑的所有计算公式
	 * */
	public Set<Calcformula> getCalcformulasByBuildId(String buildId,int startResult, int maxRows);
	
	/**
	 * 获取指定建筑的所有计算公式
	 * 
	 * @param buildId 建筑ID
	 * 
	 * @return 指定建筑的所有计算公式
	 * */
	public Set<Calcformula> getCalcformulasByBuildId(String buildId); 
	
	
	
	/**
	 * 获取指定建筑的所有计算公式
	 * 
	 * @param buildId 建筑ID
	 * @param energyItemcode 分类分项代码
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定建筑的所有计算公式
	 * */
	public Set<Calcformula> getCalcformulasByEnergyItemcode(String buildId,String energyItemcode,int startResult, int maxRows);
	
	
	/**
	 * 获取指定建筑的所有计算公式
	 * 
	 * @param buildId 建筑ID
	 * @param energyItemcode 分类分项代码
	 * 
	 * @return 指定建筑的所有计算公式
	 * */
	public Set<Calcformula> getCalcformulasByEnergyItemcode(String buildId,String energyItemcode);
}
