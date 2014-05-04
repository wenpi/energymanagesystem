package com.managementsystem.energy.dao.impl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.managementsystem.energy.dao.BuildgroupDao;
import com.managementsystem.energy.domain.Buildgroupinfo;
import com.managementsystem.energy.domain.Buildgrouprelainfo;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class BuildgroupDaoImpl extends AbstractDaoSupport implements
		BuildgroupDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { Buildinfo.class,Buildgroupinfo.class,Buildgrouprelainfo.class }));
	
	private final String GET_BUILDGROUIES = "from Buildgroupinfo order by buildgroupId";
	private final String GET_BUILDGROUIES_BY_DATACENTERID="from Buildgroupinfo g inner join fetch g.buildinfos b where b.datacenterinfo.datecenterId=?";
	private final String MAX_BUILDGROUPINFO_BY_BUILDGROUPID = "from Buildgroupinfo where substring(buildgroupId,1,6)=? order by buildgroupId desc";
	private final String GET_BUILDINFOS_BY_BUILDGROUPID = "select b from Buildinfo b,Buildgrouprelainfo r where b.buildId=r.id.buildId and r.id.buildgroupId=? order by b.buildId asc";
	
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public Set<Buildgroupinfo> getBuildgroups(int startResult, int maxRows)
			throws DataAccessException {
		Query query = createQuery(GET_BUILDGROUIES,startResult,maxRows);
		return new LinkedHashSet<Buildgroupinfo>(query.list());
	}
	

	@Override
	public Page getBuildgroups(int pageIndex, int pageSize,
			Map<String, Object> mapParams) {
		return pagedQuery(GET_BUILDGROUIES,pageIndex,pageSize,mapParams);
	}


	@SuppressWarnings("unchecked")
	@Override
	public Set<Buildgroupinfo> getBuildgrouiesByDatacenterId(
			String datacenterId, int startResult, int maxRows)
			throws DataAccessException {
		Query query = createQuery(GET_BUILDGROUIES_BY_DATACENTERID,startResult,maxRows,datacenterId);
		return new LinkedHashSet<Buildgroupinfo>(query.list());
	}

	@SuppressWarnings("unchecked")
	@Override
	public  Set<Buildinfo> getBuildinfosByBuildgroupId(int startResult, int maxRows,
			String BuildgroupId) throws DataAccessException {
		String sql = "select b.* from buildinfo b,buildgrouprelainfo r where b.build_id=r.build_id and r.buildgroup_id=? order by b.build_id asc";
		SQLQuery query = createSQLQuery(sql,null,null,BuildgroupId);
		query.addEntity(Buildinfo.class);
		return new LinkedHashSet<Buildinfo>(query.list());
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Buildgroupinfo maxBuildgroupinfoByBuildDistrictid(String buildDistrictid) throws DataAccessException {
		List resultList = createQuerySingleResult(MAX_BUILDGROUPINFO_BY_BUILDGROUPID,buildDistrictid).list();
		if(resultList.size()>0)
			return (Buildgroupinfo)resultList.get(0); 
		else
			return null;

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
