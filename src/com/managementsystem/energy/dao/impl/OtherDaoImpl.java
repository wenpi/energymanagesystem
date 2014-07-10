package com.managementsystem.energy.dao.impl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.managementsystem.energy.dao.OtherDao;
import com.managementsystem.energy.domain.Reportinfo;
import com.managementsystem.energy.domain.Temp;
import com.managementsystem.util.dao.AbstractDaoSupport;

@Repository
public class OtherDaoImpl extends AbstractDaoSupport implements OtherDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(
			Arrays.asList(new Class<?>[] { Reportinfo.class }));

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addReportinfo(Reportinfo reportinfo) throws Exception {
		save(reportinfo);
		flush();
	}

	@Override
	public void addTemp(Temp temp) throws Exception {
		Session session = sessionFactory.openSession();
		session.save(temp);
		session.flush();
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
