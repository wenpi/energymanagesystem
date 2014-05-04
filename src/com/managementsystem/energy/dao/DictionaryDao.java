package com.managementsystem.energy.dao;

import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Dictgroup;
import com.managementsystem.energy.domain.Dictitem;
import com.managementsystem.util.dao.DaoSupport;

/**
 * 数据字典操作数据库操作接口
 * 
 * @author CHENPING 2012-6-13
 * */
public interface DictionaryDao extends DaoSupport {

	/**
	 * 返回所有数据字典组
	 * 
	 * @return 数据字典组对象列表
	 * */
	public Set<Dictgroup> getDictgroups() throws DataAccessException;

	/**
	 * 返回数据字典项列表
	 * 
	 * @param groupCode
	 *            字典组代码
	 * 
	 * @return 数据字典项列表
	 * */
	public Set<Dictitem> getDictitemBygroupCode(String groupCode)
			throws DataAccessException;

	/**
	 * 返回所有数据字典项
	 * */
	public Set<Dictitem> getAllDictitems() throws DataAccessException;

}
