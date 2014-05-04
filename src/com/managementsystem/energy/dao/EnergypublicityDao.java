package com.managementsystem.energy.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.util.dao.DaoSupport;

public interface EnergypublicityDao extends DaoSupport {
	

	public List<Buildinfo> getBuildinfoListByBuildgroupId(String buildgroupId) throws DataAccessException;
	
}
