package com.managementsystem.energy.dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.managementsystem.energy.dao.BigdistrictinfoDao;
import com.managementsystem.energy.domain.Bigdistrictinfo;
import com.managementsystem.energy.domain.Bigdistrictrelainfo;
import com.managementsystem.energy.domain.Districtinfo;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class BigdistrictinfoDaoImpl extends AbstractDaoSupport implements
		BigdistrictinfoDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { Bigdistrictinfo.class }));
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private final static String GET_BIGDISTRICTINFOS="from Bigdistrictinfo order by orderNo asc,bigdistrictId asc";
	private final static String GET_ROOT_BIGDISTRICTINFOS="from Bigdistrictinfo where (bigdistrictinfo is null or bigdistrictinfo.bigdistrictId='') order by orderNo asc,bigdistrictId asc";
	//private final static String GET_DISTRICTINFOS_BY_BIGDISTRICTID="select r.districtinfo from Bigdistrictrelainfo r where r.bigdistrictinfo.bigdistrictId=?";
	private final static String GET_DISTRICTINFOS_BY_BIGDISTRICTID="from Bigdistrictrelainfo b where b.bigdistrictinfo.bigdistrictId=?";
	
	
	@SuppressWarnings("unchecked")
	@Override
	public Set<Bigdistrictinfo> getBigdistrictinfos(int startResult, int maxRows)
			throws DataAccessException {
		Query query = createQuery(GET_BIGDISTRICTINFOS,startResult,maxRows);
		return new LinkedHashSet<Bigdistrictinfo>(query.list());
	}

	@Override
	public Page getBigdistrictinfos(int pageIndex, int pageSize,
			Map<String, Object> mapParams) throws DataAccessException {
		if(mapParams==null)
			mapParams = new HashMap<String,Object>();
		return pagedQuery(GET_BIGDISTRICTINFOS ,pageIndex,pageSize,mapParams);
	}
	
	@Override
	public Bigdistrictinfo getBigdistrictinfo(Districtinfo districtinfo) throws DataAccessException {
		Bigdistrictinfo  bigdistrictinfo= new Bigdistrictinfo();
		Query query = createQuery("from Bigdistrictrelainfo where districtinfo.districtId=? ",districtinfo.getDistrictId());
		if(query.list().size()>0){
		Bigdistrictrelainfo  bigdistrictrelainfo= new Bigdistrictrelainfo();
		bigdistrictrelainfo = new ArrayList<Bigdistrictrelainfo>(query.list()).get(0);
		bigdistrictinfo = bigdistrictrelainfo.getBigdistrictinfo();
		}
		return  bigdistrictinfo;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Bigdistrictinfo> getRootBigdistrictinfos(int startResult,
			int maxRows) throws DataAccessException {
		Query query = createQuery(GET_ROOT_BIGDISTRICTINFOS,startResult,maxRows);
		return new LinkedHashSet<Bigdistrictinfo>(query.list());
	}

	@Override
	public Page getDistrictinfosByBigdistrictId(int pageIndex, int pageSize,
			String bigdistrictId) throws DataAccessException {
		return pagedQuery(GET_DISTRICTINFOS_BY_BIGDISTRICTID ,pageIndex,pageSize,bigdistrictId);
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

}
