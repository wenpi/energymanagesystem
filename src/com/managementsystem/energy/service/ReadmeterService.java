package com.managementsystem.energy.service;


import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Readmeter;
import com.managementsystem.util.dao.Page;


/**
 * Lease服务接口
 * */
public interface ReadmeterService {
	
	public Readmeter getReadmeter(String readingid);
	
	public Page getPagedReadmeters(int pageIndex,int pageSize,String buildId, String  readingParamDate, String readingPerson, String energydictId);
	
	public void saveOrUpdate(Readmeter readmeter,String userId);
	
	public void deleteReadmeter(String readingid);
	
	public void addReadmeter(Readmeter readmeter);
	
	public void updateReadmeter(Readmeter readmeter);
	
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
	public List<Readmeter> findReadingDataByEnergydictId(String buildId,String energydictId,String meterId,Date startDate,Date endDate, Integer firstResult,Integer maxResults); 
	
	/**
	 * 获取指定建筑ID的仪表编号列表
	 * @param buildId 建筑ID
	 * @return 
	 * */
	public List<String> findMeterNos(String buildId) throws DataAccessException;
	
	
	public List<Object> getReadingDataByDayToChart(String buildId,String energydictId,Date startDate,Date endDate,BigDecimal entryRate)  throws DataAccessException;
	
	public List<Object> getReadingDataByWeekToChart(String buildId,String energydictId,Date startDate,Date endDate,BigDecimal entryRate)  throws DataAccessException;
	
	public List<Object> getReadingDataByMonthToChart(String buildId,String energydictId,Date startDate,Date endDate,BigDecimal entryRate)  throws DataAccessException;
	
	public List<Object> getReadingDataByYearToChart(String buildId,String energydictId,Date startDate,Date endDate,BigDecimal entryRate)  throws DataAccessException;
	
	
}