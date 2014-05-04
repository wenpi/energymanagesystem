package com.managementsystem.energy.dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.managementsystem.energy.dao.EnergyStandardDao;
import com.managementsystem.energy.domain.EnergyItemStandardDetail;
import com.managementsystem.energy.domain.EnergyRegionalStandardDetail;
import com.managementsystem.energy.domain.EnergyStandard;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class EnergyStandardDaoImpl extends AbstractDaoSupport implements
		EnergyStandardDao {

	
	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(
			Arrays.asList(new Class<?>[] { EnergyStandard.class,
					EnergyItemStandardDetail.class,
					EnergyRegionalStandardDetail.class }));

	
	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Page findEnergyStandards(int pageIndex, int pageSize,
			Map<String, Object> mapCondition) throws DataAccessException {
		
		if(mapCondition==null)
			mapCondition = new HashMap<String,Object>();	
		final String querySql = "from EnergyStandard order by isdefault desc";
		
		return pagedQuery(querySql,pageIndex,pageSize,mapCondition);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<EnergyStandard> findDefaultEnergyStandards(int startResult,
			int maxRows) throws DataAccessException {
		
		final String querySql = "from EnergyStandard where isdefault=1 ";
		
		Query query = createQuery(querySql,startResult,maxRows);
		
		return new HashSet<EnergyStandard>(query.list());
	}

	@Override
	public Set<EnergyStandard> findDefaultEnergyStandards()
			throws DataAccessException {
		return findDefaultEnergyStandards(0,-1);
	}

	@Override
	public Set<EnergyStandard> findEnergyStandardsByType(int startResult,
			int maxRows, String type, int isDefault) throws DataAccessException {
		
		final String querySql = "from EnergyStandard where standardType=? and isdefault=? ";
		Query query = createQuery(querySql,startResult,maxRows,type,isDefault);
		
		return new HashSet<EnergyStandard>(query.list());
	}

	@Override
	public Set<EnergyStandard> findDefaultEnergyStandardsByType(
			int startResult, int maxRows, String type)
			throws DataAccessException {
		return findEnergyStandardsByType(startResult,maxRows,type,1);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<EnergyItemStandardDetail> findEnergyItemStandardDetails(
			String standardId) throws DataAccessException {

		final String querySql = "from EnergyItemStandardDetail where energyStandard.standardId=?";	
		Query query = createQuery(querySql,standardId);
		
		return new HashSet<EnergyItemStandardDetail>(query.list());
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<EnergyRegionalStandardDetail> findEnergyRegionalStandardDetails(
			String standardId) throws DataAccessException {
		final String querySql = "from EnergyRegionalStandardDetail where energyStandard.standardId=?";	
		Query query = createQuery(querySql,standardId);
		return new HashSet<EnergyRegionalStandardDetail>(query.list());
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<EnergyStandard> energyStandardList(String standardType)  throws DataAccessException {
		final String querySql = "from EnergyStandard where  isdefault=1 and standardType=?";	
		Query query = createQuery(querySql,standardType);
		return new ArrayList<EnergyStandard>(query.list());
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
