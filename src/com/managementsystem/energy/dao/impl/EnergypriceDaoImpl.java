package com.managementsystem.energy.dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.managementsystem.energy.dao.EnergypriceDao;
import com.managementsystem.energy.domain.Articlecategory;
import com.managementsystem.energy.domain.Energyprice;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class EnergypriceDaoImpl extends AbstractDaoSupport implements
    EnergypriceDao {
	
	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { Energyprice.class }));

	private final String GET_ENERGYDICTS="from Energyprice order by priceid";
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Page getListEnergyprice(int pageIndex, int pageSize,Map<String,Object> mapParams)
			throws DataAccessException {
		return pagedQuery(GET_ENERGYDICTS,pageIndex,pageSize,mapParams);
	}
	
	@Override
	public Energyprice getEnergypriceByenergydictId(String energydictId) throws DataAccessException{
		Query query = createQuery("from Energyprice where energydict.energydictId=? ",energydictId);
		Energyprice  energyprice = new Energyprice();
		energyprice = new ArrayList<Energyprice>(query.list()).get(0);
		return  energyprice;
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
