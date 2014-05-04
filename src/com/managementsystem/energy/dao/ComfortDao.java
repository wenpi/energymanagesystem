package com.managementsystem.energy.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Meteruseinfo;
import com.managementsystem.util.dao.DaoSupport;

/**
 * 装表支路拓扑结构数据操作接口类
 * */
public interface ComfortDao extends DaoSupport {
	
	public List <Meteruseinfo> getMeteruseinfos(String regionId)
			throws DataAccessException;
}
