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

import com.managementsystem.energy.dao.MeterproDao;
import com.managementsystem.energy.domain.Meterparaminfo;
import com.managementsystem.energy.domain.Meterproinfo;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class MeterproDaoImpl extends AbstractDaoSupport implements MeterproDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { Meterproinfo.class,Meterparaminfo.class }));
	
	private final String GET_METERPROINFOS = "from Meterproinfo order by meterProductid asc";
	private final String GET_METERPROINFOS_BY_TYPE = "from Meterproinfo where meterType=?";
	private final String Get_Meterproinfos_By_Name = "from Meterproinfo where meterProductname=?";
	private final String GET_METERPROINFOS_BY_PRODUCTER = "from Meterproinfo where meterProducter=?";
	private final String GET_METERPARAMINFOS_BY_PRODUCTID = "from Meterparaminfo where meterproinfo.meterProductid=?";
	private final String COUNT_METERPARAMINFOS_BY_PRODUCTID = "select count(*) from Meterparaminfo where meterproinfo.meterProductid=?";
	private final String MAX_METERPARAMID_BY_PRODUCTID = "from Meterparaminfo  where meterproinfo.meterProductid=? order by meterParamid desc";
	private final String GET_MAX_METERPROINFO_BY_PRODUCTIDID="from Meterproinfo order by meterProductid desc";
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Page getMeterproinfos(int pageIndex, int pageSize,Map<String, Object> mapParams)
			throws DataAccessException {
		return pagedQuery(GET_METERPROINFOS,pageIndex,pageSize,mapParams);
	}

	@Override
	public Page getMeterproinfosByType(int type, int pageIndex, int pageSize)
			throws DataAccessException {
		return pagedQuery(GET_METERPROINFOS_BY_TYPE,pageIndex,pageSize,type);
	}

	@Override
	public Page getMeterproinfosByName(String productname, int pageIndex,
			int pageSize) throws DataAccessException {
		return pagedQuery(Get_Meterproinfos_By_Name,pageIndex,pageSize,productname);
	}

	@Override
	public Page getMeterproinfosByProducter(String producter, int pageIndex,
			int pageSize) throws DataAccessException {
		return pagedQuery(GET_METERPROINFOS_BY_PRODUCTER,pageIndex,pageSize,producter);
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public Meterproinfo getMaxMeterproinfoByProductidId()
			throws DataAccessException {	
		List resultList = createQuerySingleResult(GET_MAX_METERPROINFO_BY_PRODUCTIDID).list();
		if(resultList.size()>0)
			return (Meterproinfo)resultList.get(0); 
		else
			return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Meterparaminfo> getMeterparaminfosByProductid(
			String meterProductid) throws DataAccessException {
		Query query = createQuery(GET_METERPARAMINFOS_BY_PRODUCTID,meterProductid);
		return new LinkedHashSet<Meterparaminfo>(query.list());
	}

	
	@Override
	public Integer countMeterparaminfosByProductid(String meterProductid)
			throws DataAccessException {
		return (Integer) createQuerySingleResult(COUNT_METERPARAMINFOS_BY_PRODUCTID,meterProductid)
		.list().get(0);
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public Meterparaminfo maxMeterParamidByProductid(String meterProductid)
			throws DataAccessException {	
		List resultList = createQuerySingleResult(MAX_METERPARAMID_BY_PRODUCTID,meterProductid).list();
		if(resultList.size()>0)
			return (Meterparaminfo)resultList.get(0); 
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
