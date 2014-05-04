package com.managementsystem.energy.service.impl;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Map;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.ReadmeterDao;
import com.managementsystem.energy.domain.Readmeter;
import com.managementsystem.energy.service.ReadmeterService;
import com.managementsystem.util.dao.Page;


/**
 * Lease服务接口
 * */
@Service
public class ReadmeterServiceImpl implements ReadmeterService {
	
	private final Log logger = LogFactory.getLog(getClass());
	private Calendar calendar = Calendar.getInstance();

	@Autowired
	private ReadmeterDao readmeterDao;
	
	@Transactional(readOnly=true)
	public Readmeter getReadmeter(String readingid) {	
		return readmeterDao.getReadmeter(readingid);
	}
	
	@Transactional(readOnly = true)
	public Page getPagedReadmeters(int pageIndex, int pageSize,
			String buildId, String readingParamDate, String readingPerson, String energydictId) {
		return readmeterDao.getReadmeters(pageIndex, pageSize,buildId,readingParamDate,readingPerson,energydictId);
	}
	
	@Transactional
	public void saveOrUpdate(Readmeter readmeter, String userId) {
		if (StringUtils.hasLength(readmeter.getReadingid())) {
			if (getReadmeter(readmeter.getReadingid()) != null) {
				readmeter.setModifieddate(calendar.getTime());
				readmeter.setModifier(Long.parseLong(userId));
				readmeterDao.store(readmeter);
				readmeterDao.flush();
			} else {
				saveReadmeter(readmeter, userId);
			}
		} else {
			saveReadmeter(readmeter, userId);
		}
	}
	
	@Transactional
	public void saveReadmeter(Readmeter readmeter, String userId) {
		logger.info("ReadmeterServiceImpl saveReadmeter");
		readmeter.setCreatoruserid(Long.parseLong(userId));
		readmeter.setCreatedate(calendar.getTime());
		readmeterDao.save(readmeter);
		readmeterDao.flush();
	}
	
	@Transactional
	public void deleteReadmeter(String readingid) {
		Readmeter readmeter = getReadmeter(readingid);
		if (readmeter != null) {
			readmeterDao.delete(readmeter);
			readmeterDao.flush();
		}
	}
	
	@Transactional
	public void addReadmeter(Readmeter readmeter) {
		readmeterDao.save(readmeter);
	}
	
	@Transactional
	public void updateReadmeter(Readmeter readmeter) {
		readmeterDao.update(readmeter);
	}

	
	@Transactional(readOnly = true)
	public List<Readmeter> findReadingDataByEnergydictId(String buildId,
			String energydictId, String meterId, Date startDate, Date endDate,
			Integer firstResult, Integer maxResults) {
		
			int first = firstResult==null?0:firstResult;
			int max = maxResults==null?-1:maxResults;
		
		return readmeterDao.findReadingDataByEnergydictId(buildId,energydictId,meterId,startDate,endDate,first,max);
	}

	@Transactional(readOnly = true)
	@Override
	public List<String> findMeterNos(String buildId) throws DataAccessException {
		return readmeterDao.findMeterNos(buildId);
	}

	private List<Object> getReportData(Map<String,Double> readmeterdata,BigDecimal entryRate) throws DataAccessException {
		List<Object> result = new LinkedList<Object>();
		DecimalFormat nf = new DecimalFormat("#.##");
		BigDecimal zero = new BigDecimal(0);
		if(entryRate==null || entryRate.equals(zero)) {
			entryRate = new BigDecimal(1);
		} 
		for(Map.Entry<String, Double> entry : readmeterdata.entrySet()) {
			Map<String, Object> entryJson = new LinkedHashMap<String, Object>();
			BigDecimal val = new BigDecimal(entry.getValue());
			entryJson.put("label", entry.getKey());
			entryJson.put("value", nf.format(val.multiply(entryRate)));
			result.add(entryJson);
		}
		return result;
	}
	
	
	@Transactional(readOnly = true)
	@Override
	public List<Object> getReadingDataByDayToChart(String buildId,
			String energydictId, Date startDate, Date endDate,BigDecimal entryRate)
			throws DataAccessException {
		
		Map<String,Double> readmeterdata = 
			readmeterDao.findReadingDataByDay(buildId, energydictId, startDate, endDate);
		List<Object> result = getReportData(readmeterdata,entryRate);
		return result;
	}

	@Transactional(readOnly = true)
	@Override
	public List<Object> getReadingDataByWeekToChart(String buildId,
			String energydictId, Date startDate, Date endDate,BigDecimal entryRate)
			throws DataAccessException {
		
		Map<String,Double> readmeterdata = 
			readmeterDao.findReadingDataByWeek(buildId, energydictId, startDate, endDate);
		List<Object> result = getReportData(readmeterdata,entryRate);
		return result;
	}

	@Transactional(readOnly = true)
	@Override
	public List<Object> getReadingDataByMonthToChart(String buildId,
			String energydictId, Date startDate, Date endDate,BigDecimal entryRate)
			throws DataAccessException {
		Map<String,Double> readmeterdata = 
			readmeterDao.findReadingDataByMonth(buildId, energydictId, startDate, endDate);
		List<Object> result = getReportData(readmeterdata,entryRate);
		return result;
	}

	@Transactional(readOnly = true)
	@Override
	public List<Object> getReadingDataByYearToChart(String buildId,
			String energydictId, Date startDate, Date endDate,BigDecimal entryRate)
			throws DataAccessException {
		Map<String,Double> readmeterdata = 
			readmeterDao.findReadingDataByYear(buildId, energydictId, startDate, endDate);
		List<Object> result = getReportData(readmeterdata,entryRate);
		return result;
	}

	
	
}

