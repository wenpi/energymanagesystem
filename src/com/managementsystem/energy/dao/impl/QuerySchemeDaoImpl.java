package com.managementsystem.energy.dao.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
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
	public List<QueryScheme> getQuerySchemeListByCondition(String id, String name, String comments, String buildId, String regionId, String order) {
		String sqlString = "from QueryScheme where 1=1";

		if (id != null && !id.equals("")) {
			sqlString += " and id like '" + id + "'";
		}
		if (name != null && !name.equals("")) {
			sqlString += " and name like '" + name + "'";
		}
		if (buildId != null && !buildId.equals("")) {
			sqlString += " and buildId = '" + buildId + "'";
		}
		if (regionId != null && !regionId.equals("")) {
			sqlString += " and regionId = '" + regionId + "'";
		}
		if (comments != null && !comments.equals("")) { 
			sqlString += " and comments like '" + comments + "'";
		}

		// 排序
		if (order != null && !order.equals("")) { 
			sqlString += " order by " + order ;
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
	
	@Override
	public Map<String, Object> getDataListByCondition(String id, String name, String comments, String category_id, String region_id) {
		String sqlString = "from QueryScheme where 1=1 and name not like '%_VSD_%' ";
		
		if (id != null && !id.equals("")) {
			sqlString += " and id like '%" + id + "%' ";
		}
		if (name != null && !name.equals("")) {
			sqlString += " and name like '%" + name + "%'";
			if (region_id != null && !region_id.equals("")) { 
				sqlString += " and regionId = '" + region_id + "' and name <> 'number_on' ";
			}
		}
		if (category_id != null && !category_id.equals("")) {
			sqlString += " and category_id = '" + category_id + "' ";
		}
		if (comments != null && !comments.equals("")) { 
			sqlString += " and comments like '%" + comments + "%' ";
		}
		System.out.println("query: " + sqlString);
		
		Query query = null;
		try {
			query = createQuery(sqlString);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		
		List<QueryScheme> list = query.list();
		String _name = "", _id = "", _ispd = "", _comments = "";
		for (int i = 0; i < list.size(); i++) {
			QueryScheme qs = list.get(i);
			_name += qs.getName() + (list.size() == (i + 1) ? "" : ",");
			_id += qs.getId() + (list.size() == (i + 1) ? "" : ",");
			_ispd += qs.getIspd() + (list.size() == (i + 1) ? "" : ",");
			if(category_id.equals("ahu") || category_id.equals("fau") || category_id.equals("acu") ) {
				_comments += qs.getId() + (list.size() == (i + 1) ? "" : ",");
			} else {
				_comments += qs.getComments() + (list.size() == (i + 1) ? "" : ",");
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", _name);
		map.put("id", _id);
		map.put("ispd", _ispd);
		map.put("comments", _comments);
		
		return map;
	}
	
}
