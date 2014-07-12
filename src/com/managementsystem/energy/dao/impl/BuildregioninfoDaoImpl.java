package com.managementsystem.energy.dao.impl;

import java.util.Arrays;
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

import com.managementsystem.energy.dao.BuildregioninfoDao;
import com.managementsystem.energy.domain.Buildregioninfo;
import com.managementsystem.energy.domain.Circuitinfo;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class BuildregioninfoDaoImpl extends AbstractDaoSupport implements
		BuildregioninfoDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { Buildregioninfo.class }));
	
	private final String GET_BUILDREGIONINFOS="from Buildregioninfo where buildinfo.buildId=?";
	private final String GET_PARENT_BUILDREGIONINFOS="from Buildregioninfo where (buildregioninfo.regionId is null or buildregioninfo.regionId='') and buildinfo.buildId=?";
	private final String GET_BUILDREGIONINFOS_BY_PARENTID="from Buildregioninfo where buildregioninfo.regionId=?";
	private final String GET_PAGEED_BUILDREGIONINFOS="from Buildregioninfo order by regionId asc";
	private final String GET_ALL_BUILDREGIONINFOS="from Buildregioninfo order by regionId asc";
	private final String GET_MAX_BUILDREGIONINFO_BY_BUILDID = "from Buildregioninfo where buildinfo.buildId=? order by regionId desc";
	
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public Set<Buildregioninfo> getBuildregioninfos(String buildId,
			int startResult, int maxRows) throws DataAccessException {
		Query query = null;
		if(StringUtils.hasLength(buildId)) {
			query = createQuery(GET_BUILDREGIONINFOS,startResult,maxRows,buildId);	
		} else {
			query = createQuery(GET_PAGEED_BUILDREGIONINFOS,startResult,maxRows);	
		}
		return new LinkedHashSet<Buildregioninfo>(query.list());
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Buildregioninfo> getAllBuildregioninfos() throws DataAccessException {
		Query query = createQuery(GET_ALL_BUILDREGIONINFOS, 0, 100);	
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Buildregioninfo> getParentBuildregioninfos(String buildId,
			int startResult, int maxRows) throws DataAccessException {
		Query query = createQuery(GET_PARENT_BUILDREGIONINFOS,startResult,maxRows,buildId);	
		return new LinkedHashSet<Buildregioninfo>(query.list());
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Set<Buildregioninfo> getBuildregioninfosByParentId(String parentId)
			throws DataAccessException {
		Query query = createQuery(GET_BUILDREGIONINFOS_BY_PARENTID,0,-1,parentId);	
		return new LinkedHashSet<Buildregioninfo>(query.list());
	}

	@Override
	public Page getBuildregioninfos(String buildId,int pageIndex, int pageSize,
			Map<String, Object> mapParams) throws DataAccessException {
		mapParams.put("build_Id", buildId);
		return pagedQuery(GET_PAGEED_BUILDREGIONINFOS ,pageIndex,pageSize,mapParams);
	}

	@Override
	public Buildregioninfo getMaxBuildregioninfoByBuildId(String buildId)
			throws DataAccessException {
		List list = createQuerySingleResult(GET_MAX_BUILDREGIONINFO_BY_BUILDID,buildId).list();
		return (list.size()>0) ? (Buildregioninfo)list.get(0) : null;
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
