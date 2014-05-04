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

import com.managementsystem.energy.dao.DictionaryDao;
import com.managementsystem.energy.domain.Dictgroup;
import com.managementsystem.energy.domain.Dictitem;
import com.managementsystem.util.dao.AbstractDaoSupport;

@Repository
public class DictionaryDaoImpl extends AbstractDaoSupport implements
		DictionaryDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { Dictgroup.class,Dictitem.class }));
	
	private final String GET_DICTGROUIES="from Dictgroup order by groupCode asc";
	private final String GET_DICTITEM_BY_GROUPCODE="from Dictitem where dictgroup.groupCode=? order by id asc";
	private final String GET_ALL_DICTITEMS = "from Dictitem order by dictgroup.groupCode asc,id asc";
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public Set<Dictgroup> getDictgroups() throws DataAccessException {
		Query query = createQuery(GET_DICTGROUIES);
		return new LinkedHashSet<Dictgroup>(query.list());
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Dictitem> getDictitemBygroupCode(String groupCode)
			throws DataAccessException {
		Query query = createQuery(GET_DICTITEM_BY_GROUPCODE,groupCode);
		return new LinkedHashSet<Dictitem>(query.list());
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Dictitem> getAllDictitems() throws DataAccessException {
		Query query = createQuery(GET_ALL_DICTITEMS);
		return new LinkedHashSet<Dictitem>(query.list());
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
