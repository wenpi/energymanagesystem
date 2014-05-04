package com.managementsystem.energy.dao;

import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Readmeter;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;

public interface ReadmeterDao extends DaoSupport {
	
	public Readmeter getReadmeter(String readingid) throws DataAccessException;
	
	public Page getReadmeters(int pageIndex,int pageSize,String buildId, String readingParamDate, String readingPerson, String energydictId) throws DataAccessException;
	
	/**
	 * 获取指定能源在指定时间内的能耗列表
	 * 
	 * @param buildId 建筑ID
	 * 
	 * @param energydictId 能源ID
	 * 
	 * @param startDate 开始时间
	 * 
	 * @param endDate 结束时间
	 * 
	 * */
	public List<Readmeter> findReadingDataByEnergydictId(String buildId,String energydictId,String meterId,Date startDate,Date endDate, Integer firstResult,Integer maxResults) throws DataAccessException;
	
	/**
	 * 获取指定建筑ID的仪表编号列表
	 * @param buildId 建筑ID
	 * @return 
	 * */
	public List<String> findMeterNos(String buildId) throws DataAccessException;

	
	/**
	 * 获取指定能耗类型每日耗能量
	 * 
	 * @param buildId 建筑ID
	 * @param energydictId 能源类型ID
	 * @param startDate 开始统计日期
	 * @param endDate	结束统计日期
	 * 
	 * @return 
	 * */
	public Map<String,Double> findReadingDataByDay(String buildId,String energydictId,Date startDate,Date endDate) throws DataAccessException;
	
	
	/**
	 * 获取指定能耗类型每周耗能量
	 * 
	 * @param buildId 建筑ID
	 * @param energydictId 能源类型ID
	 * @param startDate 开始统计日期
	 * @param endDate	结束统计日期
	 * 
	 * @return 
	 * */
	public Map<String,Double> findReadingDataByWeek(String buildId,String energydictId,Date startDate,Date endDate)  throws DataAccessException ;
	
	
	/**
	 * 获取指定能耗类型每月耗能量
	 * 
	 * @param buildId 建筑ID
	 * @param energydictId 能源类型ID
	 * @param startDate 开始统计日期
	 * @param endDate	结束统计日期
	 * 
	 * @return 
	 * */
	public Map<String,Double> findReadingDataByMonth(String buildId,String energydictId,Date startDate,Date endDate) throws DataAccessException;
	
	
	/**
	 * 获取指定能耗类型每年耗能量
	 * 
	 * @param buildId 建筑ID
	 * @param energydictId 能源类型ID
	 * @param startDate 开始统计日期
	 * @param endDate	结束统计日期
	 * 
	 * @return 
	 * */
	public Map<String,Double> findReadingDataByYear(String buildId,String energydictId,Date startDate,Date endDate)  throws DataAccessException ;
	
	
}