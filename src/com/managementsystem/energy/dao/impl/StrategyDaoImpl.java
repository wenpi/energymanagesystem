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

import com.managementsystem.energy.dao.StrategyDao;

import com.managementsystem.energy.domain.Strategy;
import com.managementsystem.energy.domain.Strategydetail;
import com.managementsystem.energy.domain.Strategydetailparam;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class StrategyDaoImpl extends AbstractDaoSupport implements StrategyDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(
			Arrays.asList(new Class<?>[] { Strategy.class }));

	private final String GET_STRATEGIES = "from Strategy";
	private final String GET_PARENT_STRATEGIES = "from Strategy where buildinfo.buildId=? and (strategy is null or strategy.strategyid='')";
	private final String GET_PAGED_STRATEGIES = "from Strategy";
	private final String GET_STRATEGYDETAILS="from Strategydetail where strategy.strategyid=?";
	private final String GET_STRATEGYDETAILPARAMS_BY_DETAILID="from Strategydetailparam where strategydetail.detailid=? order by paramtypeid";
	private final String GET_STRATEGYDETAILPARAMS_BY_TYPEID="from Strategydetailparam where strategydetail.detailid=? and paramtypeid=?";
	private final String DELETE_STRATEGYDETAIL_PARAMS = "delete from Strategydetailparam where strategydetail.detailid=?";
	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public Set<Strategy> getStrategies(String buildId, int startResult,
			int maxRows) throws DataAccessException {
		Query query = createQuery(GET_STRATEGIES, startResult, maxRows);
		return new LinkedHashSet<Strategy>(query.list());
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Strategy> getParentStrategies(String buildId, int startResult,
			int maxRows) throws DataAccessException {
		Query query = createQuery(GET_PARENT_STRATEGIES, startResult, maxRows,buildId);
		return new LinkedHashSet<Strategy>(query.list());
	}

	@Override
	public Page getStrategies(String buildId, int pageIndex, int pageSize,
			Map<String, Object> mapParams) throws DataAccessException {
		if(!"".equals(buildId)) {
			mapParams.put("buildinfo.buildId", buildId);
		}
		return pagedQuery(GET_PAGED_STRATEGIES, pageIndex, pageSize, mapParams);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Strategydetail> getStrategydetails(String strategyid) throws DataAccessException {
		Query query = createQuery(GET_STRATEGYDETAILS, -1,-1,strategyid);
		return new LinkedHashSet<Strategydetail>(query.list());
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public Set<Strategydetailparam> getStrategydetailparamsBydetailid(
			String detailid)  throws DataAccessException {
		Query query = createQuery(GET_STRATEGYDETAILPARAMS_BY_DETAILID, -1,-1,detailid);
		return new LinkedHashSet<Strategydetailparam>(query.list());
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Strategydetailparam> getStrategydetailparams(String detailid,
			Integer paramtypeid)  throws DataAccessException {
		Query query = createQuery(GET_STRATEGYDETAILPARAMS_BY_TYPEID, -1,-1,detailid,paramtypeid);
		return new LinkedHashSet<Strategydetailparam>(query.list());
	}
	


	@Override
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public Set<Class<?>> getTypes() {
		return dataTypes;
	}

	@Override
	public boolean canBeMerged(Object o) {
		return true;
	}

}
