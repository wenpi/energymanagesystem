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

import com.managementsystem.energy.dao.EnergyitemdictDao;
import com.managementsystem.energy.domain.Energyitemdict;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class EnergyitemdictDaoImpl extends AbstractDaoSupport implements
		EnergyitemdictDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { Energyitemdict.class }));
	
	private final String GET_ENERGYITEMDICTS="from Energyitemdict";
	private final String GET_PAGED_ENERGYITEMDICTS="from Energyitemdict order by energyItemcode asc";
	private final String GET_ENERGYITEMDICTS_BY_TYPE="from Energyitemdict where energyItemtype=0 order by energyItemcode asc";
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public Set<Energyitemdict> getEnergyitemdicts(int startResult, int maxRows)
			throws DataAccessException {
		Query query = createQuery(GET_ENERGYITEMDICTS,startResult,maxRows);
		return new LinkedHashSet<Energyitemdict>(query.list());
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public Set<Energyitemdict> getEnergyitemdictsByType()
			throws DataAccessException {
		Query query = createQuery(GET_ENERGYITEMDICTS_BY_TYPE,0,-1);
		return new LinkedHashSet<Energyitemdict>(query.list());
	}



	@Override
	public Page getPagedEnergyitemdicts(int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery(GET_PAGED_ENERGYITEMDICTS,pageIndex,pageSize);
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
	
	@Override
	public Page getPagedEnergyitemdict(int pageIndex, int pageSize,Map<String,Object> mapParams)
			throws DataAccessException {
		return pagedQuery(GET_PAGED_ENERGYITEMDICTS ,pageIndex,pageSize,mapParams);
	}
	
	@Override
	public Page getPagedEnergyitemdictsByType(int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery(GET_ENERGYITEMDICTS_BY_TYPE,pageIndex,pageSize);
	}

}
