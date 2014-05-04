package com.managementsystem.energy.dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.managementsystem.energy.dao.EnergypublicityDao;
import com.managementsystem.energy.domain.Buildgrouprelainfo;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.util.dao.AbstractDaoSupport;

@Repository
public class EnergypublicityDaoImpl extends AbstractDaoSupport implements EnergypublicityDao {
	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { Buildinfo.class }));
	
	@Autowired
	private SessionFactory sessionFactory;

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
	public List<Buildinfo>getBuildinfoListByBuildgroupId(String buildgroupId) throws DataAccessException{
		Query query = createQuery("from Buildgrouprelainfo where buildgroupinfo.buildgroupId = "+buildgroupId +"order by buildinfo.buildId desc");
		List <Buildgrouprelainfo> list = new ArrayList<Buildgrouprelainfo>(query.list());
		List <Buildinfo> BuildinfoList = new ArrayList<Buildinfo>();
		for(int i=0;i<list.size();i++){
			Buildinfo buildinfo = new Buildinfo();
			buildinfo =  list.get(i).getBuildinfo();
		    BuildinfoList.add(buildinfo);
		}
		return BuildinfoList;
		
	}
}
