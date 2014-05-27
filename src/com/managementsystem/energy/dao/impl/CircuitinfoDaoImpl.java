package com.managementsystem.energy.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
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

import com.managementsystem.energy.dao.CircuitinfoDao;
import com.managementsystem.energy.domain.Circuitinfo;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class CircuitinfoDaoImpl extends AbstractDaoSupport implements
		CircuitinfoDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(
			Arrays.asList(new Class<?>[] { Circuitinfo.class }));

	private final String GET_CIRCUITINFOS = "from Circuitinfo order by buildinfo.buildId asc,circuitId asc";
	private final String GET_CIRCUITINFOS_BY_BUILDID = "from Circuitinfo where buildinfo.buildId=? order by circuitId";
	private final String GET_PARENT_CIRCUITINFOS = "from Circuitinfo where (circuitinfo.circuitId is null or circuitinfo.circuitId='')";
	private final String GET_MAX_CIRCUITINFO_BY_BUILDID = "from Circuitinfo where buildinfo.buildId=? order by circuitId desc";
	private final String DELETE_CIRCUITINFO_BY_TEXT = "delete Circuitinfo where source=?";
	private final String GET_CIRCUITINFO_TIME_LIST = "select distinct time from Reportinfo where source=? order by time desc";

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public Set<Circuitinfo> getCircuitinfos(String buildId, int startResult,
			int maxRows) throws DataAccessException {
		Query query = null;
		if (StringUtils.hasLength(buildId)) {
			query = createQuery(GET_CIRCUITINFOS_BY_BUILDID, startResult, maxRows, buildId);
		} else {
			query = createQuery(GET_CIRCUITINFOS, startResult, maxRows);
		}
		return new LinkedHashSet<Circuitinfo>(query.list());
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Circuitinfo> getCircuitinfosByText(String buildId, String text,
			int startResult, int maxRows) throws DataAccessException {
		Query query = null;
		if (StringUtils.hasLength(buildId)) {
			
			query = createQuery(GET_CIRCUITINFOS_BY_BUILDID, startResult, maxRows, buildId);
		
		} else {
			
			String GET_CIRCUITINFOS_BY_TEXT = "from Circuitinfo where source=? order by buildinfo.buildId asc,circuitId asc";
			
			query = createQuery(GET_CIRCUITINFOS_BY_TEXT, startResult, maxRows, text);
				
		}
		return new LinkedHashSet<Circuitinfo>(query.list());
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Circuitinfo> getCircuitTimeList(String year, String text) throws DataAccessException {
		Query query = createQuery(GET_CIRCUITINFO_TIME_LIST, text); // , Integer.parseInt(year)
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> getCircuitDataList(String time, String text, String treeIds) throws DataAccessException {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<Object> totalList = new ArrayList<Object>();
		
		if(time != null && StringUtils.hasLength(time)) {

			String[] tArray = time.split(",");
			
			for(int i = 0; i < tArray.length; i++ ) {
				
				String year = tArray[i].substring(0, 4);
				
				String month = tArray[i].substring(5); 
				
				String GET_CIRCUITINFO_DATA_LIST = "from Circuitinfo where source=? and year=? and month=? and circuitCode in (select circuitCode from Circuitinfo where circuitId in (:ids)) order by year desc, month desc";
				
				Query query = createQuery(GET_CIRCUITINFO_DATA_LIST, text, Integer.parseInt(year), Integer.parseInt(month)); // , Integer.parseInt(year)
				
				if (treeIds != null && StringUtils.hasLength(treeIds)) {
					String[] ids = treeIds.split(","); // 分割选择的树节点
					query.setParameterList("ids", ids);
				}
				
				List<Circuitinfo> list = new ArrayList<Circuitinfo>();
				
				Set<Circuitinfo> circuitinfos = new LinkedHashSet<Circuitinfo>(query.list());
				for (Iterator<Circuitinfo> it = circuitinfos.iterator();it.hasNext();) {
					Circuitinfo cinfo = it.next();
					list.add(cinfo);
				}
				
				totalList.add(list);
			}
			
			resultMap.put("result", totalList);
			
		}
		
		return resultMap;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<Circuitinfo> getParentCircuitinfos(String buildId,
			int startResult, int maxRows) throws DataAccessException {
		Query query = createQuery(GET_PARENT_CIRCUITINFOS, startResult,
				maxRows, buildId);
		return new LinkedHashSet<Circuitinfo>(query.list());
	}

	@Override
	public void delCircuitinfoForWaterAndGas(String text,
			int year, int month) throws DataAccessException {
		Query query = createQuery(DELETE_CIRCUITINFO_BY_TEXT, text, year, month);
		query.executeUpdate();
	}

	@Override
	public Page getCircuitinfos(int pageIndex, int pageSize,
			Map<String, Object> mapParams) throws DataAccessException {
		return pagedQuery(GET_CIRCUITINFOS, pageIndex, pageSize, mapParams);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Circuitinfo getMaxCircuitinfoByBuildId(String buildId)
			throws DataAccessException {
		List list = createQuerySingleResult(GET_MAX_CIRCUITINFO_BY_BUILDID,
				buildId).list();
		if (list.size() > 0)
			return (Circuitinfo) list.get(0);
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
