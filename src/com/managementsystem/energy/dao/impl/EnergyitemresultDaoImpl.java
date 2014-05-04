package com.managementsystem.energy.dao.impl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.managementsystem.energy.dao.EnergyitemresultDao;
import com.managementsystem.energy.domain.Energyitemresult;
import com.managementsystem.util.dao.AbstractDaoSupport;

@Repository
public class EnergyitemresultDaoImpl extends AbstractDaoSupport implements
		EnergyitemresultDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { Energyitemresult.class }));
	
	private final String GET_ENERGYITEMRESULT_BY_METERID = "from Energyitemresult where meteruseinfo.meterId=?";
	
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public Set<Energyitemresult> getEnergyitemresultByMeterId(String meterId)
			throws DataAccessException {
		Query query = createQuery(GET_ENERGYITEMRESULT_BY_METERID,0,-1,meterId);
		return new LinkedHashSet<Energyitemresult>(query.list());
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
