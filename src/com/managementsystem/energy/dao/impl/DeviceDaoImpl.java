package com.managementsystem.energy.dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
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

import com.managementsystem.energy.dao.DeviceDao;
import com.managementsystem.energy.domain.Ahu;
import com.managementsystem.energy.domain.Boi;
import com.managementsystem.energy.domain.Chi;
import com.managementsystem.energy.domain.Ct;
import com.managementsystem.energy.domain.Fcu;
import com.managementsystem.energy.domain.Heater;
import com.managementsystem.energy.domain.Lift;
import com.managementsystem.energy.domain.Lighting;
import com.managementsystem.energy.domain.Pump;
import com.managementsystem.energy.domain.Vav;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class DeviceDaoImpl extends AbstractDaoSupport implements DeviceDao {
	private final Log logger = LogFactory.getLog(getClass());
	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { Chi.class }));
	
	private final String GET_CHIS="from Chi";
	private final String GET_BOIS="from Boi";
	private final String GET_PUMPS="from Pump";
	private final String GET_CTS="from Ct";
	private final String GET_AHUS="from Ahu";
	private final String GET_FCUS="from Fcu";
	private final String GET_VAVS="from Vav";
	private final String GET_LIGHTINGS="from Lighting";
	private final String GET_LIFTS="from Lift";
	private final String GET_HEATERS="from Heater";
	
	@Override
	public Page getPagedChis(int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery(GET_CHIS,pageIndex,pageSize);
	}
	
	@Override
	public Page getPagedChisBySearch(String hqlCondition,int pageIndex, int pageSize,
			Map<String,Object> mapCondition) throws DataAccessException {
		return pagedQuery(GET_CHIS+hqlCondition,pageIndex,pageSize,mapCondition);
	}
	
	@Override
	public List<Chi> getChiList(String no,String buildId, String regionId) throws DataAccessException {
		String sqlString = "from Chi where 1=1";
		if( buildId!=null&& !buildId.equals("")){
		       String buildIdsql = "";
		       buildIdsql =" and buildId = "+buildId ;
		       sqlString+=buildIdsql;
     	}
		if( regionId!=null&& !regionId.equals("")){
		       String regionIdsql = "";
		       regionIdsql =" and regionId = "+regionId ;
		       sqlString+=regionIdsql;
    	}
		if( no!=null&& !no.equals("")){
			String noString = "";
			noString = " and deviceNo like "+"'%"+no+"%'" ;
			sqlString += noString;
 	    }
		sqlString+=" order by id asc";
        Query query = createQuery(sqlString);
		logger.debug("sql:"+ sqlString);
		return new ArrayList<Chi>(query.list());
	}
	
	@Override
	public Page getPagedBois(int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery(GET_BOIS,pageIndex,pageSize);
	}
	
	@Override
	public Page getPagedBoisBySearch(String hqlCondition,int pageIndex, int pageSize,
			Map<String,Object> mapCondition) throws DataAccessException {
		return pagedQuery(GET_BOIS+hqlCondition,pageIndex,pageSize,mapCondition);
	}
	
	@Override
	public List<Boi> getBoiList(String no,String buildId, String regionId) throws DataAccessException {
		String sqlString = "from Boi where 1=1";
		if( buildId!=null&& !buildId.equals("")){
		       String buildIdsql = "";
		       buildIdsql =" and buildId = "+buildId ;
		       sqlString+=buildIdsql;
     	}
		if( regionId!=null&& !regionId.equals("")){
		       String regionIdsql = "";
		       regionIdsql =" and regionId = "+regionId ;
		       sqlString+=regionIdsql;
    	}
		if( no!=null&& !no.equals("")){
			String noString = "";
			noString = " and deviceNo like "+"'%"+no+"%'" ;
			sqlString += noString;
 	    }
		sqlString+=" order by id asc";
        Query query = createQuery(sqlString);
		logger.debug("sql:"+ sqlString);
		return new ArrayList<Boi>(query.list());
	}
	
	@Override
	public Page getPagedPumps(int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery(GET_PUMPS,pageIndex,pageSize);
	}
	
	@Override
	public Page getPagedPumpsBySearch(String hqlCondition,int pageIndex, int pageSize,
			Map<String,Object> mapCondition) throws DataAccessException {
		return pagedQuery(GET_PUMPS+hqlCondition,pageIndex,pageSize,mapCondition);
	}
	
	@Override
	public List<Pump> getPumpList(String no,String buildId, String regionId) throws DataAccessException {
		String sqlString = "from Pump where 1=1";
		if( buildId!=null&& !buildId.equals("")){
		       String buildIdsql = "";
		       buildIdsql =" and buildId = "+buildId ;
		       sqlString+=buildIdsql;
     	}
		if( regionId!=null&& !regionId.equals("")){
		       String regionIdsql = "";
		       regionIdsql =" and regionId = "+regionId ;
		       sqlString+=regionIdsql;
    	}
		if( no!=null&& !no.equals("")){
			String noString = "";
			noString = " and deviceNo like "+"'%"+no+"%'" ;
			sqlString += noString;
 	    }
		sqlString+=" order by id asc";
        Query query = createQuery(sqlString);
		logger.debug("sql:"+ sqlString);
		return new ArrayList<Pump>(query.list());
	}
	
	@Override
	public Page getPagedCts(int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery(GET_CTS,pageIndex,pageSize);
	}
	
	@Override
	public Page getPagedCtsBySearch(String hqlCondition,int pageIndex, int pageSize,
			Map<String,Object> mapCondition) throws DataAccessException {
		return pagedQuery(GET_CTS+hqlCondition,pageIndex,pageSize,mapCondition);
	}
	
	@Override
	public List<Ct> getCtList(String no,String buildId, String regionId) throws DataAccessException {
		String sqlString = "from Ct where 1=1";
		if( buildId!=null&& !buildId.equals("")){
		       String buildIdsql = "";
		       buildIdsql =" and buildId = "+buildId ;
		       sqlString+=buildIdsql;
     	}
		if( regionId!=null&& !regionId.equals("")){
		       String regionIdsql = "";
		       regionIdsql =" and regionId = "+regionId ;
		       sqlString+=regionIdsql;
    	}
		if( no!=null&& !no.equals("")){
			String noString = "";
			noString = " and deviceNo like "+"'%"+no+"%'" ;
			sqlString += noString;
 	    }
		sqlString+=" order by id asc";
        Query query = createQuery(sqlString);
		logger.debug("sql:"+ sqlString);
		return new ArrayList<Ct>(query.list());
	}
	
	@Override
	public Page getPagedAhus(int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery(GET_AHUS,pageIndex,pageSize);
	}
	
	@Override
	public Page getPagedAhusBySearch(String hqlCondition,int pageIndex, int pageSize,
			Map<String,Object> mapCondition) throws DataAccessException {
		return pagedQuery(GET_AHUS+hqlCondition,pageIndex,pageSize,mapCondition);
	}
	
	@Override
	public List<Ahu> getAhuList(String no,String buildId, String regionId) throws DataAccessException {
		String sqlString = "from Ahu where 1=1";
		if( buildId!=null&& !buildId.equals("")){
		       String buildIdsql = "";
		       buildIdsql =" and buildId = "+buildId ;
		       sqlString+=buildIdsql;
     	}
		if( regionId!=null&& !regionId.equals("")){
		       String regionIdsql = "";
		       regionIdsql =" and regionId = "+regionId ;
		       sqlString+=regionIdsql;
    	}
		if( no!=null&& !no.equals("")){
			String noString = "";
			noString = " and deviceNo like "+"'%"+no+"%'" ;
			sqlString += noString;
 	    }
		sqlString+=" order by id asc";
        Query query = createQuery(sqlString);
		logger.debug("sql:"+ sqlString);
		return new ArrayList<Ahu>(query.list());
	}
	
	@Override
	public Page getPagedFcus(int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery(GET_FCUS,pageIndex,pageSize);
	}
	
	@Override
	public Page getPagedFcusBySearch(String hqlCondition,int pageIndex, int pageSize,
			Map<String,Object> mapCondition) throws DataAccessException {
		return pagedQuery(GET_FCUS+hqlCondition,pageIndex,pageSize,mapCondition);
	}
	
	@Override
	public List<Fcu> getFcuList(String no,String buildId, String regionId) throws DataAccessException {
		String sqlString = "from Fcu where 1=1";
		if( buildId!=null&& !buildId.equals("")){
		       String buildIdsql = "";
		       buildIdsql =" and buildId = "+buildId ;
		       sqlString+=buildIdsql;
     	}
		if( regionId!=null&& !regionId.equals("")){
		       String regionIdsql = "";
		       regionIdsql =" and regionId = "+regionId ;
		       sqlString+=regionIdsql;
    	}
		if( no!=null&& !no.equals("")){
			String noString = "";
			noString = " and deviceNo like "+"'%"+no+"%'" ;
			sqlString += noString;
 	    }
		sqlString+=" order by id asc";
        Query query = createQuery(sqlString);
		logger.debug("sql:"+ sqlString);
		return new ArrayList<Fcu>(query.list());
	}
	
	@Override
	public Page getPagedVavs(int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery(GET_VAVS,pageIndex,pageSize);
	}
	
	@Override
	public Page getPagedVavsBySearch(String hqlCondition,int pageIndex, int pageSize,
			Map<String,Object> mapCondition) throws DataAccessException {
		return pagedQuery(GET_VAVS+hqlCondition,pageIndex,pageSize,mapCondition);
	}
	
	@Override
	public List<Vav> getVavList(String no,String buildId, String regionId) throws DataAccessException {
		String sqlString = "from Vav where 1=1";
		if( buildId!=null&& !buildId.equals("")){
		       String buildIdsql = "";
		       buildIdsql =" and buildId = "+buildId ;
		       sqlString+=buildIdsql;
     	}
		if( regionId!=null&& !regionId.equals("")){
		       String regionIdsql = "";
		       regionIdsql =" and regionId = "+regionId ;
		       sqlString+=regionIdsql;
    	}
		if( no!=null&& !no.equals("")){
			String noString = "";
			noString = " and deviceNo like "+"'%"+no+"%'" ;
			sqlString += noString;
 	    }
		sqlString+=" order by id asc";
        Query query = createQuery(sqlString);
		logger.debug("sql:"+ sqlString);
		return new ArrayList<Vav>(query.list());
	}
	
	@Override
	public Page getPagedLightings(int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery(GET_LIGHTINGS,pageIndex,pageSize);
	}
	
	@Override
	public Page getPagedLightingsBySearch(String hqlCondition,int pageIndex, int pageSize,
			Map<String,Object> mapCondition) throws DataAccessException {
		return pagedQuery(GET_LIGHTINGS+hqlCondition,pageIndex,pageSize,mapCondition);
	}
	
	@Override
	public List<Lighting> getLightingList(String no,String buildId, String regionId) throws DataAccessException {
		String sqlString = "from Lighting where 1=1";
		if( buildId!=null&& !buildId.equals("")){
		       String buildIdsql = "";
		       buildIdsql =" and buildId = "+buildId ;
		       sqlString+=buildIdsql;
     	}
		if( regionId!=null&& !regionId.equals("")){
		       String regionIdsql = "";
		       regionIdsql =" and regionId = "+regionId ;
		       sqlString+=regionIdsql;
    	}
		if( no!=null&& !no.equals("")){
			String noString = "";
			noString = " and deviceNo like "+"'%"+no+"%'" ;
			sqlString += noString;
 	    }
		sqlString+=" order by id asc";
        Query query = createQuery(sqlString);
		logger.debug("sql:"+ sqlString);
		return new ArrayList<Lighting>(query.list());
	}
	
	@Override
	public Page getPagedLifts(int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery(GET_LIFTS,pageIndex,pageSize);
	}
	
	@Override
	public Page getPagedLiftsBySearch(String hqlCondition,int pageIndex, int pageSize,
			Map<String,Object> mapCondition) throws DataAccessException {
		return pagedQuery(GET_LIFTS+hqlCondition,pageIndex,pageSize,mapCondition);
	}
	
	@Override
	public List<Lift> getLiftList(String no,String buildId, String regionId) throws DataAccessException {
		String sqlString = "from Lift where 1=1";
		if( buildId!=null&& !buildId.equals("")){
		       String buildIdsql = "";
		       buildIdsql =" and buildId = "+buildId ;
		       sqlString+=buildIdsql;
     	}
		if( regionId!=null&& !regionId.equals("")){
		       String regionIdsql = "";
		       regionIdsql =" and regionId = "+regionId ;
		       sqlString+=regionIdsql;
    	}
		if( no!=null&& !no.equals("")){
			String noString = "";
			noString = " and deviceNo like "+"'%"+no+"%'" ;
			sqlString += noString;
 	    }
		sqlString+=" order by id asc";
        Query query = createQuery(sqlString);
		logger.debug("sql:"+ sqlString);
		return new ArrayList<Lift>(query.list());
	}
	
	@Override
	public Page getPagedHeaters(int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery(GET_HEATERS,pageIndex,pageSize);
	}
	
	@Override
	public Page getPagedHeatersBySearch(String hqlCondition,int pageIndex, int pageSize,
			Map<String,Object> mapCondition) throws DataAccessException {
		return pagedQuery(GET_HEATERS+hqlCondition,pageIndex,pageSize,mapCondition);
	}
	
	@Override
	public List<Heater> getHeaterList(String no,String buildId, String regionId) throws DataAccessException {
		String sqlString = "from Heater where 1=1";
		if( buildId!=null&& !buildId.equals("")){
		       String buildIdsql = "";
		       buildIdsql =" and buildId = "+buildId ;
		       sqlString+=buildIdsql;
     	}
		if( regionId!=null&& !regionId.equals("")){
		       String regionIdsql = "";
		       regionIdsql =" and regionId = "+regionId ;
		       sqlString+=regionIdsql;
    	}
		if( no!=null&& !no.equals("")){
			String noString = "";
			noString = " and deviceNo like "+"'%"+no+"%'" ;
			sqlString += noString;
 	    }
		sqlString+=" order by id asc";
        Query query = createQuery(sqlString);
		logger.debug("sql:"+ sqlString);
		return new ArrayList<Heater>(query.list());
	}
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Session getSession() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession();
	}

	@Override
	public Set<Class<?>> getTypes() {
		// TODO Auto-generated method stub
		return dataTypes;
	}

	@Override
	public boolean canBeMerged(Object o) {
		// TODO Auto-generated method stub
		return true;
	}

}
