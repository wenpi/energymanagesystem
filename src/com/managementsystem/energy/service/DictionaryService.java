package com.managementsystem.energy.service;

import java.util.Map;
import java.util.Set;

import com.managementsystem.energy.domain.Dictgroup;
import com.managementsystem.energy.domain.Dictitem;
import com.managementsystem.util.dao.Page;

/**
 * 数据字典服务接口类
 * */
public interface DictionaryService {
	
	/**
	 * 新增字典类别
	 * 
	 * @param dictgroup 字典类别
	 * */
	public void addDictgroup(Dictgroup dictgroup);
	
	/**
	 * 更新字典类别
	 * 
	 * @param dictgroup 更新字典类别
	 * */
	public void updateDictgroup(Dictgroup dictgroup);
	
	/**
	 * 删除字典类别
	 * 
	 * @param groupCode 字典类别代码
	 * */
	public void deleteDictgroup(String groupCode);
	
	/**
	 * 返回指定的数据字典分组对象
	 * 
	 * @param groupCode 字典组代码
	 * 
	 * @return 返回数据字典组对象
	 * */
	public Dictgroup getDictgroup(String groupCode) ;
	
	/**
	 * 新增数据字典项
	 * @param dictitem 数据字典项
	 * */
	public void addDictitem(Dictitem dictitem);
	
	
	/**
	 * 更新数据字典项
	 * @param dictitem 数据字典项
	 * */
	public void updateDictitem(Dictitem dictitem);
	
	/**
	 * 删除数据字典项
	 * @param itemid 数据字典项ID
	 * */
	public void deleteDictitem(String itemid);
	
	
	/**
	 * 获取数据字典项
	 * 
	 * @param itemid 数据字典项ID
	 * 
	 * @return 数据字典信息
	 * */
	public Dictitem getDictitem(String itemid);
	
	
	/**
	 * 返回所有数据字典组
	 * 
	 * @return 数据字典组对象列表
	 * */
	public Set<Dictgroup> getDictgroups();
	
	/**
	 * 返回数据字典项列表
	 * 
	 * @param groupCode 字典组代码
	 * 
	 * @return 数据字典项列表
	 * */
	public Set<Dictitem> getDictitemBygroupCode(String groupCode);
	
	/**
	 * 获取指定字典代码的数据字典项
	 * 
	 * @param groupCode 字典组代码
	 * 
	 * @param groupCode 字典代码
	 * 
	 * @return 数据字典项实体
	 * */
	public Dictitem getDictitemByItemcode(String groupCode,String itemCode);
	
	/**
	 * 获取所有数据字典
	 * */
	public Set<Dictitem> getAllDictitems();
	
}
