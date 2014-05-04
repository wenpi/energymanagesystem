package com.managementsystem.energy.dao.impl;

import java.util.Arrays;
import java.util.HashMap;
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

import com.managementsystem.energy.dao.EnergydictDao;
import com.managementsystem.energy.domain.Energydict;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class EnergydictDaoImpl extends AbstractDaoSupport implements
		EnergydictDao {
	
	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { Energydict.class }));

	private final String GET_ENERGYDICTS="from Energydict order by energydictId";
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Page getEnergydicts(int pageIndex, int pageSize,Map<String,Object> mapParams)
			throws DataAccessException {
		return pagedQuery(GET_ENERGYDICTS,pageIndex,pageSize,mapParams);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Energydict> getEnergydicts() {
		Query query = createQuery(GET_ENERGYDICTS,null,null);
		return new LinkedHashSet<Energydict>(query.list());
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
