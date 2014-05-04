package com.managementsystem.energy.dao;

import java.util.Map;
import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Energydict;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;

/**
 * 能源基本设置数据操作接口
 * 
 * @author CHENPING 2012-06-14
 * */
public interface EnergydictDao extends DaoSupport {
	
	/**
	 * 获取能耗基本设置
	 * 
	 * @param pageIndex 当前索引页
	 * @param pageSize  每页显示条目数
	 * 
	 * @return 能耗基本列表
	 * */
	public Page getEnergydicts(int pageIndex,int pageSize,Map<String,Object> mapParams) throws DataAccessException;
	
	public Set<Energydict> getEnergydicts() throws DataAccessException;
}
