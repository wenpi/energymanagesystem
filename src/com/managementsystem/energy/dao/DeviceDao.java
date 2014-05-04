package com.managementsystem.energy.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Ahu;
import com.managementsystem.energy.domain.Boi;
import com.managementsystem.energy.domain.Chi;
import com.managementsystem.energy.domain.Ct;
import com.managementsystem.energy.domain.Fcu;
import com.managementsystem.energy.domain.Heater;
import com.managementsystem.energy.domain.Lift;
import com.managementsystem.energy.domain.Lighting;
import com.managementsystem.energy.domain.Pump;
import com.managementsystem.energy.domain.Vav;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;


public interface DeviceDao  extends DaoSupport {
	/**
	 * 
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedChis(int pageIndex,int pageSize) throws DataAccessException;
	
	/**
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedChisBySearch(String hql,int pageIndex,int pageSize,Map<String,Object> mapCondition) throws DataAccessException;
	
	public List<Chi> getChiList(String no,String buildId, String regionId) throws DataAccessException;

	/**
	 * 
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedBois(int pageIndex,int pageSize) throws DataAccessException;
	
	/**
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedBoisBySearch(String hql,int pageIndex,int pageSize,Map<String,Object> mapCondition) throws DataAccessException;
	
	public List<Boi> getBoiList(String no,String buildId, String regionId) throws DataAccessException;
	/**
	 * 
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedPumps(int pageIndex,int pageSize) throws DataAccessException;
	
	/**
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedPumpsBySearch(String hql,int pageIndex,int pageSize,Map<String,Object> mapCondition) throws DataAccessException;
	
	public List<Pump> getPumpList(String no,String buildId, String regionId) throws DataAccessException;
	/**
	 * 
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedCts(int pageIndex,int pageSize) throws DataAccessException;
	
	/**
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedCtsBySearch(String hql,int pageIndex,int pageSize,Map<String,Object> mapCondition) throws DataAccessException;
	
	public List<Ct> getCtList(String no,String buildId, String regionId) throws DataAccessException;
	
	/**
	 * 
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedAhus(int pageIndex,int pageSize) throws DataAccessException;
	
	/**
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedAhusBySearch(String hql,int pageIndex,int pageSize,Map<String,Object> mapCondition) throws DataAccessException;
	
	public List<Ahu> getAhuList(String no,String buildId, String regionId) throws DataAccessException;
	
	/**
	 * 
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedFcus(int pageIndex,int pageSize) throws DataAccessException;
	
	/**
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedFcusBySearch(String hql,int pageIndex,int pageSize,Map<String,Object> mapCondition) throws DataAccessException;
	
	public List<Fcu> getFcuList(String no,String buildId, String regionId) throws DataAccessException;
	
	/**
	 * 
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedVavs(int pageIndex,int pageSize) throws DataAccessException;
	
	/**
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedVavsBySearch(String hql,int pageIndex,int pageSize,Map<String,Object> mapCondition) throws DataAccessException;
	
	public List<Vav> getVavList(String no,String buildId, String regionId) throws DataAccessException;
	
	/**
	 * 
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedLightings(int pageIndex,int pageSize) throws DataAccessException;
	
	/**
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedLightingsBySearch(String hql,int pageIndex,int pageSize,Map<String,Object> mapCondition) throws DataAccessException;
	
	public List<Lighting> getLightingList(String no,String buildId, String regionId) throws DataAccessException;
	
	/**
	 * 
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedLifts(int pageIndex,int pageSize) throws DataAccessException;
	
	/**
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedLiftsBySearch(String hql,int pageIndex,int pageSize,Map<String,Object> mapCondition) throws DataAccessException;
	
	public List<Lift> getLiftList(String no,String buildId, String regionId) throws DataAccessException;
	
	/**
	 * 
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedHeaters(int pageIndex,int pageSize) throws DataAccessException;
	
	/**
	 * 
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示条目 
	 * */
	public Page getPagedHeatersBySearch(String hql,int pageIndex,int pageSize,Map<String,Object> mapCondition) throws DataAccessException;
	
	public List<Heater> getHeaterList(String no,String buildId, String regionId) throws DataAccessException;

}
