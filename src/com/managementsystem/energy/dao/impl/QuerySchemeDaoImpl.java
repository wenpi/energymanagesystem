package com.managementsystem.energy.dao.impl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.QuerySchemeDao;
import com.managementsystem.energy.domain.QueryScheme;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class QuerySchemeDaoImpl extends AbstractDaoSupport implements
		QuerySchemeDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(
			Arrays.asList(new Class<?>[] { QueryScheme.class }));

	private final static String FINDBYCATEGORYID = "from QueryScheme where buildId=? and categoryId = ?";

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Set<QueryScheme> findAllQueryScheme(String buildId, int startResult,
			int maxRows) throws DataAccessException {
		Query query = null;
		if (StringUtils.hasLength(buildId)) {
			query = createQuery("from QueryScheme where buildId=?",
					startResult, maxRows, buildId);
		} else {
			query = createQuery("from QueryScheme", startResult, maxRows);
		}
		return new LinkedHashSet<QueryScheme>(query.list());
	}

	@Override
	public Set<QueryScheme> findChildQuerySchemesByParentId(String schemeId)
			throws DataAccessException {
		String querySql = "from QueryScheme where _parentId=?";
		Query query = createQuery(querySql, schemeId);
		return new LinkedHashSet<QueryScheme>(query.list());
	}

	@Override
	public Set<QueryScheme> findByCategoryId(String buildId, String categoryId)
			throws DataAccessException {
		Query query = createQuery(FINDBYCATEGORYID, buildId, categoryId);
		return new LinkedHashSet<QueryScheme>(query.list());
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

		return false;
	}

	@Override
	public Page getAllQueryScheme(int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery("from QueryScheme order by buildId", pageIndex,
				pageSize);
	}

	@Override
	public List<QueryScheme> getQuerySchemeListByCondition(String id, String name, String comments, String buildId, String regionId) {
		String sqlString = "from QueryScheme where 1=1";

		if (id != null && !id.equals("")) {
			sqlString += " and id like '%" + id + "%'";
		}
		if (name != null && !name.equals("")) {
			sqlString += " and name like '%" + name + "%'";
		}
		if (buildId != null && !buildId.equals("")) {
			sqlString += " and buildId = '" + buildId + "'";
		}
		if (regionId != null && !regionId.equals("")) {
			sqlString += " and regionId = '" + regionId + "'";
		}
		if (comments != null && !comments.equals("")) { 
			sqlString += " and comments like '%" + comments + "%'";
		}
		System.out.println("query: " + sqlString);
		
		Query query = null;
		try {
			query = createQuery(sqlString);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return query.list();
	}
	
}
