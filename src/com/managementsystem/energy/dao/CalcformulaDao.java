package com.managementsystem.energy.dao;

import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Calcformula;
import com.managementsystem.util.dao.DaoSupport;

/**
 * 计算公式数据操作类
 * */
public interface CalcformulaDao extends DaoSupport {

	/**
	 * 获取所有计算公式
	 * 
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 所有计算公式
	 * */
	public Set<Calcformula> getCalcformulas(int startResult, int maxRows) throws DataAccessException;
	
	/**
	 * 获取指定建筑的所有计算公式
	 * 
	 * @param buildId 建筑ID
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * 
	 * @return 指定建筑的所有计算公式
	 * */
	public Set<Calcformula> getCalcformulasByBuildId(String buildId,int startResult, int maxRows) throws DataAccessException;
	
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
	public Set<Calcformula> getCalcformulasByEnergyItemcode(String buildId,String energyItemcode,int startResult, int maxRows) throws DataAccessException;
	
	
	
}
