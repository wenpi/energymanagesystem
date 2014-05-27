package com.managementsystem.energy.dao.impl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.CircuitinfoDao;
import com.managementsystem.energy.dao.OtherDao;
import com.managementsystem.energy.domain.Circuitinfo;
import com.managementsystem.energy.domain.Reportinfo;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class OtherDaoImpl extends AbstractDaoSupport implements OtherDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(
			Arrays.asList(new Class<?>[] { Reportinfo.class }));
	
	private final String GET_CIRCUITINFO_TIME_LIST = "select distinct year, month from Circuitinfo where circuitText=? order by year desc, month desc";

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public void addReportinfo(Reportinfo reportinfo) throws Exception {
		save(reportinfo);
		flush();
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
