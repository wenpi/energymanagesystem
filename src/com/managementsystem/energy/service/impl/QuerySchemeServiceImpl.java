package com.managementsystem.energy.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.managementsystem.energy.dao.QuerySchemeDao;
import com.managementsystem.energy.domain.QueryScheme;
import com.managementsystem.energy.service.QuerySchemeService;
import com.managementsystem.util.dao.Page;

@Service
public class QuerySchemeServiceImpl implements QuerySchemeService {

	private QuerySchemeDao querySchemeDao;

	@Autowired
	public QuerySchemeServiceImpl(QuerySchemeDao querySchemeDao) {
		this.querySchemeDao = querySchemeDao;
	}

	@Transactional(readOnly = true)
	public Set<QueryScheme> findAllQueryScheme(String buildId) {
		return querySchemeDao.findAllQueryScheme(buildId, 0, -1);
	}

	@Transactional(readOnly = true)
	public Set<QueryScheme> findChildQuerySchemesByParentId(String schemeId) {
		return querySchemeDao.findChildQuerySchemesByParentId(schemeId);
	}

	@Transactional(readOnly = true)
	public Page getAllQueryScheme(int pageIndex, int pageSize) {
		return querySchemeDao.getAllQueryScheme(pageIndex, pageSize);
	}
	
	@Transactional(readOnly = true)
	public List<QueryScheme> getQuerySchemeListByCondition(String id, String name, String comments, String buildId, String regionId) {
		return querySchemeDao.getQuerySchemeListByCondition(id, name, comments, buildId, regionId); 
	}

}
