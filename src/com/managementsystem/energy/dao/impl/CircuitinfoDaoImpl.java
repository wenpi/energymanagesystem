package com.managementsystem.energy.dao.impl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.CircuitinfoDao;
import com.managementsystem.energy.domain.Circuitinfo;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class CircuitinfoDaoImpl extends AbstractDaoSupport implements
		CircuitinfoDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { Circuitinfo.class }));
	
	private final String GET_CIRCUITINFOS="from Circuitinfo order by buildinfo.buildId asc,circuitId asc";
	private final String GET_CIRCUITINFOS_BY_BUILDID="from Circuitinfo where buildinfo.buildId=? order by circuitId";
	private final String GET_PARENT_CIRCUITINFOS="from Circuitinfo where (circuitinfo.circuitId is null or circuitinfo.circuitId='')";
	private final String GET_MAX_CIRCUITINFO_BY_BUILDID="from Circuitinfo where buildinfo.buildId=? order by circuitId desc";
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public Set<Circuitinfo> getCircuitinfos(String buildId, int startResult,
			int maxRows) throws DataAccessException {
		Query query = null;
		if(StringUtils.hasLength(buildId)) {
			query = createQuery(GET_CIRCUITINFOS_BY_BUILDID,startResult,maxRows,buildId);
		} else {
			query = createQuery(GET_CIRCUITINFOS,startResult,maxRows);
		}
		return new LinkedHashSet<Circuitinfo>(query.list());
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Circuitinfo> getParentCircuitinfos(String buildId,
			int startResult, int maxRows) throws DataAccessException {
		Query query = createQuery(GET_PARENT_CIRCUITINFOS,startResult,maxRows,buildId);
		return new LinkedHashSet<Circuitinfo>(query.list());
	}
	
	

	@Override
	public Page getCircuitinfos(int pageIndex, int pageSize,
			Map<String, Object> mapParams) throws DataAccessException {
		return pagedQuery(GET_CIRCUITINFOS ,pageIndex,pageSize,mapParams);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Circuitinfo getMaxCircuitinfoByBuildId(String buildId)
			throws DataAccessException {
		List list = createQuerySingleResult(GET_MAX_CIRCUITINFO_BY_BUILDID,buildId).list();
		if(list.size()>0)
			return (Circuitinfo)list.get(0);
		else
			return null;
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
