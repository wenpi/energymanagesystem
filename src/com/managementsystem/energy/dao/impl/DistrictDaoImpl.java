package com.managementsystem.energy.dao.impl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.managementsystem.energy.domain.Districtinfo;
import com.managementsystem.energy.dao.DistrictDao;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class DistrictDaoImpl extends AbstractDaoSupport implements DistrictDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { Districtinfo.class }));
	
	private final String GET_DISTRICTS="from Districtinfo order by districtId asc";
	private final String GET_ROOT_DISTRICTS="from Districtinfo where (districtinfo is null or districtinfo.districtId='')  order by districtId asc";
	private final String GET_DISTRICTS_BY_PARENTID="from Districtinfo where districtinfo.districtId=?  order by districtId asc";
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public Set<Districtinfo> getAllDistricts(int startResult, int maxRows)
			throws DataAccessException {
		Query query = createQuery(GET_DISTRICTS,startResult,maxRows);	
		return new LinkedHashSet<Districtinfo>(query.list());
	}

	@Override
	public Page getDistricts(int pageIndex, int pageSize,Map<String,Object> mapParams)
			throws DataAccessException {
		return pagedQuery(GET_DISTRICTS ,pageIndex,pageSize,mapParams);
	}
	
	
	@Override
	public Page getDistrictsByCriterion(int pageIndex, int pageSize,
			Map<String, Object> mapParams) throws DataAccessException {
		
		Criteria criteria = getSession().createCriteria(Districtinfo.class);
		int i = 0;
		for(Iterator<String> iterator = mapParams.keySet().iterator();iterator.hasNext();) {
			String key = iterator.next();
			Object value = mapParams.get(key);
			Criterion c = Restrictions.like(key, value);
			criteria.add(c);
			i++;

		}
		long totalCount = (Long) criteria.setProjection(  
                Projections.rowCount()).uniqueResult();  
        criteria.setProjection(null);  	
		
		if (totalCount < 1)
			return new Page();
		if(pageIndex<1)
			pageIndex = 1;
		
		int firstResult = Page.getStartOfPage(pageIndex, pageSize);
		criteria.setFirstResult(firstResult < 0 ? DEFAULT_FIRST_RESULT_INDEX : firstResult);
		if (pageSize > 0)
			criteria.setMaxResults(pageSize);
		List list = criteria.list();
		return new Page(firstResult, totalCount, pageSize, list);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Districtinfo> getRootDistricts(int startResult, int maxRows) throws DataAccessException {
		Query query = createQuery(GET_ROOT_DISTRICTS,startResult,maxRows);	
		return new LinkedHashSet<Districtinfo>(query.list());
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Districtinfo> getDistrictsByParentId(String districtId,int startResult, int maxRows)
			throws DataAccessException {
		Query query = createQuery(GET_DISTRICTS_BY_PARENTID,startResult,maxRows,districtId);	
		return new LinkedHashSet<Districtinfo>(query.list());
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
