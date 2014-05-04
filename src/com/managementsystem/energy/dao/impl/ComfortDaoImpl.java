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

import com.managementsystem.energy.dao.ComfortDao;
import com.managementsystem.energy.domain.Meterproinfo;
import com.managementsystem.energy.domain.Meteruseattribute;
import com.managementsystem.energy.domain.Meteruseinfo;
import com.managementsystem.util.dao.AbstractDaoSupport;

@Repository
public class ComfortDaoImpl extends AbstractDaoSupport implements
       ComfortDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { ComfortDao.class }));
	String GET_METERPROINFO = "from Meterproinfo t where t.meterType=7";
	private final String GET_METERUSEINFOS_BY_REGIONID = "from Meteruseinfo where buildregioninfo.regionId=? order by meterId asc";
	
	@Override
	public List <Meteruseinfo> getMeteruseinfos(String regionId)
				 throws DataAccessException {
		
		    ArrayList<Meteruseinfo> listMeteruseinfo = new ArrayList<Meteruseinfo>();
		    Query query = createQuery(GET_METERUSEINFOS_BY_REGIONID, regionId);
		    ArrayList<Meteruseinfo> list = new ArrayList<Meteruseinfo>(query.list());
		    Query queryMeterproinfo = createQuery(GET_METERPROINFO);
		    ArrayList<Meterproinfo> listMeterproinfo = new ArrayList<Meterproinfo>(queryMeterproinfo.list());
			for(int i = 0 ; i<list.size(); i++ ){
				Meteruseinfo meteruseinfo = list.get(i);
				for(int j = 0 ; j<listMeterproinfo.size(); j++ ){
					Meterproinfo meterproinfo = listMeterproinfo.get(j);
					   if(meteruseinfo.getMeterproinfo().getMeterProductid().equals(meterproinfo.getMeterProductid())){
						   listMeteruseinfo.add(meteruseinfo);
						   break;
					   }
				}
		}
			return listMeteruseinfo;
	}
	
	@Autowired
	private SessionFactory sessionFactory;
	
	

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
