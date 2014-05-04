package com.managementsystem.energy.dao.impl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.managementsystem.energy.dao.DatacenterDao;
import com.managementsystem.energy.domain.Datacenterinfo;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class DatacenterDaoImpl extends AbstractDaoSupport implements
		DatacenterDao {
	
	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { Datacenterinfo.class }));
	
	//数据中心
	private final String GET_DATACENTERS="from Datacenterinfo";
	private final String GET_PAGED_DATACENTERS="from Datacenterinfo";
	private final String GET_DATACENTERS_BY_TYPE="from Datacenterinfo where datecenterType=?";
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public Set<Datacenterinfo> getDatacenters(int startResult, int maxRows)
			throws DataAccessException {
		Query query = createQuery(GET_DATACENTERS,startResult,maxRows);
		return new LinkedHashSet<Datacenterinfo>(query.list());
	}

	@Override
	public Page getPagedDatacenters(int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery(GET_PAGED_DATACENTERS,pageIndex,pageSize);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Datacenterinfo> getDatacentersByType(int type, int startResult,
			int maxRows) throws DataAccessException {
		Query query = createQuery(GET_DATACENTERS_BY_TYPE,startResult,maxRows,type);
		return new LinkedHashSet<Datacenterinfo>(query.list());
	}

	@Override
	public Page getPagedDatacentersByType(int type, int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery(GET_DATACENTERS_BY_TYPE,pageIndex,pageSize,type);
	}
	
	@Override
	public Page getPagedDatacentersBySearch(String hqlCondition,int pageIndex, int pageSize,
			Map<String,Object> mapCondition) throws DataAccessException {
		return pagedQuery(GET_DATACENTERS+hqlCondition,pageIndex,pageSize,mapCondition);
	}

	@Override
	public boolean canBeMerged(Object arg0) {	
		return true;
	}

	@Override
	public Session getSession() {	
		return sessionFactory.getCurrentSession();
	}

	@Override
	public Set<Class<?>> getTypes() {
		return dataTypes;
	}

}
