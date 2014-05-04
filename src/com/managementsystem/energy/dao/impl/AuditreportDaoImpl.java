package com.managementsystem.energy.dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
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

import com.managementsystem.energy.dao.AuditreportDao;
import com.managementsystem.energy.domain.Articlecategory;
import com.managementsystem.energy.domain.Auditreport;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class AuditreportDaoImpl extends AbstractDaoSupport implements
		AuditreportDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(
			Arrays.asList(new Class<?>[] { Auditreport.class }));
	private final String GET_REPORTLISTS = "from Auditreport order by version desc";

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Set<Auditreport> getAuditreportsByBuildid(String buildId,
			int startResult, int maxRows) throws DataAccessException {

		return null;
	}

	@Override
	public Set<Auditreport> getAuditreportsByUserid(String userid,
			int startResult, int maxRows) throws DataAccessException {

		return null;
	}

	@Override
	public Auditreport getAuditreportList(String portletId)
			throws DataAccessException {
		Query query = createQuery(
				"from Auditreport where articleid=? order by version desc",
				portletId);
		Auditreport auditreport = new Auditreport();
		if (new ArrayList<Auditreport>(query.list()).size() > 0) {
			auditreport = new ArrayList<Auditreport>(query.list()).get(0);
		}
		return auditreport;
	}

	public Auditreport getAuditreport(String reportid)
			throws DataAccessException {
		return (Auditreport) getSession().get(Auditreport.class, reportid);
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

	@Override
	public Page auditreportList(int pageIndex, int pageSize,
			Map<String, Object> mapParams) throws DataAccessException {
		return pagedQuery(GET_REPORTLISTS, pageIndex, pageSize, mapParams);
	}
	
	@Override
	public List<Auditreport>getAllAuditreportList() throws DataAccessException{
		Query query = createQuery("from Auditreport  order by createdondate desc");
		return  new ArrayList<Auditreport>(query.list());
	}
	
	@Override
	public List<Auditreport>auditreportListByBuild() throws DataAccessException{
		Query query = createQuery("from Auditreport  order by buildId desc");
		return  new ArrayList<Auditreport>(query.list());
	}
}
