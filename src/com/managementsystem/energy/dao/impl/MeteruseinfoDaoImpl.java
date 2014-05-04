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

import com.managementsystem.energy.dao.MeteruseinfoDao;
import com.managementsystem.energy.domain.Meteruseattribute;
import com.managementsystem.energy.domain.Meteruseinfo;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class MeteruseinfoDaoImpl extends AbstractDaoSupport implements
		MeteruseinfoDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(
			Arrays.asList(new Class<?>[] { Meteruseinfo.class }));

	private final String GET_METERUSEINFOS = "from Meteruseinfo order by meterId asc";
	private final String GET_METERUSEINFOS_BY_CIRCUITID = "from Meteruseinfo where circuitinfo.circuitId=? order by meterId asc";
	private final String GET_METERUSEINFOS_BY_REGIONID = "from Meteruseinfo where buildregioninfo.regionId=? order by meterId asc";
	private final String GET_METERUSEINFOS_BY_METERPRODUCTID = "from Meteruseinfo where meterproinfo.meterProductid=? order by meterId asc";
	private final String GET_METERUSEATTRIBUTE_BY_METERID = "from Meteruseattribute where meteruseinfo.meterId=?";
	private final String GET_MAX_METERUSEINFO_BY_BUILDID = "from Meteruseinfo where circuitinfo.buildinfo.buildId=? order by meterId desc";
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public Set<Meteruseinfo> getMeteruseinfos(int startResult, int maxRows)
			throws DataAccessException {
		Query query = createQuery(GET_METERUSEINFOS, startResult, maxRows);
		return new LinkedHashSet<Meteruseinfo>(query.list());
	}

	@Override
	public Page getMeteruseinfos(int pageIndex, int pageSize,
			Map<String, Object> mapParams) throws DataAccessException {
		return pagedQuery(GET_METERUSEINFOS, pageIndex, pageSize, mapParams);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Meteruseinfo> getMeteruseinfosByCircuitId(String circuitId,
			int startResult, int maxRows) throws DataAccessException {
		Query query = createQuery(GET_METERUSEINFOS_BY_CIRCUITID, startResult,
				maxRows, circuitId);
		return new LinkedHashSet<Meteruseinfo>(query.list());
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Meteruseinfo> getMeteruseinfosByRegionId(String regionId,
			int startResult, int maxRows) throws DataAccessException {
		Query query = createQuery(GET_METERUSEINFOS_BY_REGIONID, startResult,
				maxRows, regionId);
		return new LinkedHashSet<Meteruseinfo>(query.list());
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Meteruseinfo> getMeteruseinfosByMeterProductid(
			String meterProductid, int startResult, int maxRows)
			throws DataAccessException {
		Query query = createQuery(GET_METERUSEINFOS_BY_METERPRODUCTID,
				startResult, maxRows, meterProductid);
		return new LinkedHashSet<Meteruseinfo>(query.list());
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Meteruseattribute> getMeteruseattributeByMeterId(String meterId)
			throws DataAccessException {
		Query query = createQuery(GET_METERUSEATTRIBUTE_BY_METERID, meterId);
		return new LinkedHashSet<Meteruseattribute>(query.list());
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Meteruseinfo getMaxMeteruseinfoForMeterId(Meteruseinfo meteruseinfo)
			throws DataAccessException {
		String buildId = meteruseinfo.getCircuitinfo().getBuildinfo()
				.getBuildId();

		List resultList = createQuerySingleResult(
				GET_MAX_METERUSEINFO_BY_BUILDID, buildId).list();
		if (resultList.size() > 0)
			if (resultList.get(0) instanceof Meteruseinfo) {
				return (Meteruseinfo) resultList.get(0);
			} else {
				return null;
			}
		else
			return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Meteruseinfo> getMeteruseinfosByMeterBuildid(String buildId,
			int startResult, int maxRows) throws DataAccessException {
		Query query = createQuery(GET_MAX_METERUSEINFO_BY_BUILDID, startResult,
				maxRows, buildId);
		return new LinkedHashSet<Meteruseinfo>(query.list());
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Meteruseattribute> getMeteruseattributesByBuildId(String buildId)
			throws DataAccessException {
		String GET_METERUSEATTRIBUTES_BY_BUILDID = "select attr from Meteruseattribute attr,Meteruseinfo meter,"
				+ "Circuitinfo circuit,Energyitemresult result,Energyitemdict dict where attr.meteruseinfo.meterId=meter.meterId"
				+ " and circuit.circuitId=meter.circuitinfo.circuitId and result.meteruseinfo.meterId=meter.meterId "
				+ " and result.energyitemdict.energyItemcode=dict.energyItemcode and attr.meterattrType=0 and circuit.buildinfo.buildId=?"
				+ " and dict.energydict.energydictId in (select t.energydict.energydictId from Energyitemdict t where t.energyItemtype=0)";

		/*
		 * String GET_METERUSEATTRIBUTES_BY_ENERGYITEMCODE =
		 * "select attr from Meteruseattribute attr,Meteruseinfo meter," +
		 * "Circuitinfo circuit,Energyitemresult result,Energyitemdict dict where attr.meteruseinfo.meterId=meter.meterId"
		 * +
		 * " and circuit.circuitId=meter.circuitinfo.circuitId and result.meteruseinfo.meterId=meter.meterId "
		 * +
		 * " and result.energyitemdict.energyItemcode=dict.energyItemcode and circuit.buildinfo.buildId=?"
		 * + " and dict.energyItemcode=?";
		 */

		Query query = createQuery(GET_METERUSEATTRIBUTES_BY_BUILDID, 0, -1,
				buildId);
		return new LinkedHashSet<Meteruseattribute>(query.list());
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
