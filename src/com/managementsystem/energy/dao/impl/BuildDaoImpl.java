package com.managementsystem.energy.dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
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

import com.managementsystem.energy.dao.BuildDao;
import com.managementsystem.energy.domain.Buildaddfile;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class BuildDaoImpl extends AbstractDaoSupport implements BuildDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { Buildinfo.class }));
	
	private final String GET_ALL_BUILDS = "from Buildinfo order by buildId";
	private final String GET_BUILDINFOS_BY_DATACENTERID = "from Buildinfo where datacenterinfo.datacenterId=? order by buildId";
	private final String GET_BUILDINFOS = "from Buildinfo order by buildId";
	private final String GET_BUILDADDFILES = "from Buildaddfile where buildinfo.buildId=? order by buildinfo.buildId asc,addfileDate asc";
	private final String GET_BUILDADDFILES_BY_FUNCTYPE="from Buildaddfile where buildinfo.buildId=? and addfileFunctype=? order by buildinfo.buildId asc,addfileDate asc";
	private final String GET_BUILDINFOS_BY_BUILDGROUPID="from Buildinfo b,Buildgroupinfo g inner join b.buildgroupinfos gs where gs.buildgroupId=?";
	private final String GET_PURS="from Buildinfo order by buildId asc";
	private final String GET_BUILDCOVER="from Buildaddfile where buildCover=true and addfileFunctype=0 and buildinfo.buildId=?";
	private final String GET_BUILDINFOS_BY_BIGDISTRICTID = "select b from Buildinfo b,Bigdistrictrelainfo r where (b.buildDistrictid=r.districtinfo.districtId) and (r.bigdistrictinfo.bigdistrictId=?)";
	private final String GET_MAXBUILDID_BY_DATECENTERID = "from Buildinfo where datacenterinfo.datacenterId=? order by buildId desc";
	private final String GET_ALL_BUILDS_List = "from Buildinfo";
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void setBuildcover(Buildaddfile buildaddfile)
			throws DataAccessException {
		String batchsql = "update Buildaddfile a set a.buildCover=false where a.buildinfo.buildId='"+ buildaddfile.getBuildinfo().getBuildId() +"'";
		String sql = "update Buildaddfile a set a.buildCover=true where a.addfileId='"+ buildaddfile.getAddfileId() +"'";
		Query batchQuery = createQuery(batchsql);
		batchQuery.executeUpdate();
		Query query = createQuery(sql);
		query.executeUpdate();
	}
	
	@Override
	public  List<Buildinfo> getBuildinfo ()
			throws DataAccessException {
		Query query = createQuery(GET_ALL_BUILDS_List);
		return new ArrayList<Buildinfo>(query.list());
	}

	
	@Override
	public Buildaddfile getBuildcover(String buildId)
			throws DataAccessException {		
		return (Buildaddfile)executeQuerySingleResult(GET_BUILDCOVER,buildId);
	}



	@SuppressWarnings("unchecked")
	@Override
	public Set<Buildinfo> getAllBuilds(int startResult, int maxRows)
			throws DataAccessException {
		Query query = createQuery(GET_ALL_BUILDS,startResult,maxRows);
		return new LinkedHashSet<Buildinfo>(query.list());
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public Set<Buildinfo> getBuildinfosByBigdistrictId(String bigdistrictId)
			throws DataAccessException {
		Query query = createQuery(GET_BUILDINFOS_BY_BIGDISTRICTID,0,-1,bigdistrictId);
		return new LinkedHashSet<Buildinfo>(query.list());
	}


	@Override
	public Page getBuildinfosByDatacenterId(String datecenterId, int pageIndex,
			int pageSize) throws DataAccessException {
		return pagedQuery(GET_BUILDINFOS_BY_DATACENTERID,pageIndex,pageSize,datecenterId);
	}

	@Override
	public Page getBuildinfos(int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery(GET_BUILDINFOS,pageIndex,pageSize);
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public Set<Buildaddfile> getBuildaddfilesByBuildid(int startResult, int maxRows,
			String buildId) throws DataAccessException {
		Query query = createQuery(GET_BUILDADDFILES,startResult,maxRows,buildId);
		return new LinkedHashSet<Buildaddfile>(query.list());
	}

	@Override
	public Page getBuildaddfiles(String buildId, int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery(GET_BUILDADDFILES,pageIndex,pageSize,buildId);
	}

	@Override
	public Page getBuildaddfilesByFunctype(String buildId, int functype,
			int pageIndex, int pageSize) throws DataAccessException {
		return pagedQuery(GET_BUILDADDFILES_BY_FUNCTYPE,pageIndex,pageSize,buildId,functype);
	}

	@Override
	public Page getBuildinfosByBuildgroupId(String buildgroupId, int pageIndex,
			int pageSize) throws DataAccessException {
		return pagedQuery(GET_BUILDINFOS_BY_BUILDGROUPID,pageIndex,pageSize,buildgroupId);
	}
	

	@Override
	public Buildinfo getMaxBuildIdByDatecenterId(String datacenterId)
			throws DataAccessException {
		List list = createQuerySingleResult(GET_MAXBUILDID_BY_DATECENTERID,datacenterId).list();
		if(list.size()>0)
			return (Buildinfo)list.get(0);
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
	
	@Override
	public Page getBuildinfos(int pageIndex, int pageSize,Map<String,Object> mapParams)
			throws DataAccessException {
		return pagedQuery(GET_PURS ,pageIndex,pageSize,mapParams);
	}


	@Override
	public Set<Buildinfo> findBuildinfosByBuildfunc(
			int buildfunc,int topnum) throws DataAccessException {
		String sql = null;
		Query query = null;
		if(buildfunc==0) {
			sql = "from Buildinfo order by buildId";
			query = createQuery(sql,0,topnum);
		} else {
			sql = "from Buildinfo where buildFunction=? order by buildId";
			query = createQuery(sql,0,topnum,buildfunc);
		}
		return new LinkedHashSet<Buildinfo>(query.list());
	}

}
