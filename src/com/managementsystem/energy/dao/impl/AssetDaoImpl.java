package com.managementsystem.energy.dao.impl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.managementsystem.energy.dao.AssetDao;
import com.managementsystem.energy.domain.Asset;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class AssetDaoImpl extends AbstractDaoSupport implements AssetDao {
	
	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(
			Arrays.asList(new Class<?>[] { Asset.class }));
	
	private final static String FINDALL = "from Asset";
	private final static String FINDBYASSETNUM = "from asset where assetnum = ?";
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Page findAll(int pageIndex, int pageSize,
			Map<String, Object> mapParams) throws DataAccessException {
		return pagedQuery(FINDALL ,pageIndex,pageSize,mapParams);
	}

	@Override
	public Asset findOne(long assetuid) throws DataAccessException {
		
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Asset> findByAssetnum(String assetnum)
			throws DataAccessException {
		Query query = createQuery(FINDBYASSETNUM,0,-1,assetnum);
		return query.list();
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
		return false;
	}

}
