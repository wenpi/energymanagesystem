package com.managementsystem.energy.dao.impl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.managementsystem.energy.dao.CalcformulaDao;
import com.managementsystem.energy.domain.Calcformula;
import com.managementsystem.util.dao.AbstractDaoSupport;

@Repository
public class CalcformulaDaoImpl extends AbstractDaoSupport implements
		CalcformulaDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(Arrays.asList(new Class<?>[] { Calcformula.class }));
	
	private final String GET_CALCFORMULAS="from Calcformula order by formulaId asc";
	private final String GET_CALCFORMULAS_BY_BUILDID="from Calcformula where buildinfo.buildId=?";
	private final String GET_CALCFORMULAS_BY_ENERGYITEMCODE="from Calcformula where buildinfo.buildId=? and energyitemdict.energyItemcode=?";
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public Set<Calcformula> getCalcformulas(int startResult, int maxRows)
			throws DataAccessException {
		Query query = createQuery(GET_CALCFORMULAS,startResult,maxRows);
		return new LinkedHashSet<Calcformula>(query.list());
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Calcformula> getCalcformulasByBuildId(String buildId,
			int startResult, int maxRows) throws DataAccessException {
		Query query = createQuery(GET_CALCFORMULAS_BY_BUILDID,startResult,maxRows,buildId);
		return new LinkedHashSet<Calcformula>(query.list());
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Calcformula> getCalcformulasByEnergyItemcode(String buildId,
			String energyItemcode, int startResult, int maxRows)
			throws DataAccessException {
		Query query = createQuery(GET_CALCFORMULAS_BY_ENERGYITEMCODE,startResult,maxRows,buildId,energyItemcode);
		return new LinkedHashSet<Calcformula>(query.list());
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
