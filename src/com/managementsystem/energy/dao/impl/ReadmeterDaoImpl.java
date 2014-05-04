package com.managementsystem.energy.dao.impl;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.ReadmeterDao;
import com.managementsystem.energy.domain.Readmeter;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class ReadmeterDaoImpl extends AbstractDaoSupport implements ReadmeterDao {
	
	private final Log logger = LogFactory.getLog(getClass());
	
	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { Readmeter.class }));
	@Autowired
	private SessionFactory sessionFactory;


	@Override
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	public ReadmeterDaoImpl() {
		super();
	}

	@Override
	public Set<Class<?>> getTypes() {
		return dataTypes;
	}
	
	public Readmeter getReadmeter(String readingid) throws DataAccessException {
		return (Readmeter)getSession().get(Readmeter.class, readingid);
	}
	@Override
	public boolean canBeMerged(Object o) {
		return true;
	}
	
	@Override
	public Page getReadmeters(int pageIndex, int pageSize,
			String buildId, String readingParamDate, String readingPerson, String energydictId)
			throws DataAccessException {
		    String sqlString = "from Readmeter where 1=1";
		       if( buildId!=null&& !buildId.equals("")){
			       String buildIdsql = "";
			       buildIdsql =" and buildId = "+buildId ;
			       sqlString+=buildIdsql;
	        	}
		        if( energydictId!=null&& !energydictId.equals("")){
			       String energydictIdsql = "";
			       energydictIdsql =" and energydict.energydictId = "+energydictId ;
			       sqlString+=energydictIdsql;
	        	}
				if(readingParamDate!=null&& !readingParamDate.equals("")){
					String readingDateString = "";
					readingDateString = " and readingDate like "+"'"+readingParamDate+"%'" ;
					sqlString += readingDateString;
				}
				if(readingPerson!=null&& !readingPerson.equals("")){
					String readingPersonString = "";
					readingPersonString = " and readingPerson like "+"'%"+readingPerson+"%'" ;
					sqlString += readingPersonString;
				}
				sqlString+=" order by readingid asc";
		return pagedQuery(sqlString ,pageIndex,pageSize);
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Readmeter> findReadingDataByEnergydictId(String buildId,String energydictId,String meterId,Date startDate,Date endDate, Integer firstResult,
			Integer maxResults) {

		String querySql = "from Readmeter where status=1";
		if(StringUtils.hasLength(buildId)) {
			querySql += String.format(" and buildId='%s'", buildId);
		}
		if(StringUtils.hasLength(energydictId)) {
			querySql += String.format(" and energydict.energydictId='%s'", energydictId);
		}
		if(StringUtils.hasLength(meterId)) {
			querySql += String.format(" and meterId='%s'", meterId);
		}
		if(startDate!=null && startDate.toString().length()>0) {
			querySql += " and readingDate>='"+ startDate +"'";
		}
		if(endDate!=null && endDate.toString().length()>0) {
			querySql += " and readingDate<='"+ endDate +"'";
		}
		
		querySql += " order by readingDate asc";

		Query query = createQuery(querySql,firstResult,maxResults);
		
		logger.debug("findReadingDataByEnergydictId sql:"+ querySql);
		
		return new ArrayList<Readmeter>(query.list());
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<String> findMeterNos(String buildId) throws DataAccessException {
		final String querySql = "select distinct meter.meterId from Readmeter meter where meter.buildId=?";
		Query query = createQuery(querySql,buildId);
		return new ArrayList<String>(query.list());
	}

	
	private final static String DAY24HOUR_DATE_FORMAT = "yyyy-MM-dd HH";
	private final static String DAY_DATE_FORMAT = "yyyy-MM-dd";
	private final static String MONTH_DATE_FORMAT = "yyyy-MM";
	
	/**
	 * 获取表数据
	 * 
	 * @param buildId 建筑ID
	 * @param energydictId 能源ID
	 * @param startDate 开始日期
	 * @param endDate 结束日期
	 * 
	 * */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Map<String,Double> findReadingData(String buildId, String energydictId,
			Date startDate, Date endDate) {
		String dateSql = "";
		if(startDate!=null) {
			dateSql += " and readingDate>=? and readingDate<=?";
		}
		if(endDate==null) {
			endDate = Calendar.getInstance().getTime();
		}
		
		DateFormat df = new SimpleDateFormat(DAY24HOUR_DATE_FORMAT);
		
		String querySql = "select readingDate,sum(readingData) from Readmeter where buildId=? and energydict.energydictId=? "+ dateSql +" group by DATE(readingDate) order by readingDate desc";
		Query query = null;
		if(startDate!=null) {
			query = createQuery(querySql,0,-1,buildId,energydictId,startDate,endDate);
		} else {
			query = createQuery(querySql,0,-1,buildId,energydictId);
		}
		List list = new LinkedList(query.list());

		Map<String,Double> map = new HashMap<String,Double>();
		
		Double beforeFirstValue = findByReadingDataWithBeforeStartDate(buildId,energydictId,startDate);
		
		//轮询列表,找对应时间段的
		for(int j=0;j<list.size();j++) {
			Object[] readmeter = (Object[])list.get(j);
			Object[] preReadmeter = null;
			if((j+1)<list.size()) {
				preReadmeter = (Object[])list.get(j+1);
			}
			
			Date curReadingDate = (Date)readmeter[0];
			String time = df.format(curReadingDate);
			Double val = 0d;
			val = preReadmeter!=null ? ((Double)readmeter[1]-(Double)preReadmeter[1]) : (Double)readmeter[1];
			if(j==list.size()-1) {
				val = val - beforeFirstValue;
			}
			map.put(time, val);
		}
		return map;
	}
	
	/**
	 * 查找开始日期之前的前一条记录值
	 * */
	public Double findByReadingDataWithBeforeStartDate(String buildId, String energydictId,
			Date startDate) {
		String querySql = "select readingDate,sum(readingData) from Readmeter where buildId=? and energydict.energydictId=? and readingDate<=? group by DATE(readingDate) order by readingDate desc";
		Object obj = executeQuerySingleResult(querySql,buildId,energydictId,startDate);
		if(obj!=null) {
			Object[] readmeter = (Object[])obj;
			return (Double)readmeter[1];
		}
		return 0d;
	} 
	
	

	/**
	 * 获取时间段日期列表
	 * 
	 * @param startDate 开始日期
	 * @param endDate 结束日期
	 * @param dateformat 时间格式
	 * 
	 * @return 日期列表
	 * */
	private Map<String,Double> getDateZones(Date startDate, Date endDate,String dateformat) {
		Map<String,Double> dateZoneList = new LinkedHashMap<String,Double>();
	
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(startDate);
		int startMonth = cal.get(Calendar.MONTH);
		int startYear = cal.get(Calendar.YEAR);
		int startDayOfYear =  cal.get(Calendar.DAY_OF_YEAR);
		int startDay = cal.get(Calendar.DAY_OF_MONTH);
		
		
		cal.setTime(endDate);
		int endYear = cal.get(Calendar.YEAR);
		int endMonth = cal.get(Calendar.MONTH);
		int endDayOfYear = cal.get(Calendar.DAY_OF_YEAR);
		
		endMonth = (endYear-startYear) * 12 + endMonth;
		if(!StringUtils.hasLength(dateformat)) {
			dateformat = DAY_DATE_FORMAT;
		}
		DateFormat df = new SimpleDateFormat(dateformat);

		//24小时
		if(DAY24HOUR_DATE_FORMAT.equals(dateformat)) {
			for(int i=0;i<=23;i++) {				
				cal.set(startYear, startMonth, startDay,i,0);
				String dateZone = df.format(cal.getTime());
				dateZoneList.put(dateZone, 0d);
			}
		} else if(DAY_DATE_FORMAT.equals(dateformat)) {
			for(int i=0;i<endDayOfYear-startDayOfYear;i++) {
				cal.set(startYear, startMonth, startDay+i);
				String dateZone = df.format(cal.getTime());
				dateZoneList.put(dateZone, 0d);
			}
		} else if (MONTH_DATE_FORMAT.equals(dateformat)) {
			for(int i = startMonth;i<endMonth;i++) {
				cal.set(startYear, i, 1);
				String dateZone = df.format(cal.getTime());
				dateZoneList.put(dateZone, 0d);
			}
		} else {
			for(int i = startYear;i<endYear;i++) {
				cal.set(i, 1, 1);
				String dateZone = df.format(cal.getTime());
				dateZoneList.put(dateZone, 0d);
			}
		}
		
		
		
		return dateZoneList;
	}
	
	/**
	 * 获取报表数据
	 * @param buildId 建筑ID
	 * @param energydictId 能源ID
	 * @param startDate 开始日期
	 * @param endDate 结束日期
	 * @param dateformat 结果时间格式
	 * 
	 * @author PING.CHEN 2013-04-22
	 * 
	 * @return a map object for the result
	 * 
	 * */
	private  Map<String,Double> getReportData(String buildId, String energydictId,
			Date startDate, Date endDate,String dateformat) {
		Map<String,Double> map = findReadingData(buildId,energydictId,startDate,endDate);
	//	String fullDateformat = DAY_DATE_FORMAT;
		Map<String,Double> dateZones = getDateZones(startDate,endDate,dateformat);
	//	DateFormat fullDf = new SimpleDateFormat(fullDateformat);
		DateFormat df = new SimpleDateFormat(dateformat);
		DecimalFormat decimalFormat = new DecimalFormat("#.##");
		
		for (Map.Entry<String, Double> dateZone : dateZones.entrySet()) {
			String date = dateZone.getKey();
			Double value = dateZone.getValue();
			//结果集
			for (Map.Entry<String, Double> entry : map.entrySet()) {
				String dateKey = entry.getKey();
				try {
					Date curDate = df.parse(dateKey);
					if(date.equals(df.format(curDate))){
						value += entry.getValue();
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}	
			}
			dateZone.setValue(Double.parseDouble(decimalFormat.format(value)));
		}
		return dateZones;
	}
	
	@Override
	public Map<String, Double> findReadingDataByDay(String buildId,
			String energydictId, Date startDate, Date endDate)
			throws DataAccessException {
		Calendar cal = Calendar.getInstance();
		cal.setTime(startDate);
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE),23,59);
		endDate = cal.getTime();
		return getReportData(buildId,energydictId,startDate,endDate,DAY24HOUR_DATE_FORMAT);
	}

	@Override
	public Map<String,Double> findReadingDataByWeek(String buildId, String energydictId,
			Date startDate, Date endDate)  throws DataAccessException  {
		Calendar cal = Calendar.getInstance();
		cal.setTime(startDate);
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH) + 7);
		endDate = cal.getTime();
		return getReportData(buildId,energydictId,startDate,endDate,DAY_DATE_FORMAT);
	}
	
	@Override
	public Map<String,Double> findReadingDataByMonth(String buildId, String energydictId,
			Date startDate, Date endDate)  throws DataAccessException {
		Calendar cal = Calendar.getInstance();
		cal.setTime(startDate);
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH) + 30);
		endDate = cal.getTime();
		return getReportData(buildId,energydictId,startDate,endDate,DAY_DATE_FORMAT);
	}
	
	@Override
	public Map<String,Double> findReadingDataByYear(String buildId, String energydictId,
			Date startDate, Date endDate)  throws DataAccessException  {
		return getReportData(buildId,energydictId,startDate,endDate,MONTH_DATE_FORMAT);
	}
	

	
	
}


